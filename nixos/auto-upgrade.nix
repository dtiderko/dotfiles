{ pkgs, ... }: {
  # automatic updates
  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
    allowReboot = false;
    flags = [
      "--max-jobs"
      "1"
    ];
  };

  systemd.services.nixos-upgrade.unitConfig.OnFailure = "nixos-upgrade-failed.service";
  systemd.services."nixos-upgrade-failed" = {
    description = "dump logs to user desktop on auto upgrade failure";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    script = ''
      LOG_FILE="/home/dennis/Desktop/nixos-upgrade-failed-$(date +%Y%m%d-%H%M%S).log"

      ${pkgs.systemd}/bin/journalctl -u nixos-upgrade.service -b 0 --no-pager >> "$LOG_FILE" 2>&1
      chown dennis:users "$LOG_FILE"
    '';
  };
}
