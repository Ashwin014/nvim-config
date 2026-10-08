local map = vim.keymap.set

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
			{ section = "recent_files", limit = 6, padding = 1 },
			{ section = "projects", limit = 6, padding = 1 },
		},
	},
	-- picker = {
	-- 	enabled = true,
	-- 	sources = {
	-- 		explorer = {
	-- 			hidden = true,
	-- 			ignored = true,
	-- 			layout = {
	-- 				layout = {
	-- 					position = "left",
	-- 					box = "vertical",
	-- 					backdrop = false,
	-- 					width = 30,
	-- 					min_width = 30,
	-- 					height = 0,
	-- 					border = "none",
	-- 					{ win = "list", border = "none" },
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
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

---------------------------------------------------------------------
-- Keymaps
---------------------------------------------------------------------
local maps = {
	ui = { fn = Snacks.image.hover, desc = "Preview image under cursor" },
	z = { fn = Snacks.zen, args = { win = { width = 100 }, toggles = { dim = false } }, desc = "Zen mode" }, -- change 100 to set the text width
	fi = {
		fn = Snacks.picker.files,
		args = { ft = { "png", "jpg", "jpeg", "gif", "webp", "bmp", "pdf" } },
		desc = "Find images / pdfs (with preview)",
	},
	D = { fn = Snacks.dashboard, desc = "Open dashboard" },
	-- e = { fn = Snacks.explorer, desc = "File tree" },
	gg = { fn = Snacks.lazygit, desc = "Lazygit" },
	un = { fn = Snacks.notifier.show_history, desc = "Notification history" },
}

for key, opts in pairs(maps) do
	map("n", "<leader>" .. key, function()
		if opts.args then
			opts.fn(opts.args)
		else
			opts.fn()
		end
	end, { desc = "Snacks: " .. opts.desc })
end
