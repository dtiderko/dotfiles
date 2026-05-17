{ pkgs, ... }:
{
  # colorscheme + transparent background
  colorschemes.gruvbox.enable = true;
  extraConfigLua = ''
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  '';

  # required by render-markdown
  extraPackages = [ pkgs.python314Packages.pylatexenc ];

  plugins = {
    nvim-autopairs.enable = true;
    indent-blankline.enable = true;
    illuminate.enable = true;
    todo-comments.enable = true;
    render-markdown.enable = true;
  };
}
