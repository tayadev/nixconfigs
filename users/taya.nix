{ inputs, pkgs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.taya = {pkgs, ...}: {
        home.packages = with pkgs; [
          vesktop
          bitwarden
        ];

        programs.git = {
          enable = true;
          userName = "Taya Crystals";
          userEmail = "taya@taya.one";
        };

        # zsh
        programs.zsh = {
          enable = true;
          autosuggestion.enable = true;
          enableCompletion = true;
          oh-my-zsh.enable = true;
        };

        # hyprland
        # TODO: create user config, and find out a way to merge it with a host specific config

 	programs.direnv = {
	  enable = true;
	  enableZshIntegration = true;
	  nix-direnv.enable = true;
	};

	programs.zed-editor.enable = true;

        home.stateVersion = "24.11";
      };
    }
  ];

  users.users.taya = {
    isNormalUser = true;
    description = "Taya Crystals";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC7fr99CtsD6GM0vzeTjPgqgVc4dr+WnjIJvDhaC2MMC taya@nixos"
    ];
  };

  programs.zsh.enable = true;

}
