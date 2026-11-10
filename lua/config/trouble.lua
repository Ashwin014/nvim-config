local M = {}

function M.setup()
	local trouble = require("trouble")
	trouble.setup()

	vim.keymap.set("n", "<leader>tm", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
	vim.keymap.set("n", "<leader>tT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics (Trouble)" })
	vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols (Trouble)" })
	vim.keymap.set("n", "<leader>tl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list (Trouble)" })
	vim.keymap.set("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list (Trouble)" })
end

return M
