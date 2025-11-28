vim.pack.add({
	"https://codeberg.org/mfussenegger/nvim-dap",
	"https://github.com/nvim-neotest/nvim-nio", -- required by nvim-dap-ui
	"https://github.com/rcarriga/nvim-dap-ui",
})

local dap = require("dap")

-- c / c++ via gdb
--     adapter
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
--     config
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}
--     reuse c config for c++
dap.configurations.cpp = dap.configurations.c

-- dapui
local dapui = require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- keybinds
vim.keymap.set("n", "gn", vim.cmd.DapNew)
vim.keymap.set("n", "gb", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<Down>", vim.cmd.DapStepOver)
vim.keymap.set("n", "<Right>", vim.cmd.DapStepInto)
vim.keymap.set("n", "<Left>", vim.cmd.DapStepOut)
vim.keymap.set("n", "<Up>", vim.cmd.DapRestartFrame)
