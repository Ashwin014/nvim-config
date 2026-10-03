require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
	},
})

local tb, map = require("telescope.builtin"), require("map")
local nmap = map.nmap

-- map("n", "<leader>ff", tb.find_files, { desc = "Telescope: Files" })
nmap("<leader>ff", function()
	tb.find_files({
		cwd = vim.fn.expand("%:p:h"),
	})
end, { desc = "Telescope: Find files in current buffer directory" })

nmap("<leader>fg", tb.live_grep, { desc = "Telescope: Grep" })
nmap("<leader>fb", tb.buffers, { desc = "Telescope: Buffers" })
nmap("<leader>fr", tb.oldfiles, { desc = "Telescope: Recent files" })
nmap("<leader>fw", tb.grep_string, { desc = "Telescope: Grep word" })
nmap("<leader>fh", tb.help_tags, { desc = "Telescope: Help" })
nmap("<leader>fs", tb.lsp_document_symbols, { desc = "Telescope: Symbols (file)" })
nmap("<leader>fS", tb.lsp_dynamic_workspace_symbols, { desc = "Telescope: Symbols (project)" })
nmap("<leader>fd", tb.diagnostics, { desc = "Telescope: Diagnostics" })
nmap("<leader>fR", tb.lsp_references, { desc = "Telescope: References" })
