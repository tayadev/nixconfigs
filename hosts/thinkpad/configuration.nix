{ config, pkgs, ... }: {

  imports = [
    ../../modules/system/desktop.nix
  ];

  networking.hostName = "thinkpad";
}
