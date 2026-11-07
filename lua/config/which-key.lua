-- Pick a style: "right", "center", "bottom", "top", "titled"
local style = "titled"

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
		win = { border = "none", row = math.huge, col = 0, padding = { 1, 2 }, title = true, title_pos = "center" },
		layout = { width = { min = 20 }, spacing = 3 },
	},
	top = {
		win = { border = "rounded", row = 0, col = 0, padding = { 1, 2 }, title = true, title_pos = "center" },
		layout = { width = { min = 20 }, spacing = 3 },
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
