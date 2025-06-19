-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup everything else before
-- loading lazy.nvim so that mappings are correct.

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- No background color
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Setup lazy.nvim
require("lazy").setup({
  -- automatically check for plugin updates
  checker = { enabled = true },
  spec = {
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, },

    -- quality of life
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },

    -- visual
    { -- bottom bar
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { -- indent guides
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {},
    },
    "lewis6991/gitsigns.nvim",
    "RRethy/vim-illuminate", -- highlight same word

    -- other
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
        },
      },
      config = true,
    },
    {
      'stevearc/oil.nvim',
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = { { "<leader>pv", vim.cmd.Oil } },
      lazy = false,
      config = true,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      lazy = false,
      build = ":TSUpdate",
      opts = {
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      },
    },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
      },
    },

    -- lsp
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        {
          "neovim/nvim-lspconfig",
          dependencies = {
            { "lukas-reineke/lsp-format.nvim", opts = {} }
          },
        },
      },
      opts = {},
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        {
          "L3MON4D3/LuaSnip",
          version = "v2.*",
          build = "make install_jsregexp",
          dependencies = { "rafamadriz/friendly-snippets" },
        },
      },
    },
  },
})

require("gooxey.opts")
require("gooxey.keymaps")
