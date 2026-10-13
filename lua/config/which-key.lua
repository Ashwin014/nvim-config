require("which-key").setup({
	-- delay = 0,
	win = {
		border = "rounded", -- single | double | solid | rounded
		col = 0.99, -- push the window to the right edge
		width = { min = 30, max = 60 }, -- cap the width instead of full-width
	},
	layout = {
		align = "right",
	},
})

require("which-key").add({
	{ "<leader>f", group = "Find" },
	{ "<leader>o", group = "Obsidian" },
	{ "<leader>oi", group = "Inserts" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>t", group = "Tabs" },
	{ "<leader>g", group = "Git" },
	{ "<leader>gh", group = "Hunks" },
	{ "g", group = "Go to" },
})
