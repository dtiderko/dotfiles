vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("oil").setup({
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,

	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<Space>"] = "actions.select",
		["q"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
	},
	use_default_keymaps = false,

	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
