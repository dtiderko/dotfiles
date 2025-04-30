{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    pop-shell
    appindicator
  ];

  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.pop-shell.extensionUuid
        pkgs.gnomeExtensions.appindicator.extensionUuid
      ];
    };
  };
}
