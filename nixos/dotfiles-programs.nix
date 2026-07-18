{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty
    kitty

    devenv

    # git stuff
    git
    gnupg

    # bash stuff
    eza
    starship
    direnv
  ];

  fonts.packages = with pkgs; [
    monocraft
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
