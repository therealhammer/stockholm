{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    texLive
  ];
}
