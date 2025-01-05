{ inputs, pkgs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.demo = {pkgs, ...}: {
        home.packages = with pkgs; [
          cowsay
        ];

        home.stateVersion = "24.11";
      };
    }
  ];

  users.users.demo = {
    isNormalUser = true;
    description = "Demo User";
    extraGroups = [ "networkmanager" ];
  };

}
