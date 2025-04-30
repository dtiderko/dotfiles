# base00 ----
# base01 ---
# base02 --
# base03 -
# base04 +
# base05 ++
# base06 +++
# base07 ++++
# base08 red
# base09 orange
# base0A yellow
# base0B green
# base0C aqua/cyan
# base0D blue
# base0E purple
# base0F brown

{ inputs
, pkgs
, ...
}:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };

    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Dark";
    };

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetbrainsMono Nerd Font";
    };
  };
}
