{ config, pkgs, ... }:

{

  environment.systemPackages = [
    ((pkgs.vim_configurable.override { python = pkgs.python3; }).customize {
      name = "vim";
      vimrcConfig.customRC = builtins.readFile ./vimrc;
      vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; { start = [
       "undotree"
        "YouCompleteMe"
        #"UltiSnips"
        # vim-nix handles indentation better but does not perform sanity
          "vim-addon-nix"
          "vim-better-whitespace"
      ];
      };
    })
  ];
}
