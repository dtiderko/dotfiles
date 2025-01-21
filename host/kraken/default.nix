{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./nvidia.nix
  ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b6728557-a0e4-4924-a394-1629e2920ff9";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/BD4C-9FC7";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
    "/home/dennis/0__games__0" = {
      device = "/dev/disk/by-uuid/97d377de-d745-48b5-879c-20acca2bef69";
      fsType = "ext4";
    };
    "/home/dennis/0__void__0" = {
      device = "/dev/disk/by-uuid/bb042c43-7f6b-4d16-aa32-b260cd16dd27";
      fsType = "ext4";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/b237c5f2-3a02-4fb5-8c52-2a1955c57612"; }
  ];

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "kraken";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };
}
