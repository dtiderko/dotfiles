-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()

local bufmap = function(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
end

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

-- haskell specific

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
bufmap("n", "<space>cl", vim.lsp.codelens.run)
-- Hoogle search for the type signature of the definition under the cursor
bufmap("n", "<space>hs", ht.hoogle.hoogle_signature)
-- Evaluate all code snippets
bufmap("n", "<space>ea", ht.lsp.buf_eval_all)
-- Toggle a GHCi repl for the current package
bufmap("n", "<leader>rr", ht.repl.toggle)
-- Toggle a GHCi repl for the current buffer
bufmap("n", "<leader>rf", function()
	ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end)
bufmap("n", "<leader>rq", ht.repl.quit)
