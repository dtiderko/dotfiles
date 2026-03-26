{
  plugins = {
    neogit.enable = true;
    gitsigns.enable = true;
    oil-git-status.enable = true;
  };
  keymaps = [{
    mode = "n";
    key = "<leader>G";
    action = "<cmd>Neogit<CR>";
  }];
}
