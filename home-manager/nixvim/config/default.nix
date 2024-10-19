{
  plugins = import ./plugins;
  opts = import ./opts.nix;
  keymaps = import ./keymaps.nix;

  enable = true;

  colorschemes.gruvbox.enable = true;
  extraConfigLua = ''
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  '';

  globals = {
    mapleader = " ";

    # zig shall not autoformat my files
    zig_fmt_autosave = 0;
  };
  clipboard = {
    register = "unnamedplus";
    providers.xclip.enable = true;
  };
}
