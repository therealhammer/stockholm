{ config, lib, pkgs, ... }:

with lib;

{
  krebs.build.host = config.krebs.hosts.nomic;

  imports = [
    ../2configs/hw/AO753.nix
    ../2configs/exim-retiolum.nix
    ../2configs/git.nix
    ../2configs/pulse.nix
    ../2configs/xserver
    {
      tv.iptables = {
        enable = true;
        input-internet-accept-new-tcp = [
          "ssh"
          "http"
          "tinc"
          "smtp"
        ];
      };
    }
    {
      krebs.nginx = {
        enable = true;
        servers.default.locations = [
          (nameValuePair "~ ^/~(.+?)(/.*)?\$" ''
            alias /home/$1/public_html$2;
          '')
        ];
      };
    }
    {
      krebs.retiolum = {
        enable = true;
        connectTo = [
          "gum"
          "pigstarter"
        ];
      };
    }
  ];

  boot.initrd.luks = {
    cryptoModules = [ "aes" "sha512" "xts" ];
    devices = [
      { name = "luks1"; device = "/dev/sda2"; }
    ];
  };

  fileSystems."/" =
    { device = "/dev/mapper/nomic1-root";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/sda1";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/mapper/nomic1-home";
      fsType = "btrfs";
    };

  swapDevices = [ ];

  # TODO base
  boot.tmpOnTmpfs = true;

  environment.systemPackages = with pkgs; [
    (writeScriptBin "play" ''
      #! /bin/sh
      set -euf
      mpv() { exec ${mpv}/bin/mpv "$@"; }
      case $1 in
        deepmix)      mpv http://deepmix.ru/deepmix128.pls;;
        groovesalad)  mpv http://somafm.com/play/groovesalad;;
        ntslive)      mpv http://listen2.ntslive.co.uk/listen.pls;;
        *)
          echo "$0: bad argument: $*" >&2
          exit 23
      esac
    '')
    gnupg
    ntp # ntpate
    rxvt_unicode.terminfo
    tmux
  ];
}
