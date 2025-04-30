{ config
, pkgs
, ...
}:
let
  colors = config.colorScheme.palette;
in
{
  imports = [
    ./theme.nix
    ./rofi.nix
    ./waybar.nix
    ./locking.nix
  ];

  home.packages = with pkgs; [
    nautilus

    hyprpolkitagent # polkit authentication
    dunst # notification daemon
    udiskie # automatic mounting
    playerctl # song control
  ];

  services.wpaperd = {
    enable = true;
    settings.default = {
      path = "~/Pictures/wallpaper/";
      duration = "15m";
      sorting = "random";
      group = 0;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "dunst"
        "systemctl --user enable --now hyprpolkitagent.service"
        "udiskie"
      ];
      "$mod" = "SUPER";

      ###########
      ## INPUT ##
      ###########

      input = {
        kb_layout = "de,us";
        kb_variant = "qwerty,dvorak";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;
        touchpad.natural_scroll = false;
        sensitivity = 0; # no modification
      };
      gestures.workspace_swipe = false;

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      windowrule = [
        # Ignore maximize requests from apps
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      ###################
      ### KEYBINDINGS ###
      ###################

      bindm = [
        # move / resize window with mod + mouse
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bind =
        [
          ", F11, fullscreen"
          "$mod, Q, killactive"
          "$mod, V, togglefloating"

          # move window with mod + arrowkeys
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # apps
          "$mod, T, exec, alacritty"
          "$mod, B, exec, brave"
          "$mod, F, exec, nautilus"
          "$mod, D, exec, flatpak run com.discordapp.DiscordCanary"
          "$mod, S, exec, steam"

          # Scroll through existing workspaces
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"
        ]
        ++ (builtins.concatLists (
          builtins.genList
            (
              i:
              [
                "$mod, ${toString ((i+1) - (10 * ((i+1) / 10)))}, workspace, ${toString (i+1)}"
                "$mod SHIFT, ${toString ((i+1) - (10 * ((i+1) / 10)))}, movetoworkspace, ${toString (i+1)}"
              ]
            ) 10
        ));

      bindl = [
        # song control
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"

        # multimedia keys for volume 
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # LCD brightness
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;

        layout = "dwindle";
        resize_on_border = false;
        allow_tearing = true;

        "col.active_border" = "rgb(${colors.base0F})";
        "col.inactive_border" = "rgb(${colors.base00})";
      };

      decoration = {
        rounding = 6;
        rounding_power = 2;

        blur.enabled = false;
        shadow.enabled = false;
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      master.new_status = "master";
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
