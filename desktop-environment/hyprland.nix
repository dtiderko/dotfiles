{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";

    XCURSOR_SIZE = 12;
    HYPRCURSOR_SIZE = 12;
  };
}
