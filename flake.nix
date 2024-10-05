{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
  let
    mkSystem = arch: hostname:
      nixpkgs.lib.nixosSystem {
        system = arch;
	modules = [
          (./. + "/hosts/${hostname}/hardware-configuration.nix")
          (./. + "/hosts/${hostname}/configuration.nix")
	  home-manager.nixosModules.home-manager {
            home-manager = {
	      useUserPackages = true;
	      useGlobalPkgs = true;
	      extraSpecialArgs = { inherit inputs; };
	    };
	  }
	] ++ builtins.map (userFile: import ./users/${userFile}) (builtins.attrNames (builtins.readDir ./users));
	specialArgs = { inherit inputs; };
      };
  in {
    nixosConfigurations = {
      desktop = mkSystem "x86_64-linux" "TOPAZ";
      thinkpad = mkSystem "x86_64-linux" "thinkpad";
      server = mkSystem "x86_64-linux" "crystalserver";
    };
  };
}
