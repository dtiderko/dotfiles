{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # required by telescope
    ripgrep
    fd
  ];

  programs.nixvim = (import ./config pkgs);
}
