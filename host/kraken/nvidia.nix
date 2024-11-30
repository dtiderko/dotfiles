{ config, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };

      # open source kernel module
      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  # fix phantom display
  boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
}
