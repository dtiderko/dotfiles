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
      # disable logging for direnv
      export DIRENV_LOG_FORMAT=

      # added by Nix installer
      if [ -e /home/dennis/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
