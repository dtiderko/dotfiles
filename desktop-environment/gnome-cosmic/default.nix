{ pkgs, ... }:
{
  services = {
    # cosmic
    desktopManager.cosmic.enable = true;

    # gnome
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };

  # exclude gnome apps
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-connections
    epiphany # web browser
    geary # email reader
  ];
}
