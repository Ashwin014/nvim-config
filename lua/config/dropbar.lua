local M = {}

function M.setup()
	require("dropbar").setup()

	vim.keymap.set("n", "<leader>e", function() require("dropbar").pick() end, { desc = "Pick from dropbar" })
	vim.keymap.set("n", "<leader>f", function() require("dropbar").fuzzy_find_toggle() end, { desc = "Fuzzy find in dropbar" })
end

return M
