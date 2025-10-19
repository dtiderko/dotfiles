{ pkgs, ... }: {
  services = {
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    desktopManager.cosmic.enable = true;
  };

  # fix the stupid clipboard
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  environment.systemPackages = with pkgs; [
    nautilus
    libheif
    libheif.out 

  # for gnomes nautilus
  environment.pathsToLink = [ "share/thumbnailers" ];
  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];
}
