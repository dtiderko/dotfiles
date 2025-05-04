{ pkgs, ... }: {
  home.packages = [ pkgs.brightnessctl ];

  programs.hyprlock.enable = true;
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # one instance
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend
        after_sleep_cmd = "hyprctl dispatch dpms on"; # on key press for activation
      };
      listener = [
        {
          # 2.5 min minimum brightness
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          # 5 min lock screen
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          # 5.5 min screen off
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }
        {
          # 30 min suspend
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
