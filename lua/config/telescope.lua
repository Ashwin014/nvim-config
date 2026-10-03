require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
	},
})

local tb = require("telescope.builtin")
local nmap = require("map").nmap

-- Custom one (the only special case)
nmap("<leader>ff", function()
	tb.find_files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Telescope: Find files in current buffer directory" })

-- All the simple ones
local maps = {
	fF = { tb.find_files, "Find files" },
	fg = { tb.live_grep, "Grep" },
	fb = { tb.buffers, "Buffers" },
	fr = { tb.oldfiles, "Recent files" },
	fw = { tb.grep_string, "Grep word" },
	fh = { tb.help_tags, "Help" },
	fs = { tb.lsp_document_symbols, "Symbols (file)" },
	fS = { tb.lsp_dynamic_workspace_symbols, "Symbols (project)" },
	fd = { tb.diagnostics, "Diagnostics" },
	fR = { tb.lsp_references, "References" },
	fk = { tb.keymaps, "Keymaps" },
}

for key, spec in pairs(maps) do
	nmap("<leader>" .. key, spec[1], {
		desc = "Telescope: " .. spec[2],
	})
end
