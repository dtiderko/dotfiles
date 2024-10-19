{ config, lib, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    initrd.availableKernelModules = [
      "nvme"
      "ehci_pci"
      "xhci_pci"
      "usb_storage"
      "sd_mod"
      "sdhci_pci"
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/338e5305-c64a-4d52-992b-d5bdd5f43c23";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/55CD-7BCC";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  boot.initrd.luks.devices."luks-0a5051d9-602a-4e3b-ac6d-415e7c045a5c".device = "/dev/disk/by-uuid/0a5051d9-602a-4e3b-ac6d-415e7c045a5c";

  networking = {
    hostName = "squid";
    useDHCP = lib.mkDefault true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
