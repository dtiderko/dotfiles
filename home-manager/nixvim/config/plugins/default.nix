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
  harpoon = import ./harpoon.nix;
  neogit.enable = true;

  # lsp
  lsp = import ./lsp.nix;
  cmp = import ./cmp.nix;
  cmp-buffer.enable = true;
  cmp-path.enable = true;
  cmp-nvim-lsp.enable = true;
  luasnip.enable = true; # required by cmp
  nix.enable = true;

  # rust
  rustaceanvim.enable = true;
  crates.enable = true;
}
