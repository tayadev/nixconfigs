{ pkgs, ... }: {

  users.users.taya = {
    isNormalUser = true;
    description = "Taya Crystals";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC7fr99CtsD6GM0vzeTjPgqgVc4dr+WnjIJvDhaC2MMC taya@nixos"
    ];
    packages = with pkgs; [ # separate these by system type, e.g desktop / server
      vesktop
      bitwarden
    ];
  };

  programs.zsh = {
    enable = true;
  };

}
