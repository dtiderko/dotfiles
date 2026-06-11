{ pkgs, ... }:
{
  imports = [
    ../nixvim

    ./boot.nix
    ./desktop-environment.nix
    ./dotfiles-programs.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./nix.nix
    ./programs.nix
    ./sound.nix
  ];

  # open ports for:
  # - minecraft server hosting
  # - http dev
  networking.firewall = {
    allowedTCPPorts = [
      25565
      80
    ];
    allowedUDPPorts = [ 25565 ];
  };

  # add all man pages
  documentation = {
    enable = true;
    dev.enable = true;
    man.enable = true;
  };
  environment.systemPackages = with pkgs; [
    linux-manual
    man-pages
    man-pages-posix
  ];

  # allow running dynamically linked executables
  programs.nix-ld.enable = true;

  # add udev rules for platformio dev
  services.udev.packages = with pkgs; [
    platformio-core.udev
    openocd
  ];

  # allow running http server as normal user
  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;

  networking.networkmanager.enable = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # printer/scanner
  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  hardware.sane = {
    enable = true;
    disabledDefaultBackends = [ "escl" ];
    extraBackends = [
      pkgs.sane-airscan
    ];
  };

  system = {
    # automatic updates
    autoUpgrade = {
      enable = true;
      dates = "02:00";
      randomizedDelaySec = "45min";
      allowReboot = false;
      flags = [
        "--max-jobs"
        "1"
      ];
    };
  };

  users.users."dennis" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "dialout"
      "adbusers"
      "plugdev"
    ];
  };
}
