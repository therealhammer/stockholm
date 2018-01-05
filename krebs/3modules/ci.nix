{ config, pkgs, ... }:
with import <stockholm/lib>;
let
  cfg = config.krebs.ci;

  hostname = config.networking.hostName;
in
{
  options.krebs.ci = {
    enable = mkEnableOption "krebs continous integration";
    stockholmSrc = mkOption {
      type = types.str;
      default = "http://cgit.${hostname}.r/stockholm";
    };
    treeStableTimer = mkOption {
      type = types.int;
      default = 10;
      description = "how long to wait until we test changes (in minutes)";
    };
    hosts = mkOption {
      type = types.listOf types.host;
      default = [];
      description = ''
        List of hosts that should be build
      '';
    };
    tests = mkOption {
      type = types.listOf types.str;
      default = [];
      description = ''
        List of tests that should be build
      '';
    };
  };

  config = mkIf cfg.enable {
    services.nginx = {
      enable = true;
      virtualHosts.build = {
        serverAliases = [ "build.${hostname}.r" ];
        locations."/".extraConfig = ''
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
          proxy_pass http://127.0.0.1:${toString config.krebs.buildbot.master.web.port};
        '';
      };
    };

    krebs.buildbot.master = {
      slaves = {
        testslave = "lasspass";
      };
      change_source.stockholm = ''
        stockholm_repo = '${cfg.stockholmSrc}'
        cs.append(
            changes.GitPoller(
                stockholm_repo,
                workdir='stockholm-poller', branches=True,
                project='stockholm',
                pollinterval=10
            )
        )
      '';
      scheduler = {
        build-scheduler = ''
          sched.append(
                schedulers.SingleBranchScheduler(
                    change_filter=util.ChangeFilter(branch_re=".*"),
                    treeStableTimer=${toString cfg.treeStableTimer}*60,
                    name="build-all-branches",
                    builderNames=[
                        ${optionalString (cfg.hosts != []) ''"hosts",''}
                        ${optionalString (cfg.tests != []) ''"tests",''}
                    ]
                )
          )
        '';
        force-scheduler = ''
          sched.append(
              schedulers.ForceScheduler(
                    name="force",
                    builderNames=[
                        ${optionalString (cfg.hosts != []) ''"hosts",''}
                        ${optionalString (cfg.tests != []) ''"tests",''}
                    ]
              )
          )
        '';
      };
      builder_pre = ''
        # prepare grab_repo step for stockholm
        grab_repo = steps.Git(
            repourl=stockholm_repo,
            mode='full'
        )

        # prepare addShell function
        def addShell(factory,**kwargs):
          factory.addStep(steps.ShellCommand(**kwargs))
      '';
      builder = {
        hosts = mkIf (cfg.hosts != []) ''
          f = util.BuildFactory()
          f.addStep(grab_repo)

          def build_host(user, host):
              addShell(f,
                  name="{}".format(host),
                  env={
                    "NIX_PATH": "secrets=/var/src/stockholm/null:/var/src",
                    "NIX_REMOTE": "daemon",
                    "dummy_secrets": "true",
                  },
                  command=[
                    "nix-shell", "-I", "stockholm=.", "--run", " ".join(["test",
                      "--user={}".format(user),
                      "--system={}".format(host),
                      "--force-populate",
                      "--target=$LOGNAME@${config.krebs.build.host.name}$HOME/{}".format(user),
                    ])
                  ],
                  timeout=90001
              )

          ${concatMapStringsSep "\n" (host:
             "build_host(\"${host.owner.name}\", \"${host.name}\")"
          ) cfg.hosts}

          bu.append(
              util.BuilderConfig(
                  name="hosts",
                  slavenames=slavenames,
                  factory=f
              )
          )
        '';
        tests = mkIf (cfg.tests != []) ''
          f = util.BuildFactory()
          f.addStep(grab_repo)

          def run_test(test):
              addShell(f,
                  name="{}".format(test),
                  env={
                    "NIX_PATH": "secrets=/var/src/stockholm/null:/var/src",
                    "NIX_REMOTE": "daemon",
                    "dummy_secrets": "true",
                  },
                  command=[
                    "nix-build", "-I", "stockholm=.", "krebs/6tests",
                    "-A", "{}".format(test)
                  ],
                  timeout=90001
              )

          ${concatMapStringsSep "\n" (test:
             "run_test(\"${test}\")"
          ) cfg.tests}

          bu.append(
              util.BuilderConfig(
                  name="tests",
                  slavenames=slavenames,
                  factory=f
              )
          )
        '';
      };
      enable = true;
      web.enable = true;
      irc = {
        enable = true;
        nick = "build|${hostname}";
        server = "irc.r";
        channels = [ "xxx" "noise" ];
        allowForce = true;
      };
      extraConfig = ''
        c['buildbotURL'] = "http://build.${hostname}.r/"
      '';
    };

    krebs.buildbot.slave = {
      enable = true;
      masterhost = "localhost";
      username = "testslave";
      password = "lasspass";
      packages = with pkgs; [ gnumake jq nix populate ];
    };

  };
}
