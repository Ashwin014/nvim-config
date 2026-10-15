require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		show_close_icon = false,
		show_buffer_close_icons = false,
		always_show_bufferline = true,
		offsets = {
			{ filetype = "snacks_layout_box" },
		},

		-- styling options
		-- separator_style = "slant", -- "slant" | "thick" | "thin" | custom table
		-- indicator = { style = "underline" }, -- "icon" | "underline" | "none"
		-- numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"
		-- show_tab_indicators = true,
		-- buffer_close_icon = "",
		-- modified_icon = "●",
		-- close_icon = "",
		-- max_name_length = 18,
		-- max_prefix_length = 15,
		-- truncate_names = true,
		-- tab_size = 18,
	},
})

-- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#e5c07b", bold = true, italic = false })
-- vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "BufferLineModified", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = "#d19a66" })
-- -- vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "none", bg = "none" })
-- -- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "none", bg = "none" })
--
-- vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#373737", bg = "none" }) -- match your bg color
-- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "#373737", bg = "none" })
