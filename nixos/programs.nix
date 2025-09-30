{ pkgs, ... }: {

  services.flatpak.enable = true;
  programs = {
    ausweisapp = {
      enable = true;
      openFirewall = true;
    };
    adb.enable = true;
    chromium.enable = true;
    java.enable = true;
  };

  # steam stuff
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  environment.systemPackages = with pkgs; [
    # console
    btop
    tree

    # app
    brave
    obsidian
    spotify
    vlc
    feishin

    # utils
    usbimager
    keepassxc

    # gaming
    steam
    heroic
    bottles
    lutris
    prismlauncher
    sidequest

    # required by syncthing
    syncthingtray
  ];
}
