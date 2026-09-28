local map = vim.keymap.set

map("n", "<leader>ui", function()
	Snacks.image.hover()
end, { desc = "preview image under cursor" })

map("n", "<leader>z", function()
	Snacks.zen({ win = { width = 100 } }) -- change 100 to set the text width
end, { desc = "zen mode (centered text)" })

map("n", "<leader>fi", function()
	Snacks.picker.files({ ft = { "png", "jpg", "jpeg", "gif", "webp", "bmp", "pdf" } })
end, { desc = "find images / pdfs (with preview)" })

map("n", "<leader>d", function()
	Snacks.dashboard()
end, { desc = "open dashboard" })

map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "file tree" })

map("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "lazygit" })

map("n", "<leader>un", function()
	Snacks.notifier.show_history()
end, { desc = "notification history" })
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
			-- 			header = [[
			--                    █
			--                   ███
			--                  █████
			--                 ███████
			--                ████ ████
			--               ████   ████
			--              ████     ████
			--             ████  ███  ████
			--            ████  █████  ████
			--           ████ █████████ ████
			--          █████████  ██████████
			--         █████████     █████████
			--        ████████         ████████
			--       ███████             ███████
			--      ██████                 ██████
			--     █████                     █████
			--    ████                         ████
			--   ███                             ███
			--  ██                                 ██
			-- █                                     █
			-- ]],
			--
			-- 			header = [[
			-- ┌─╔═════════════════════╗─┐
			-- │╔╝          #          ╚╗│
			-- │║          ###          ║│
			-- │║         #####         ║│
			-- │║        ##   ##        ║│
			-- │║       ## ·#· ##       ║│
			-- │║      ## ##### ##      ║│
			-- │║     #####" "#####     ║│
			-- │║    ###"       "###    ║│
			-- │║   ##"           "##   ║│
			-- │╚╗ #"               "# ╔╝│
			-- └─╚═════════════════════╝─┘]],
			keys = {
				{ icon = " ", key = "f", desc = "find file", action = ":Telescope find_files" },
				{ icon = " ", key = "n", desc = "new file", action = ":ene | startinsert" },
				{ icon = " ", key = "g", desc = "find text", action = ":Telescope live_grep" },
				{ icon = " ", key = "r", desc = "recent files", action = ":Telescope oldfiles" },
				{ icon = " ", key = "c", desc = "config", action = ":e $MYVIMRC" },
				{ icon = " ", key = "q", desc = "quit", action = ":qa" },
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
	scroll = {
		enabled = true,
		animate = { duration = { step = 10, total = 200 }, easing = "linear" },
	},
	notifier = {
		enabled = true,
		timeout = 3000, -- ms a notification stays visible
		style = "compact", -- also "fancy" and "minimal"
	},
})
