{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  # hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # auto login
  environment.systemPackages = [ pkgs.greetd.tuigreet ];
  services.greetd = {
    enable = true;
    restart = false;
    settings = rec {
      default_session = initial_session;
      initial_session = {
        command = "Hyprland &> /dev/null";
        user = "dennis";
      };
    };
  };

  fonts.packages = [ pkgs.nerdfonts ];
}
