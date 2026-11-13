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
	-- { "<leader>f", group = "Find" },
	-- { "<leader>o", group = "Obsidian" },
	-- { "<leader>oi", group = "Inserts" },
	-- { "<leader>b", group = "Buffers" },
	-- { "<leader>t", group = "Tabs" },
	-- { "<leader>g", group = "Git" },
	-- { "<leader>gh", group = "Hunks" },
	-- { "g", group = "Goto" },

	-- { "<leader>", group = "Space" },
	-- { "<leader>e", group = "Explorer / Files" },
	-- { "<leader>f", group = "Find" },
	-- { "<leader>s", group = "Search" },
	-- { "<leader>b", group = "Buffers" },
	-- { "<leader>g", group = "Git" },
	-- { "<leader>t", group = "Tabs" },
	-- { "<leader>d", group = "Diagnostics" },
	-- { "<leader>l", group = "LSP / Language" },
	-- { "<leader>x", group = "Terminal" },
	-- { "<leader>c", group = "Commands" },
	-- { "<leader>m", group = "Miscellaneous" },
	{ "<leader>D", group = "Debug" },
	{ "<leader>?", group = "Commands" },
	{ "<leader>?t", group = "Toggle" },
	{ "g", group = "Goto" },
	{ "[", group = "Prev" },
	{ "]", group = "Next" },
})
