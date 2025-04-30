{ config
, pkgs
, ...
}:
{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, SUPER_L, exec, rofi -show drun"
    "SUPER, C, exec, rofi -show calc"
  ];

  programs.rofi = {
    enable = true;

    plugins = [ pkgs.rofi-calc ];

    extraConfig = {
      modi = "drun,calc";
      show-icons = true;
      display-drun = "";
    };

    font = "JetBrainsMono Nerd Font 11";
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
        colors = config.colorScheme.palette;
      in
      {
        "*" = {
          bg0 = mkLiteral "#${colors.base00}";
          bg1 = mkLiteral "#${colors.base01}";
          bg2 = mkLiteral "#${colors.base02}";

          fg0 = mkLiteral "#${colors.base04}";
          fg1 = mkLiteral "#${colors.base05}";
          fg2 = mkLiteral "#${colors.base06}";

          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg0";

          margin = 0;
          padding = 0;
          spacing = 0;
        };

        window = {
          background-color = mkLiteral "@bg0";

          width = 640;
          border-radius = 8;
        };

        inputbar = {
          padding = mkLiteral "12px";
          spacing = mkLiteral "12px";
          children = map mkLiteral [
            "icon-search"
            "entry"
          ];
        };

        icon-search = {
          expand = false;
          filename = "search";
          size = mkLiteral "28px";
        };

        entry = {
          font = mkLiteral "inherit";

          placeholder = "Search";
          placeholder-color = mkLiteral "@fg2";
        };

        message = {
          border = mkLiteral "2px 0 0";
          border-color = mkLiteral "@bg1";
          background-color = mkLiteral "@bg1";
        };

        listview = {
          lines = 10;
          columns = 1;

          fixed-height = false;
          border = mkLiteral "1px 0 0";
          border-color = mkLiteral "@bg1";
        };

        element = {
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "16px";
          background-color = mkLiteral "transparent";
        };


        "element selected normal, element selected active" = {
          background-color = mkLiteral "@bg2";
          text-color = mkLiteral "@fg1";
        };

        "element normal active".text-color = mkLiteral "@bg2";
        "element alternate active".text-color = mkLiteral "@bg2";
        "icon-search, entry, element-icon, element-text".vertical-align = mkLiteral "0.5";
        textbox.padding = mkLiteral "8px 24px";
        element-icon.size = mkLiteral "1em";
        element-text.text-color = mkLiteral "inherit";
      };
  };
}
