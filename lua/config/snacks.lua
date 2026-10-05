local map = vim.keymap.set

-- map("n", "<leader>ui", function()
-- 	Snacks.image.hover()
-- end, { desc = "Snacks: Preview image under cursor" })
--
-- map("n", "<leader>z", function()
-- 	Snacks.zen({ win = { width = 100 } }) -- change 100 to set the text width
-- end, { desc = "Snacks: Zen mode" })
--
-- map("n", "<leader>fi", function()
-- 	Snacks.picker.files({ ft = { "png", "jpg", "jpeg", "gif", "webp", "bmp", "pdf" } })
-- end, { desc = "Snacks: Find images / pdfs (with preview)" })
--
-- map("n", "<leader>d", function()
-- 	Snacks.dashboard()
-- end, { desc = "Snacks: Open dashboard" })
--
-- map("n", "<leader>e", function()
-- 	Snacks.explorer()
-- end, { desc = "Snacks: File tree" })
--
-- map("n", "<leader>gg", function()
-- 	Snacks.lazygit()
-- end, { desc = "Snacks: Lazygit" })
--
-- map("n", "<leader>un", function()
-- 	Snacks.notifier.show_history()
-- end, { desc = "Snacks: Notification history" })
local S = Snacks

---------------------------------------------------------------------
-- Keymaps
---------------------------------------------------------------------
local maps = {
	ui = { S.image.hover, "Preview image under cursor" },
	z = {
		function()
			S.zen({ win = { width = 100 } })
		end,
		"Zen mode",
	}, -- change 100 to set the text width
	fi = {
		function()
			S.picker.files({ ft = { "png", "jpg", "jpeg", "gif", "webp", "bmp", "pdf" } })
		end,
		"Find images / pdfs (with preview)",
	},
	d = { S.dashboard, "Open dashboard" },
	e = { S.explorer, "File tree" },
	gg = { S.lazygit, "Lazygit" },
	un = { S.notifier.show_history, "Notification history" },
}

for key, opts in pairs(maps) do
	map("n", "<leader>" .. key, opts[1], { desc = "Snacks: " .. opts[2] })
end

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
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
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
				hidden = true,
				ignored = true,
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
	-- scroll = {
	-- 	enabled = true,
	-- 	animate = { duration = { step = 10, total = 200 }, easing = "linear" },
	-- },
	notifier = {
		enabled = true,
		timeout = 5000, -- ms a notification stays visible
		style = "compact", -- also "fancy" and "minimal"
	},
})
