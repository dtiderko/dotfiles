{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./power-management.nix
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
      device = "/dev/disk/by-uuid/0b8922b7-db15-42a5-952b-bc9ba91ce9f2";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-id/nvme-eui.00253857019ea53e-part1";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-id/nvme-eui.00253857019ea53e-part3";
    }
  ];

  boot.initrd.luks.devices."luks-a54ca87b-7097-44c7-9795-3a35b9eca708".device = "/dev/disk/by-uuid/a54ca87b-7097-44c7-9795-3a35b9eca708";

  networking = {
    hostName = "squid";
    useDHCP = lib.mkDefault true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
