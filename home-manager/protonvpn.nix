{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    protonvpn-gui
    networkmanagerapplet
  ];

  home.activation.startNetworkmanagerapplet = lib.hm.dag.entryAfter [ "writeBoundry" ] ''
    if command -v nm-applet 2>&1 >/dev/null; then
      nm-applet
    fi
  '';
}
