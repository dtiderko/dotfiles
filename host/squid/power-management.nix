{ inputs, ... }:
{
  imports = [
    inputs.auto-cpufreq.nixosModules.default
  ];

  networking.networkmanager.wifi.powersave = true;

  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
