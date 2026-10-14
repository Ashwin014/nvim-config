require("oil").setup({
	view_options = { show_hidden = true },
	skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", "<CMD>Oil --preview<CR>", { desc = "Oil with preview" })
-- vim.keymap.set("n", "<leader>_f", function(
-- 	require("oil").toggle_float()
-- end, { desc = "Oil float" })

-- oil.nvim dep
require("nvim-web-devicons").setup({})
