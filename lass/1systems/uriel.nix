{ config, pkgs, ... }:

with builtins;
{
  imports = [
    ../2configs/baseX.nix
    ../2configs/browsers.nix
    ../2configs/games.nix
    ../2configs/pass.nix
    ../2configs/bird.nix
    ../2configs/git.nix
    ../2configs/chromium-patched.nix
    ../2configs/retiolum.nix
    ../2configs/bitlbee.nix
    ../2configs/weechat.nix
    {
      users.extraUsers = {
        root = {
          openssh.authorizedKeys.keys = map readFile [
            ../../krebs/Zpubkeys/uriel.ssh.pub
          ];
        };
      };
    }
  ];

  krebs.build = {
    user = config.krebs.users.lass;
    target = "root@uriel";
    host = config.krebs.hosts.uriel;
    source = {
      dir.secrets = {
        host = config.krebs.hosts.mors;
        path = "/home/lass/secrets/${config.krebs.build.host.name}";
      };
      dir.stockholm = {
        host = config.krebs.hosts.mors;
        path = "/home/lass/dev/stockholm";
      };
    };
  };

  networking.hostName = "uriel";

  networking.wireless.enable = true;
  nix.maxJobs = 2;

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  boot = {
    #kernelParams = [
    #  "acpi.brightness_switch_enabled=0"
    #];
    #loader.grub.enable = true;
    #loader.grub.version = 2;
    #loader.grub.device = "/dev/sda";

    loader.gummiboot.enable = true;
    loader.gummiboot.timeout = 5;

    initrd.luks.devices = [ { name = "luksroot"; device = "/dev/sda2"; } ];
    initrd.luks.cryptoModules = [ "aes" "sha512" "sha1" "xts" ];
    initrd.availableKernelModules = [ "xhci_hcd" "ehci_pci" "ahci" "usb_storage" ];
    #kernelModules = [ "kvm-intel" "msr" ];
    kernelModules = [ "msr" ];
    extraModprobeConfig = ''
    '';
  };
  fileSystems = {
    "/" = {
      device = "/dev/pool/root";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/sda1";
    };
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="net", ATTR{address}=="64:27:37:7d:d8:ae", NAME="wl0"
    SUBSYSTEM=="net", ATTR{address}=="f0:de:f1:b8:c8:2e", NAME="et0"
  '';

  services.xserver.synaptics = {
    enable = true;
    twoFingerScroll = true;
    accelFactor = "0.035";
    additionalOptions = ''
      Option "FingerHigh" "60"
      Option "FingerLow"  "60"
    '';
  };

  environment.systemPackages = with pkgs; [
  ];

  #for google hangout

  users.extraUsers.google.extraGroups = [ "audio" "video" ];
}
