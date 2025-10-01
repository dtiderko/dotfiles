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
    ripgrep
    fd
    gcc
    nodejs_24
    tree-sitter
    wl-clipboard
    #     extra formatter
    python313Packages.black
    python313Packages.isort
    python313Packages.docformatter
    stylua
    #     lsp
    bash-language-server
    cmake-language-server
    vscode-langservers-extracted
    htmx-lsp
    lua-language-server
    nixd
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
