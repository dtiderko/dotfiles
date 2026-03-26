{
  dependencies.fd.enable = true;

  plugins.web-devicons.enable = true; # required by telescope
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader><leader>" = "find_files";
      "<leader>g" = "live_grep";
    };
  };
}
