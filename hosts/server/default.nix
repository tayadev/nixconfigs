{ ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/server.nix
    ../../users/taya.nix
  ];

  networking.hostName = "crystalserver";
}
