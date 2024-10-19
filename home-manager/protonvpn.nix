{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    protonvpn-gui
    networkmanagerapplet
  ];

  home.activation.startNetworkmanagerapplet = lib.hm.dag.entryAfter [ "writeBoundry" ] ''
    nm-applet
  '';
}
