{ pkgs, ... }:
{

  services.flatpak.enable = true;
  programs = {
    ausweisapp = {
      enable = true;
      openFirewall = true;
    };
    chromium.enable = true;
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
    vlc
    spotify
    picard
    onlyoffice-desktopeditors
    gimp
    vscode

    mindustry-wayland
    osu-lazer-bin

    # utils
    usbimager
    keepassxc
    android-tools

    # gaming
    steam
    heroic
    lutris
    prismlauncher
    sidequest

    # required by syncthing
    syncthingtray
  ];
}
