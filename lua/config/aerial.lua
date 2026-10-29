require("aerial").setup({
	backends = { "lsp", "treesitter", "markdown", "man" },
	layout = {
		width = 30,
		placement = "edge",
		default_direction = "right",
	},
	show_guides = true,
})

vim.keymap.set("n", "<leader>fo", "<cmd>AerialToggle<cr>", { desc = "Symbol outline" })
