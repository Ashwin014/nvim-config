require("treesj").setup({
	use_default_keymaps = false,
})

vim.keymap.set("n", "<leader>j", require("treesj").toggle, { desc = "Toggle split/join" })
vim.keymap.set("n", "<leader>js", require("treesj").split, { desc = "Split" })
vim.keymap.set("n", "<leader>jj", require("treesj").join, { desc = "Join" })
