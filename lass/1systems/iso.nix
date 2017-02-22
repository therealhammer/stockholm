{ config, pkgs, ... }:

with import <stockholm/lib>;
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    ../../krebs
    ../3modules
    ../5pkgs
    ../2configs/binary-cache/client.nix
    ../2configs/mc.nix
    ../2configs/nixpkgs.nix
    ../2configs/vim.nix
    {
      krebs.enable = true;
      krebs.build.user = config.krebs.users.lass;
      krebs.build.host = config.krebs.hosts.iso;
      krebs.build.source.nixos-config.symlink = "stockholm/lass/1systems/${config.krebs.buil.host.name}.nix";
    }
    {
      nixpkgs.config.allowUnfree = true;
    }
    {
      users.extraUsers = {
        root = {
          openssh.authorizedKeys.keys = [
            config.krebs.users.lass.pubkey
            config.krebs.users.lass-shodan.pubkey
            config.krebs.users.lass-icarus.pubkey
          ];
        };
      };
    }
    {
      environment.extraInit = ''
        EDITOR=vim
      '';
    }
    {
      environment.systemPackages = with pkgs; [
      #stockholm
        git
        gnumake
        jq
        parallel
        proot
        populate

      #style
        most
        rxvt_unicode.terminfo

      #monitoring tools
        htop
        iotop

      #network
        iptables
        iftop

      #stuff for dl
        aria2

      #neat utils
        krebspaste
        pciutils
        pop
        psmisc
        q
        rs
        tmux
        untilport
        usbutils

      #unpack stuff
        p7zip
        unzip
        unrar

      #data recovery
        ddrescue
        ntfs3g
        dosfstools
      ];
    }
    {
      programs.bash = {
        enableCompletion = true;
        interactiveShellInit = ''
          HISTCONTROL='erasedups:ignorespace'
          HISTSIZE=65536
          HISTFILESIZE=$HISTSIZE

          shopt -s checkhash
          shopt -s histappend histreedit histverify
          shopt -s no_empty_cmd_completion
          complete -d cd
        '';
        promptInit = ''
          if test $UID = 0; then
            PS1='\[\033[1;31m\]\w\[\033[0m\] '
            PROMPT_COMMAND='echo -ne "\033]0;$$ $USER@$PWD\007"'
          elif test $UID = 1337; then
            PS1='\[\033[1;32m\]\w\[\033[0m\] '
            PROMPT_COMMAND='echo -ne "\033]0;$$ $PWD\007"'
          else
            PS1='\[\033[1;33m\]\u@\w\[\033[0m\] '
            PROMPT_COMMAND='echo -ne "\033]0;$$ $USER@$PWD\007"'
          fi
          if test -n "$SSH_CLIENT"; then
            PS1='\[\033[35m\]\h'" $PS1"
            PROMPT_COMMAND='echo -ne "\033]0;$$ $HOSTNAME $USER@$PWD\007"'
          fi
        '';
      };
    }
    {
      services.openssh = {
        enable = true;
        hostKeys = [
          # XXX bits here make no science
          { bits = 8192; type = "ed25519"; path = "/etc/ssh/ssh_host_ed25519_key"; }
        ];
      };
    }
    {
      krebs.iptables = {
        enable = true;
        tables = {
          nat.PREROUTING.rules = [
            { predicate = "! -i retiolum -p tcp -m tcp --dport 22"; target = "REDIRECT --to-ports 0"; precedence = 100; }
            { predicate = "-p tcp -m tcp --dport 45621"; target = "REDIRECT --to-ports 22"; precedence = 99; }
          ];
          nat.OUTPUT.rules = [
            { predicate = "-o lo -p tcp -m tcp --dport 45621"; target = "REDIRECT --to-ports 22"; precedence = 100; }
          ];
          filter.INPUT.policy = "DROP";
          filter.FORWARD.policy = "DROP";
          filter.INPUT.rules = [
            { predicate = "-m conntrack --ctstate RELATED,ESTABLISHED"; target = "ACCEPT"; precedence = 10001; }
            { predicate = "-p icmp"; target = "ACCEPT"; precedence = 10000; }
            { predicate = "-i lo"; target = "ACCEPT"; precedence = 9999; }
            { predicate = "-p tcp --dport 22"; target = "ACCEPT"; precedence = 9998; }
            { predicate = "-p tcp -i retiolum"; target = "REJECT --reject-with tcp-reset"; precedence = -10000; }
            { predicate = "-p udp -i retiolum"; target = "REJECT --reject-with icmp-port-unreachable"; v6 = false; precedence = -10000; }
            { predicate = "-i retiolum"; target = "REJECT --reject-with icmp-proto-unreachable"; v6 = false; precedence = -10000; }
          ];
        };
      };
    }
  ];
}