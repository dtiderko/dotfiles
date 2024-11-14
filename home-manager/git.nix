{
  programs.git = {
    enable = true;
    includes = [
      {
        path = "~/coding/.gitconfig";
      }
      {
        path = "~/coding/uni/.gitconfig";
        condition = "gitdir:~/coding/uni/**";
      }
    ];

    extraConfig = {
      gpg.format = "ssh";
      pull.rebase = true;
    };
    signing = {
      signByDefault = true;
      key = "~/.ssh/id_ed25519.pub";
    };
  };
}
