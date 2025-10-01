vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/lukas-reineke/lsp-format.nvim",

	-- special lsps
	"https://github.com/mrcjkb/haskell-tools.nvim",
})

local lsp_servers = {
	"bashls",
	"zls",
	"basedpyright",
	"rust_analyzer",
	"cmake",
	"clangd",
	"cssls",
	"html",
	"htmx",
	"jsonls",
	"lua_ls",
	"nixd",
}

require("lsp-format").setup()

vim.lsp.enable(lsp_servers)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufmap = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = true })
		end

		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		require("lsp-format").on_attach(client, args.buf)

		-- help
		bufmap("n", "K", vim.lsp.buf.hover)
		bufmap("n", "gd", vim.lsp.buf.definition)
		bufmap("n", "gD", vim.lsp.buf.declaration)
		bufmap("n", "gi", vim.lsp.buf.implementation)
		bufmap("n", "go", vim.lsp.buf.type_definition)
		bufmap("n", "gr", vim.lsp.buf.references)
		bufmap("n", "gs", vim.lsp.buf.signature_help)

		-- actions
		bufmap("n", "<leader>rn", vim.lsp.buf.rename)
		bufmap("n", "<leader>a", vim.lsp.buf.code_action)

		-- errors
		bufmap("n", "gl", vim.diagnostic.open_float)
		bufmap("n", "gp", vim.diagnostic.goto_prev)
		bufmap("n", "gn", vim.diagnostic.goto_next)
	end,
})

-------------------------------------------------------------------------------
--                            Non-LSP Formatters                             --
-------------------------------------------------------------------------------

local grp = vim.api.nvim_create_augroup(
	"Format on save",
	-- prevent loading an auto-command repeatedly every time a file is resourced
	{ clear = true }
)

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.py" },
	callback = function()
		local filename = vim.api.nvim_buf_get_name(0)
		vim.cmd("silent !black --preview -q " .. filename)
		vim.cmd("silent !isort --profile black --float-to-top -q " .. filename)
		vim.cmd("silent !docformatter --in-place --black " .. filename)
	end,
	group = grp,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.lua" },
	callback = function()
		local filename = vim.api.nvim_buf_get_name(0)
		vim.cmd("silent !stylua " .. filename)
	end,
	group = grp,
})

-------------------------------------------------------------------------------
--                            Special LSP config                             --
-------------------------------------------------------------------------------

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
