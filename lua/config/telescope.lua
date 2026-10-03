require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
	},
})

local tb = require("telescope.builtin")
local map = vim.keymap.set

-- map("n", "<leader>ff", tb.find_files, { desc = "Telescope: Files" })
map("n", "<leader>ff", function()
	tb.find_files({
		cwd = vim.fn.expand("%:p:h"),
	})
end, { desc = "Telescope: Find files in current buffer directory" })

map("n", "<leader>fg", tb.live_grep, { desc = "Telescope: Grep" })
map("n", "<leader>fb", tb.buffers, { desc = "Telescope: Buffers" })
map("n", "<leader>fr", tb.oldfiles, { desc = "Telescope: Recent files" })
map("n", "<leader>fw", tb.grep_string, { desc = "Telescope: Grep word" })
map("n", "<leader>fh", tb.help_tags, { desc = "Telescope: Help" })
map("n", "<leader>fs", tb.lsp_document_symbols, { desc = "Telescope: Symbols (file)" })
map("n", "<leader>fS", tb.lsp_dynamic_workspace_symbols, { desc = "Telescope: Symbols (project)" })
map("n", "<leader>fd", tb.diagnostics, { desc = "Telescope: Diagnostics" })
map("n", "<leader>fR", tb.lsp_references, { desc = "Telescope: References" })
