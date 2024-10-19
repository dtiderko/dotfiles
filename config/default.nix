{
  pkgs,
  username,
  stateVersion,
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

  programs.gamemode.enable = true;
  services.printing.enable = true;
  networking.networkmanager.enable = true;

  system = {
    inherit stateVersion;
    # automatic updates
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
  };

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
