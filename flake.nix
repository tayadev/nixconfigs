{
  description = "Taya's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: rec {

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

    legacyPackages = nixpkgs.lib.genAttrs [ "x86_64-linux" ] (system:
      import inputs.nixpkgs {
	inherit system;
	config.allowUnfree = true;
      }
    );

    nixosConfigurations = {
      workstation = nixpkgs.lib.nixosSystem {
	pkgs = legacyPackages.x86_64-linux;
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/workstation ];
      };

      thinkpad = nixpkgs.lib.nixosSystem {
	pkgs = legacyPackages.x86_64-linux;
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/thinkpad ];
      };
    };
  };
}
