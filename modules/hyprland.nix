{ ... }: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    exec-once = [
      "waybar"
      "swww-daemon"
    ];

    monitor = "eDP-1, 1920x1080, 0x0, 1";

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 0;
    };

    decoration = {
      rounding = 0;
    };

    input = {
      kb_layout = "ch";
      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
      };
    };

    bind = [
        "$mod, RETURN, exec, kitty"
	"$mod, W, killactive"
	"$mod, SHIFT+Q, exit"
	"$mod, SPACE, exec, wofi --show drun"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

    bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];
  };

  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      * { font-family: "JetBrainsMono Nerd Font"; }
    '';
  };

}
