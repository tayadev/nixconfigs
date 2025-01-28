{
  description = "Taya's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      workstation = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/workstation
        ];
      };

      thinkpad = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs; };
	modules = [
	  ./hosts/thinkpad
	];
      };
    };
  };
}
