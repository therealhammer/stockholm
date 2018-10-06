{ config, lib, pkgs, ... }:
with import <stockholm/lib>;

{
  krebs.Reaktor.coders = {
    nickname = "Reaktor|lass";
    channels = [ "#coders" "#germany" "#panthermoderns" ];
    extraEnviron = {
      REAKTOR_HOST = "irc.hackint.org";
    };
    plugins = with pkgs.ReaktorPlugins; let

      lambdabot = (import (pkgs.fetchFromGitHub {
        owner = "NixOS"; repo = "nixpkgs";
        rev = "a4ec1841da14fc98c5c35cc72242c23bb698d4ac";
        sha256 = "148fpw31s922hxrf28yhrci296f7c7zd81hf0k6zs05rq0i3szgy";
      }) {}).lambdabot;

      lambdabotflags = ''
        -XStandaloneDeriving -XGADTs -XFlexibleContexts \
        -XFlexibleInstances -XMultiParamTypeClasses \
        -XOverloadedStrings -XFunctionalDependencies \'';
    in [
      sed-plugin
      url-title
      (buildSimpleReaktorPlugin "lambdabot-pl" {
        pattern = "^@pl (?P<args>.*)$$";
        script = pkgs.writeDash "lambda-pl" ''
          exec ${lambdabot}/bin/lambdabot \
            ${indent lambdabotflags}
            -e "@pl $1"
        '';
      })
      (buildSimpleReaktorPlugin "lambdabot-type" {
        pattern = "^@type (?P<args>.*)$$";
        script = pkgs.writeDash "lambda-type" ''
          exec ${lambdabot}/bin/lambdabot \
            ${indent lambdabotflags}
            -e "@type $1"
        '';
      })
      (buildSimpleReaktorPlugin "lambdabot-let" {
        pattern = "^@let (?P<args>.*)$$";
        script = pkgs.writeDash "lambda-let" ''
          exec ${lambdabot}/bin/lambdabot \
            ${indent lambdabotflags}
            -e "@let $1"
        '';
      })
      (buildSimpleReaktorPlugin "lambdabot-run" {
        pattern = "^@run (?P<args>.*)$$";
        script = pkgs.writeDash "lambda-run" ''
          exec ${lambdabot}/bin/lambdabot \
            ${indent lambdabotflags}
            -e "@run $1"
        '';
      })
      (buildSimpleReaktorPlugin "lambdabot-kind" {
        pattern = "^@kind (?P<args>.*)$$";
        script = pkgs.writeDash "lambda-kind" ''
          exec ${lambdabot}/bin/lambdabot \
            ${indent lambdabotflags}
            -e "@kind $1"
        '';
      })
      (buildSimpleReaktorPlugin "ping" {
        pattern = "^!ping (?P<args>.*)$$";
        script = pkgs.writeDash "ping" ''
          exec /run/wrappers/bin/ping -q -c1 "$1" 2>&1 | tail -1
        '';
      })
      (buildSimpleReaktorPlugin "google" {
        pattern = "^!g (?P<args>.*)$$";
        script = pkgs.writeDash "google" ''
          exec ${pkgs.ddgr}/bin/ddgr -C -n1 --json "$@" | \
            ${pkgs.jq}/bin/jq '@text "\(.[0].abstract) \(.[0].url)"'
        '';
      })
      (buildSimpleReaktorPlugin "blockchain" {
        pattern = ".*[Bb]lockchain.*$$";
        script = pkgs.writeDash "blockchain" ''
          exec echo 'DID SOMEBODY SAY BLOCKCHAIN? https://paste.krebsco.de/r99pMoQq/+inline'
        '';
      })
      (buildSimpleReaktorPlugin "shrug" {
        pattern = "^!shrug$";
        script = pkgs.writeDash "shrug" ''
          exec echo '¯\_(ツ)_/¯'
        '';
      })
      (buildSimpleReaktorPlugin "flip" {
        pattern = "^!flip$";
        script = pkgs.writeDash "shrug" ''
          exec echo '(╯°□°）╯ ┻━┻'
        '';
      })
    ];
  };
}
