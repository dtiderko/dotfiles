{
  imports = [
    ./hyprland.nix
    ./gnome.nix
    ./cosmic.nix
  ];

  # login screen
  services.xserver.displayManager.gdm.enable = true;
}
