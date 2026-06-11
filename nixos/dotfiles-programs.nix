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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
