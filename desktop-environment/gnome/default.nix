{ pkgs, ... }: {
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    # exclude gnome apps
    environment.gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-connections
        epiphany # web browser
        geary # email reader
    ];
}
