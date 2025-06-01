{
  imports = [
    # ./hyprland.nix
    ./gnome.nix
    ./cosmic.nix
  ];

  # login screen
  services.displayManager.gdm.enable = true;
}
