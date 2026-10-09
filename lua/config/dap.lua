local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui"] = dapui.open
dap.listeners.before.event_terminated["dapui"] = dapui.close
dap.listeners.before.event_exited["dapui"] = dapui.close

local py_sub = vim.fn.has("win32") == 1 and "/venv/Scripts/python.exe" or "/venv/bin/python"
require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy" .. py_sub)

-- JS/TS (Node) via js-debug-adapter; resolved lazily so first-run install works
dap.adapters["pwa-node"] = function(cb)
	cb({
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = { command = vim.fn.exepath("js-debug-adapter"), args = { "${port}" } },
	})
end
for _, ft in ipairs({ "javascript", "javascriptreact" }) do
	dap.configurations[ft] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end
for _, ft in ipairs({ "typescript", "typescriptreact" }) do
	dap.configurations[ft] = {
		-- needs `npm i -g tsx`
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file (tsx)",
			program = "${file}",
			runtimeExecutable = "tsx",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

-- Rust / C / C++ via codelldb
-- add "codelldb" to mason-tool-installer's ensure_installed
local codelldb_path = vim.fn.stdpath("data")
	.. "/mason/packages/codelldb/extension/adapter/codelldb"
	.. (vim.fn.has("win32") == 1 and ".exe" or "")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = codelldb_path,
		args = { "--port", "${port}" },
	},
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

local map = vim.keymap.set

map("n", "<F5>", dap.continue, { desc = "Debug: continue" })
map("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
map("n", "<S-F11>", dap.step_out, { desc = "Debug: step out" })
map("n", "<F9>", dap.toggle_breakpoint, { desc = "breakpoint" })
map("n", "<leader>du", dapui.toggle, { desc = "Debug UI" })
map("n", "<leader>dr", dap.restart, { desc = "Debug: restart" })
map("n", "<leader>dt", dap.terminate, { desc = "Debug: terminate" })
map("n", "<leader>dc", dap.run_to_cursor, { desc = "Debug: run to cursor" })
map("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Debug: conditional breakpoint" })
map("n", "<leader>de", function()
	require("dapui").eval(nil, { enter = true })
end, { desc = "Debug: eval expression under cursor" })
