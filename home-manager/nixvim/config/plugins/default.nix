{
  # quality-of-life
  auto-save.enable = true;
  comment.enable = true;
  nvim-autopairs.enable = true;

  # visual
  lualine.enable = true; # bottom bar
  indent-blankline.enable = true; # indent guides
  gitsigns.enable = true;
  illuminate.enable = true; # highlight same word

  # other
  todo-comments.enable = true;
  telescope = import ./telescope.nix;
  web-devicons.enable = true;
  oil = import ./oil.nix;
  treesitter = import ./treesitter.nix;
  neogit.enable = true;
  guess-indent.enable = true;
  which-key.enable = true;

  # lsp
  lsp = import ./lsp.nix;
  lsp-format.enable = true;
  cmp = import ./cmp.nix;
  cmp-buffer.enable = true;
  cmp-path.enable = true;
  cmp-nvim-lsp.enable = true;
  luasnip.enable = true; # required by cmp
  nix.enable = true;

  # rust
  crates.enable = true;

  # improving my vim motions
  hardtime.enable = true;
  vim-be-good.enable = true;
}
