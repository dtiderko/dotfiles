{ config, pkgs, ... }:
let
  colors = config.colorScheme.palette;
in
{
  home.packages = [ pkgs.pavucontrol ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [
          "clock"
          "clock#calendar"
        ];
        modules-right = [
          "tray"
          "hyprland/language"
          "pulseaudio"
          "battery"
          "network"
          "custom/powermenu"
        ];

        "clock#calendar" = {
          format = "{:%d.%m.%Y}";
          tooltip = false;
        };
        "clock" = {
          tooltip = false;
        };

        "tray" = {
          icon-size = 16;
          show-passive-items = true;
        };
        "hyprland/language" = {
          format = "{short}";
        };
        "pulseaudio" = {
          scroll-step = 1;
          format = "<span color='#${colors.base05}'>{icon}</span> {volume}%";
          format-muted = "";
          format-icons = {
            headphone = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
          tooltip = false;
        };
        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = [
            "<span color='#${colors.base08}'></span>"
            ""
            ""
            ""
          ];
        };
        "network" = {
          format-wifi = "<span color='#${colors.base05}'> </span>{essid}";
          format-ethernet = "󰈀";
          format-disconnected = "<span color='#${colors.base05}'>󰖪 </span>No Network";
          interval = 1;
          tooltip = false;
        };
        "custom/powermenu" = {
          format = " ⏻ ";
          on-click = "pkill rofi || bash ~/.config/rofi/bin/powermenu.sh";
          tooltip = false;
        };
      }
    ];

    style = ''
      * {
        border: 0;
        font-family: "JetBrains Mono Nerd Font";
        font-size: 14px;
        color: #${colors.base05};
        background-color: #${colors.base00};

        margin-left: 8px;
        margin-right: 8px;
      }

      window#waybar,
      .modules-left,
      .modules-right,
      #workspaces,
      #workspaces button {
        margin: 0
      }

      #workspaces button {
        padding: 0;
      }
      #workspaces button :hover {
        background-color: #FF0000;
      }
      #workspaces button.visible,
      #workspaces button.visible * {
        background-color: #${colors.base0F};
      }
    '';
  };
}
