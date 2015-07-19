{ pkgs, ... }:

pkgs //
{
  dic = pkgs.callPackage ./dic.nix {};
  genid = pkgs.callPackage ./genid.nix {};
  github-hosts-sync = pkgs.callPackage ./github-hosts-sync.nix {};
  github-known_hosts = pkgs.callPackage ./github-known_hosts.nix {};
  much = pkgs.callPackage ./much.nix {};
  viljetic-pages = pkgs.callPackage ./viljetic-pages {};
}
