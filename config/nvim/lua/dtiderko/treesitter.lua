vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { load = true })
require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
