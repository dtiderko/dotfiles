{
  pkgs,
  username,
  stateVersion,
  inputs,
  ...
}:
{
  imports = [
    ./boot.nix
    ./nix.nix
    ./sound.nix
    ./locale.nix
  ];

  # use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # allow running dynamically linked executables
  programs.nix-ld.enable = true;

  # allow running http server as normal user
  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;

  programs.gamemode.enable = true;
  networking.networkmanager.enable = true;
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

  services.flatpak.enable = true;
  programs = {
    ausweisapp = {
      enable = true;
      openFirewall = true;
    };
    adb.enable = true;
    java.enable = true;
  };

  system = {
    inherit stateVersion;
    # automatic updates
    autoUpgrade = {
      enable = true;
      dates = "04:40";
      flake = inputs.self.outPath;
      flags = [
        "--print-build-logs"
        "--commit-lock-file"

        "--update-input"
        "nixpkgs"

        "--update-input"
        "autocpufreq"

        "--update-input"
        "nixos-cosmic"
      ];
    };
  };

  users.users."${username}" = {
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
