{
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.rofi ];
  wayland.windowManager.hyprland.settings = {
    "$launcher" = "bash ~/.config/rofi/bin/launcher.sh";
    "$powermenu" = "bash ~/.config/rofi/bin/powermenu.sh";

    bindr = [
      "SUPER, SUPER_L, exec, $launcher"
      "$mod, F4, exec, $powermenu"
    ];
  };

  xdg.configFile = {
    "rofi/bin/" = {
      source = ./bin;
      recursive = true;
    };
    "rofi/theme" = {
      source = ./theme;
      recursive = true;
    };
  };
}
