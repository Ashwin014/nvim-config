vim.keymap.set("n", "<leader>ui", function()
	Snacks.image.hover()
end, { desc = "Preview image under cursor" })

vim.keymap.set("n", "<leader>z", function()
	Snacks.zen({ win = { width = 100 } }) -- change 100 to set the text width
end, { desc = "Zen mode (centered text)" })

vim.keymap.set("n", "<leader>fi", function()
	Snacks.picker.files({ ft = { "png", "jpg", "jpeg", "gif", "webp", "bmp", "pdf" } })
end, { desc = "Find images / PDFs (with preview)" })

vim.keymap.set("n", "<leader>d", function()
	Snacks.dashboard()
end, { desc = "Open dashboard" })

vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File tree" })

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

---------------------------------------------------------------------
-- Images / media
---------------------------------------------------------------------
-- Needs a terminal with the kitty graphics protocol (Kitty, Ghostty, WezTerm)
-- and ImageMagick (`magick`) on PATH. PDFs also need Ghostscript.
-- Check with :checkhealth snacks
require("snacks").setup({
	dashboard = {
		enabled = true,
		preset = {
			header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			keys = {
				{ icon = " ", key = "f", desc = "Find file", action = ":Telescope find_files" },
				{ icon = " ", key = "n", desc = "New file", action = ":ene | startinsert" },
				{ icon = " ", key = "g", desc = "Find text", action = ":Telescope live_grep" },
				{ icon = " ", key = "r", desc = "Recent files", action = ":Telescope oldfiles" },
				{ icon = " ", key = "c", desc = "Config", action = ":e $MYVIMRC" },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			{ section = "recent_files", limit = 5, padding = 1 },
			{ section = "projects", limit = 5, padding = 1 },
		},
	},
	picker = {
		enabled = true,
		sources = {
			explorer = {
				layout = {
					layout = {
						position = "left",
						box = "vertical",
						backdrop = false,
						width = 30,
						min_width = 30,
						height = 0,
						border = "none",
						{ win = "list", border = "none" },
					},
				},
			},
		},
	},
	image = {
		enabled = true,
		doc = { inline = true, float = true, max_width = 80, max_height = 40 },
	},
})
