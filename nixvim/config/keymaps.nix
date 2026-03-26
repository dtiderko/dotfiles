{
  globals.mapleader = " ";
  keymaps = [
    # terminal
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>term<CR>";
    }
    {
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
    }

    # buffers
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>bp<CR>";
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>bn<CR>";
    }

    # pane switching
    {
      mode = "n";
      key = "<leader>h";
      action = "<C-w><C-h>";
    }
    {
      mode = "n";
      key = "<leader>j";
      action = "<C-w><C-j>";
    }
    {
      mode = "n";
      key = "<leader>k";
      action = "<C-w><C-k>";
    }
    {
      mode = "n";
      key = "<leader>l";
      action = "<C-w><C-l>";
    }

    # pane existence
    {
      mode = "n";
      key = "<leader>s";
      action = "<cmd>split<CR>";
    }
    {
      mode = "n";
      key = "<leader>v";
      action = "<cmd>vsplit<CR>";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
    }
  ];
}
