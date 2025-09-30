{ pkgs , ... }:
{
  imports = [
    ./boot.nix
    ./desktop-environment.nix
    ./dotfiles-programs.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./nix.nix
    ./programs.nix
    ./sound.nix
  ];

  # allow running dynamically linked executables
  programs.nix-ld.enable = true;

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
    stateVersion = "25.05";
    # automatic updates
    autoUpgrade = {
      enable = true;
      flags = [
        "--print-build-logs"
      ];
      dates = "02:00";
      randomizedDelaySec = "45min";
      allowReboot = false;
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
