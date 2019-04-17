{ pkgs, lib, ... }:

{
  users.users.makefu.packages = with pkgs;[ bat direnv clipit ];
  home-manager.users.makefu = {
    systemd.user.services.network-manager-applet.Service.Environment = ''XDG_DATA_DIRS=/run/current-system/sw/share:${pkgs.networkmanagerapplet}/share GDK_PIXBUF_MODULE_FILE=${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache'';
    programs.browserpass = { browsers = [ "firefox" ] ; enable = true; };
    programs.firefox = {
      enable = true;
      enableIcedTea = true;
    };
    programs.obs-studio.enable = true;
    xdg.enable = true;
    services.network-manager-applet.enable = true;
    services.blueman-applet.enable = true;
    services.pasystray.enable = true;
    services.flameshot.enable = true;
    home.file.".config/Dharkael/flameshot.ini".text = ''
      [General]
      disabledTrayIcon=false
      drawColor=@Variant(\0\0\0\x43\x1\xff\xff\0\0\0\0\xff\xff\0\0)
      drawThickness=0
      filenamePattern=%F_%T_shot
    '';

    programs.chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
        # "liloimnbhkghhdhlamdjipkmadhpcjmn" # krebsgold
        "fpnmgdkabkmnadcjpehmlllkndpkmiak" # wayback machine
        "gcknhkkoolaabfmlnjonogaaifnjlfnp" # foxyproxy
        "abkfbakhjpmblaafnpgjppbmioombali" # memex
        "kjacjjdnoddnpbbcjilcajfhhbdhkpgk" # forest
      ];
    };

    systemd.user.services.clipit = {
      Unit = {
        Description = "clipboard manager";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };

      Service = {
        Environment = ''XDG_DATA_DIRS=/run/current-system/sw/share:${pkgs.clipit}/share GDK_PIXBUF_MODULE_FILE=${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache'';
        ExecStart = "${pkgs.clipit}/bin/clipit";
        Restart = "on-abort";
      };
    };
  };
}
