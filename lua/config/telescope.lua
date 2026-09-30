require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
	},
})

local tb = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", tb.find_files, { desc = "Files" })
map("n", "<leader>fg", tb.live_grep, { desc = "Grep" })
map("n", "<leader>fb", tb.buffers, { desc = "Buffers" })
map("n", "<leader>fr", tb.oldfiles, { desc = "Recent files" })
map("n", "<leader>fw", tb.grep_string, { desc = "Grep word" })
map("n", "<leader>fh", tb.help_tags, { desc = "Help" })
map("n", "<leader>fs", tb.lsp_document_symbols, { desc = "Symbols (file)" })
map("n", "<leader>fS", tb.lsp_dynamic_workspace_symbols, { desc = "Symbols (project)" })
map("n", "<leader>fd", tb.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fR", tb.lsp_references, { desc = "References" })
