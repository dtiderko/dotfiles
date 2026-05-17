{ pkgs, ... }:
{

  services.flatpak.enable = true;
  programs = {
    ausweisapp = {
      enable = true;
      openFirewall = true;
    };
    chromium.enable = true;
    coolercontrol.enable = true;
    java.enable = true;
    thunderbird.enable = true;
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
    overrideFolders = false;
    overrideDevices = false;
    user = "dennis";
    group = "users";
    dataDir = "/home/dennis/";
  };

  environment.systemPackages = with pkgs; [
    # console
    btop
    tree

    # app
    firefox
    brave
    obsidian
    onlyoffice-desktopeditors
    gimp
    picard
    spotify
    vlc
    vscode

    mindustry-wayland
    osu-lazer-bin

    # utils
    android-tools
    keepassxc
    usbimager

    # gaming
    heroic
    lutris
    prismlauncher
    sidequest
    steam

    # required by syncthing
    syncthingtray
  ];
}
