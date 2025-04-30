{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eza
    btop
    tree
  ];

  # fancy inputs
  programs.starship.enable = true;
  programs.bash = {
    enable = true;
    historyControl = [ "ignoredups" ];

    shellAliases = {
      vi = "nvim .";

      ll = "eza -l";
      la = "eza -la";
      ls = "eza";
      ".." = "cd ..";
    };

    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "nvim +Man!";
    };

    profileExtra = ''
      # added by Nix installer
      if [ -e /home/dennis/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh
      fi

      mkdir -p $HOME/.local/bin
      PATH=$PATH:$HOME/.local/bin
    '';
  };

  programs.direnv = {
    enable = true;
    silent = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
