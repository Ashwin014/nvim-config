require("no-neck-pain").setup({
	width = 108, -- text column width; 80-100 reads well for prose
})
vim.keymap.set("n", "<leader>uc", "<cmd>NoNeckPain<cr>", { desc = "Center buffer" })
vim.keymap.set("n", "<A-`>", "<cmd>NoNeckPain<cr>", { desc = "Center buffer" })
