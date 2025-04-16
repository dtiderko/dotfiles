{
  plugins.harpoon.enable = true;

  keymaps = [
    { mode = "n"; key = "<leader>mm"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
    { mode = "n"; key = "<leader>mt"; action.__raw = "function() require'harpoon':list():add() end"; }

    # navPrev / Next
    { mode = "n"; key = "<leader>mp"; action.__raw = "function() require'harpoon':list():prev() end"; }
    { mode = "n"; key = "<leader>mn"; action.__raw = "function() require'harpoon':list():next() end"; }

    # navFile
    { mode = "n"; key = "<leader>m1"; action.__raw = "function() require'harpoon':list():select(1) end"; }
    { mode = "n"; key = "<leader>m2"; action.__raw = "function() require'harpoon':list():select(2) end"; }
    { mode = "n"; key = "<leader>m3"; action.__raw = "function() require'harpoon':list():select(3) end"; }
    { mode = "n"; key = "<leader>m4"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    { mode = "n"; key = "<leader>m5"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    { mode = "n"; key = "<leader>m6"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    { mode = "n"; key = "<leader>m7"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    { mode = "n"; key = "<leader>m8"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    { mode = "n"; key = "<leader>m9"; action.__raw = "function() require'harpoon':list():select(4) end"; }
  ];
}
