{ pkgs, ... }:
{
  home.packages = [
    (pkgs.callPackage ./electron-wrapper.nix {
      name = "discord";
      desktopName = "Discord";
      url = "https://discord.com/app";
      description = "Discord wrapped in Electron";
      icon = ./icon.png;
    })
  ];
}
