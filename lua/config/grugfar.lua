---------------------------------------------------------------------
-- grug-far search-n-replace
---------------------------------------------------------------------
require("grug-far").setup({
	keymaps = {
		replace = "<leader>r",
		qflist = "<leader>q",
		syncLocations = "<leader>s",
		syncLine = "<leader>l",
		close = "<leader>c",
		historyOpen = "<leader>h",
		historyAdd = "<leader>ha",
		refresh = "<leader>R",
		openLocation = "<leader>o",
		gotoLocation = "<enter>",
		pickHistoryEntry = "<enter>",
		abort = "<leader>ab",
		help = "g?",
		toggleShowCommand = "<leader>p",
		toggleFlags = "<leader>f",
		swapEngine = "<leader>E",
	},
})

vim.keymap.set("n", "<leader>sr", function()
	require("grug-far").open()
end, { desc = "Search and replace" })

vim.keymap.set("v", "<leader>sr", function()
	require("grug-far").with_visual_selection()
end, { desc = "Search and replace (selection)" })
