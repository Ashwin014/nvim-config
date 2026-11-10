local M = {}

function M.setup()
	require("dropbar").setup()

	local api = require("dropbar.api")
	local pick = api.pick
	local fuzzy_find_toggle = api.fuzzy_find_toggle

	vim.keymap.set("n", "<leader>e", function() pick() end, { desc = "Pick from dropbar" })
	vim.keymap.set("n", "<leader>f", function() fuzzy_find_toggle() end, { desc = "Fuzzy find in dropbar" })
end

return M

