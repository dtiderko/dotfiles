{
  config,
  lib,
  username,
  ...
}:
{
  imports = [
    ./disko.nix
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

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "kraken";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems = {
    "/" = "/dev/by-id/nvme-Samsung_SSD_970_EVO_Plus_500GB_S4EVNF0M936597J-part3";
    "/boot" = "/dev/by-id/nvme-Samsung_SSD_970_EVO_Plus_500GB_S4EVNF0M936597J-part2";
    "/home/${username}/0__games__0" = "/dev/by-id/ata-Samsung_SSD_860_EVO_1TB_S4CSNX0N709790H-part1";
    "/home/${username}/0__void__0" = "/dev/by-id/ata-ST4000VN000-1H4168_Z302ZGEF-part1";
  };
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];
}
