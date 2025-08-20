require("dtiderko.opts")
require("dtiderko.keymaps")

-------------------------------------------------------------------------------
--                                  Plugins                                  --
-------------------------------------------------------------------------------

require("dtiderko.cmp")
require("dtiderko.git")
require("dtiderko.lsp")
require("dtiderko.oil")
require("dtiderko.telescope")
require("dtiderko.treesitter")
require("dtiderko.ufo")

-------------------------------------------------------------------------------
--                                   Theme                                   --
-------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })
vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-------------------------------------------------------------------------------
--                                   Style                                   --
-------------------------------------------------------------------------------

vim.pack.add({
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/RRethy/vim-illuminate",
})
require("nvim-autopairs").setup()
require("ibl").setup()

vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})
require("todo-comments").setup()
