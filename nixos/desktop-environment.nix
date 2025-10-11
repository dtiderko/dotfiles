{
  services = {
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    desktopManager.cosmic.enable = true;
  };

  # fix the stupid clipboard
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
