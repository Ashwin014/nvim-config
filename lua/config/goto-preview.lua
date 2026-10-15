require("goto-preview").setup({
	default_mappings = false,
	width = 120,
	height = 25,
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
})

local map = vim.keymap.set

map("n", "<leader>pd", require("goto-preview").goto_preview_definition, { desc = "Preview definition" })
map("n", "<leader>pi", require("goto-preview").goto_preview_implementation, { desc = "Preview implementation" })
map("n", "<leader>pr", require("goto-preview").goto_preview_references, { desc = "Preview references" })
map("n", "<leader>pc", require("goto-preview").close_all_win, { desc = "Close preview windows" })
