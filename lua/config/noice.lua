require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
	},
	views = {
		cmdline_popup = {
			position = {
				row = "9%",
				col = "50%",
			},
			size = {
				width = 72,
				height = "auto",
			},
		},
	},
	routes = {
		{
			filter = { event = "msg_show", kind = "", find = "written" },
			opts = { skip = true },
		},
	},
})

vim.keymap.set("n", "<leader>nh", "<cmd>Noice telescope<cr>", { desc = "Message history" })
