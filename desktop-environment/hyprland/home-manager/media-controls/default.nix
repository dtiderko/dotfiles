{
  pkgs,
  ...
}:
{
  xdg.configFile."hypr/vol.sh" = {
    source = ./vol.sh;
    executable = true;
  };
  home.packages = with pkgs; [
    playerctl # go to next song
    pulseaudio # change volume via vol.sh
  ];
  wayland.windowManager.hyprland.settings = {
    "$vol" = "~/.config/hypr/vol.sh";

    bind = [
      ", XF86AudioRaiseVolume, exec, $vol --up"
      ", XF86AudioLowerVolume, exec, $vol --down"
      ", XF86AudioMute, exec, $vol --mute"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
