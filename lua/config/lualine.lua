require("lualine").setup({
	options = {
		theme = "auto", -- takes its colors from your colorscheme
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = {
			left = vim.fn.nr2char(0xe0b8),
			right = vim.fn.nr2char(0xe0be),
		},
	},
	sections = {
		lualine_c = { { "filename", path = 1 } },
	},
})
