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
      device = "/dev/disk/by-uuid/f918dfdc-74e7-4b21-9750-487554637d04";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/1B03-4062";
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
    { device = "/dev/disk/by-uuid/caf7e71f-607f-425b-923d-9f81dad10701"; }
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
