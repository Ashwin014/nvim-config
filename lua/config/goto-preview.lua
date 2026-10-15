require("goto-preview").setup({
	default_mappings = false, -- you set your own below, to match your gr* convention
	width = 120,
	height = 25,
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
})

local map = vim.keymap.set

map("<leader>pd", require("goto-preview").goto_preview_definition, "Preview definition")
map("<leader>pi", require("goto-preview").goto_preview_implementation, "Preview implementation")
map("<leader>pr", require("goto-preview").goto_preview_references, "Preview references")
map("<leader>pc", require("goto-preview").close_all_win, "Close preview windows")
