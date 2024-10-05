{ config, pkgs, ... }: {

  users.users.taya = {
    isNormalUser = true;
    description = "Taya Crystals";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  home-manager.users.taya = {
    
    imports = [
      ../modules/neovim
      ../modules/hyprland.nix
      ../modules/kitty.nix
    ];


    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  };

}
