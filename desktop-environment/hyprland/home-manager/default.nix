{
  pkgs,
  ...
}:
{
  imports = [
    ./theme.nix
    ./rofi
    # ./waybar
    ./media-controls
  ];

  home.packages = with pkgs; [
    nautilus

    pavucontrol # autdo control center
    dunst # notification daemon
    udiskie # automatic mounting
    polkit-kde-agent # authentication agent
    swww # wallpaper agent
  ];

  xdg.configFile."/hypr/wallpaper.jpg".source = ./cyberpunk.jpg;

  wayland.windowManager.hyprland = {
    extraConfig = builtins.readFile ./hyprland.conf;
    settings = {
      exec-once = [
        "dunst"
        "/usr/lib/polkit-kde-authentication-agent-1"
        "udiskie"
        "(swww init; swww img ~/.config/hypr/wallpaper.jpg; pkill swww; swww init) &"
      ];
      "$mod" = "SUPER";

      bindm = [
        # move / resize window with mod + mouse
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bind =
        [
          "$mod, F, fullscreen"
          "$mod, C, killactive"
          "$mod, V, togglefloating"
          "$mod, P, pseudo" # dwindle
          "$mod, J, togglesplit" # dwindle

          # move window with mod + arrowkeys
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # apps
          "$mod, return, exec, alacritty"
          "$mod, B, exec, brave"
          "$mod, S, exec, spotify"
          "$mod, E, exec, nautilus"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              workspace =
                let
                  c = (i + 1) / 10;
                in
                builtins.toString (i + 1 - (c * 10));
            in
            [
              # switch workspace
              "$mod, ${workspace}, workspace, ${toString (i + 1)}"
              # move active window to workspace
              "$mod SHIFT, ${workspace}, movetoworkspace, ${toString (i + 1)}"
            ]
          ) 10
        ));
    };
  };
}
