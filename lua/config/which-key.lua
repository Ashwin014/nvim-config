-- Pick a style: "right", "center", "bottom", "top", "titled"
local style = "top"

local styles = {
	right = {
		win = { border = "rounded", col = 0.99, width = { min = 30, max = 60 } },
		layout = { align = "right" },
	},
	center = {
		win = { border = "rounded", width = { min = 40, max = 80 } },
		layout = { align = "center" },
	},
	bottom = {
		win = { border = "none", position = "bottom", height = { min = 4, max = 25 }, width = 1 },
		layout = { align = "left", spacing = 4 },
	},
	top = {
		win = { border = "rounded", position = "top", width = { min = 40, max = 80 } },
		layout = { align = "center" },
	},
	titled = {
		win = { border = "rounded", title = "Keymaps", title_pos = "center", width = { min = 40, max = 80 } },
		layout = { align = "center" },
	},
}

require("which-key").setup(vim.tbl_deep_extend("force", {}, styles[style]))

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
