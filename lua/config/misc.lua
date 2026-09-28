---------------------------------------------------------------------
-- Files / misc
---------------------------------------------------------------------
require("oil").setup({
	view_options = { show_hidden = true },
	skip_confirm_for_simple_edits = true,
	delete_to_trash = true,
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open parent directory" })
vim.keymap.set("n", "<leader>_o", "<CMD>Oil --preview<CR>", { desc = "oil with preview" })
vim.keymap.set("n", "<leader>_f", function()
	require("oil").toggle_float()
end, { desc = "oil float" })

require("which-key").setup({
	win = {
		col = 0.99, -- push the window to the right edge
		width = { min = 30, max = 60 }, -- cap the width instead of full-width
	},
	layout = {
		align = "right",
	},
})

-- Terminal: <leader>t opens a split, <Esc><Esc> leaves terminal mode
vim.keymap.set("n", "<leader>t", "<cmd>botright 12split | terminal<cr>", { desc = "terminal" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

--

-- Jump to errors specifically, skipping warnings
vim.keymap.set("n", "]e", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "next error" })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "prev error" })

-- no-neck-pain.nvim
require("no-neck-pain").setup({
	width = 100, -- text column width; 80-100 reads well for prose
})
vim.keymap.set("n", "<leader>uc", "<cmd>NoNeckPain<cr>", { desc = "center buffer" })

require("nvim-web-devicons").setup({})
