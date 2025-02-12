{ inputs, pkgs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = ".backup";
      home-manager.users.taya = { pkgs, ... }: {
        home.packages = with pkgs; [ vesktop bitwarden nixd swww ];

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
        wayland.windowManager.hyprland = {
          enable = true;
          settings = {
            "$mod" = "SUPER";
            bind = [
              "$mod, Return, exec, ghostty"
              "$mod, Space, exec, wofi --show drun"
              "$mod, W, killactive"
            ] ++ (
              # workspaces
              # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
              builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${
                    toString ws
                  }"
                ]) 9));
            bindm =
              [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
            input = {
              kb_layout = "ch";
              touchpad = { natural_scroll = true; };
            };
            xwayland = { force_zero_scaling = true; };
            exec-once = [
              "swww-daemon"
            ];
            monitor = [
              "HDMI-A-1, 1920x1080@144, 0x0, 1"
              "DP-2, 1680x1050@59.95, 1920x0, 1"
              "DP-1, 1920x1080@60, -1080x-520, 1, transform, 1"
            ];
          };
        };

        programs.direnv = {
          enable = true;
          enableZshIntegration = true;
          nix-direnv.enable = true;
        };

        programs.zed-editor = {
          enable = true;
          extensions = [ "nix" ];
          userSettings = {
            theme = "Atelier Plateau Dark";
            telemetry = {
              metrics = false;
              diagnostics = false;
            };
            vim_mode = true;
          };
        };

        programs.ghostty = {
          enable = true;
          enableZshIntegration = true;
          settings = {
            "gtk-titlebar" = false;
            "background-opacity" = 0.8;
            "resize-overlay" = "never";
          };
        };

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
