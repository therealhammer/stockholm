{ config, lib, pkgs, ... }:

# TODO multiple users
# TODO inform about unused caches
# cache = url: "${cfg.dataDir}/.urlwatch/cache/${hashString "sha1" url}"

with import <stockholm/lib>;
let
  cfg = config.krebs.urlwatch;

  # TODO assert sendmail's existence
  out = {
    options.krebs.urlwatch = api;
    config = lib.mkIf cfg.enable imp;
  };

  api = {
    enable = mkEnableOption "krebs.urlwatch";

    dataDir = mkOption {
      type = types.str;
      default = "/var/lib/urlwatch";
      description = ''
        Directory where the urlwatch service should store its state.
      '';
    };
    from = mkOption {
      type = types.str;
      default = "${user.name}@${config.networking.hostName}.retiolum";
      description = ''
        Content of the From: header of the generated mails.
      '';
    };
    # TODO hooks :: attrsOf hook
    hooksFile = mkOption {
      type = with types; nullOr path;
      default = null;
      description = ''
        File to use as hooks.py module.
      '';
    };
    mailto = mkOption {
      type = types.str;
      default = config.krebs.build.user.mail;
      description = ''
        Content of the To: header of the generated mails. [AKA recipient :)]
      '';
    };
    onCalendar = mkOption {
      type = types.str;
      default = "04:23";
      description = ''
        Run urlwatch at this interval.
        The format is described in systemd.time(7), CALENDAR EVENTS.
      '';
    };
    urls = mkOption {
      type = with types; listOf (either str subtypes.job);
      default = [];
      description = "URL to watch.";
      example = [
        https://nixos.org/channels/nixos-unstable/git-revision
      ];
      apply = map (x: getAttr (typeOf x) {
        set = x;
        string = {
          url = x;
          filter = null;
        };
      });
    };
    verbose = mkOption {
      type = types.bool;
      default = false;
      description = ''
        verbose output of urlwatch
      '';
    };
  };

  urlsFile = pkgs.writeText "urls"
    (concatMapStringsSep "\n---\n" toJSON cfg.urls);

  hooksFile = cfg.hooksFile;

  configFile = pkgs.writeText "urlwatch.yaml" (toJSON {
    display = {
      error = true;
      new = true;
      unchanged = false;
    };
    report = {
      email = {
        enabled = false;
        from = "";
        html = false;
        smtp = {
          host = "localhost";
          keyring = true;
          port = 25;
          starttls = true;
        };
        subject = "{count} changes: {jobs}";
        to = "";
      };
      html.diff = "unified";
      stdout = {
        color = true;
        enabled = true;
      };
      text = {
        details = true;
        footer = true;
        line_length = 75;
      };
    };
  });

  imp = {
    systemd.timers.urlwatch = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = cfg.onCalendar;
        Persistent = "true";
      };
    };
    systemd.services.urlwatch = {
      path = with pkgs; [
        coreutils
        gnused
        urlwatch
      ];
      environment = {
        HOME = cfg.dataDir;
        LC_ALL = "en_US.UTF-8";
        LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
        SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      };
      serviceConfig = {
        User = user.name;
        PermissionsStartOnly = "true";
        PrivateTmp = "true";
        SyslogIdentifier = "urlwatch";
        Type = "oneshot";
        ExecStartPre =
          pkgs.writeDash "urlwatch-prestart" ''
            set -euf

            dataDir=$HOME

            if ! test -e "$dataDir"; then
              mkdir -m 0700 -p "$dataDir"
              chown ${user.name}: "$dataDir"
            fi
          '';
        ExecStart = pkgs.writeDash "urlwatch" ''
          set -euf

          cd /tmp

          urlwatch \
              ${optionalString cfg.verbose "-v"} \
              --config=${shell.escape configFile} \
              ${optionalString (hooksFile != null)
                "--hooks=${shell.escape hooksFile}"
              } \
              --urls=${shell.escape urlsFile} \
            > changes || :

          if test -s changes; then
            {
              echo Date: $(date -R)
              echo From: ${shell.escape cfg.from}
              echo Subject: $(
                sed -n 's/^\(CHANGED\|ERROR\|NEW\): //p' changes \
                  | tr '\n' ' '
              )
              echo To: ${shell.escape cfg.mailto}
              echo
              cat changes
            } | /run/wrappers/bin/sendmail -t
          fi
        '';
      };
    };
    users.extraUsers = singleton {
      inherit (user) name uid;
    };
  };

  user = rec {
    name = "urlwatch";
    uid = genid name;
  };

  subtypes.job = types.submodule {
    options = {
      url = mkOption {
        type = types.str;
      };
      filter = mkOption {
        type = with types; nullOr str; # TODO nullOr subtypes.filter
      };
    };
  };
in out
