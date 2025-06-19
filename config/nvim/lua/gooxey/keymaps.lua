-- terminal
vim.keymap.set("n", "<leader>t", vim.cmd.term)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])

-- buffers
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)

-- pane switching
vim.keymap.set('n', '<leader>h', [[<C-w><C-h>]])
vim.keymap.set('n', '<leader>j', [[<C-w><C-j>]])
vim.keymap.set('n', '<leader>k', [[<C-w><C-k>]])
vim.keymap.set('n', '<leader>l', [[<C-w><C-l>]])

-- pane existence
vim.keymap.set('n', '<leader>s', vim.cmd.split)
vim.keymap.set('n', '<leader>v', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>q', vim.cmd.q)
