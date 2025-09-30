{ pkgs, ... }: {
  # use neovim nightly
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

  environment.systemPackages = with pkgs; [
    alacritty

    # git stuff
    git
    gnupg

    # bash stuff
    eza
    starship
    direnv

    # neovim stuff
    neovim
    cmake
    gnumake
    ripgrep
    lua5_4_compat
    luajitPackages.luarocks
    fd
    perl
    python313Packages.pip
    python313Packages.pynvim
    haskellPackages.cabal-gild
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
