{ config, lib, pkgs, ... }:

with lib;

{
  imports = [
    ../../2configs/tv/CAC-Developer-1.nix
    ../../2configs/tv/CAC-CentOS-7-64bit.nix
    ../../2configs/tv/base.nix
    ../../2configs/tv/consul-server.nix
    ../../2configs/tv/exim-smarthost.nix
    ../../2configs/tv/git-public.nix
    {
      imports = [ ../../2configs/tv/identity.nix ];
      tv.identity.self = config.tv.identity.hosts.mkdir;
    }
    {
      imports = [ ../../3modules/tv/iptables.nix ];
      tv.iptables = {
        enable = true;
        input-internet-accept-new-tcp = [
          "ssh"
          "tinc"
          "smtp"
        ];
        input-retiolum-accept-new-tcp = [
          "http"
        ];
      };
    }
    {
      imports = [ ../../3modules/tv/retiolum.nix ];
      tv.retiolum = {
        enable = true;
        hosts = ../../Zhosts;
        connectTo = [
          "cd"
          "fastpoke"
          "pigstarter"
          "ire"
        ];
      };
    }
  ];

  networking.hostName = "mkdir";
  networking.interfaces.enp2s1.ip4 = [
    {
      address = "162.248.167.241"; # TODO
      prefixLength = 24;
    }
  ];
  networking.defaultGateway = "162.248.167.1";
  networking.nameservers = [
    "8.8.8.8"
  ];

  environment.systemPackages = with pkgs; [
    git # required for ./deploy, clone_or_update
    htop
    iftop
    iotop
    iptables
    nethogs
    rxvt_unicode.terminfo
    tcpdump
  ];

  services.journald.extraConfig = ''
    SystemMaxUse=1G
    RuntimeMaxUse=128M
  '';
}
