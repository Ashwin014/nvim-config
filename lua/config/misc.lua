---------------------------------------------------------------------
-- Files / misc
---------------------------------------------------------------------
require("oil").setup({
	view_options = { show_hidden = true },
	skip_confirm_for_simple_edits = true,
	delete_to_trash = true,
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>O", "<CMD>Oil --preview<CR>", { desc = "Oil with preview" })
vim.keymap.set("n", "<leader>_", function()
	require("oil").toggle_float()
end, { desc = "Oil float" })

require("which-key").setup({})

-- Statusline: mode, git branch, diagnostics, LSP, file info, position
-- Set use_icons = true if you use a Nerd Font
require("mini.statusline").setup({ use_icons = true })

-- Terminal: <leader>t opens a split, <Esc><Esc> leaves terminal mode
vim.keymap.set("n", "<leader>t", "<cmd>botright 12split | terminal<cr>", { desc = "Terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--

-- Jump to errors specifically, skipping warnings
vim.keymap.set("n", "]e", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error" })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev error" })
