require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
	},
})

local tb = require("telescope.builtin")
local map = vim.keymap.set

-- Custom one (the only special case)
-- map("n", "<leader>fF", function()
-- 	tb.find_files({ cwd = vim.fn.expand("%:p:h") })
-- end, { desc = "Telescope: Find files in current buffer directory" })
--
map("n", "<leader>F", function()
	tb.find_files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Telescope: Find files in current buffer directory" })

map("v", "<leader>/", function()
	local saved = vim.fn.getreg("v")
	vim.cmd('normal! "vy')
	local selection = vim.fn.getreg("v")
	vim.fn.setreg("v", saved)
	require("telescope.builtin").grep_string({ search = selection })
end, { desc = "Telescope: Grep selection" })

-- All the simple ones
local maps = {
	-- ff = { tb.find_files, "Find files" },
	-- fg = { tb.live_grep, "Grep" },
	-- fb = { tb.buffers, "Buffers" },
	-- fr = { tb.oldfiles, "Recent files" },
	-- fw = { tb.grep_string, "Grep word" },
	-- fh = { tb.help_tags, "Help" },
	-- fs = { tb.lsp_document_symbols, "Symbols (file)" },
	-- fS = { tb.lsp_dynamic_workspace_symbols, "Symbols (project)" },
	-- fd = { tb.diagnostics, "Diagnostics" },
	-- fR = { tb.lsp_references, "References" },
	-- fk = { tb.keymaps, "Keymaps" },
	-- fc = { tb.resume, "Resume" },
	--
	f = { tb.find_files, "Find files" },
	b = { tb.buffers, "Buffers" },
	o = { tb.oldfiles, "Recent files" },
	-- sw = { tb.grep_string, "Grep word" },
	h = { tb.help_tags, "Help" },
	s = { tb.lsp_document_symbols, "Symbols (file)" },
	S = { tb.lsp_dynamic_workspace_symbols, "Symbols (project)" },
	d = { tb.diagnostics, "Diagnostics" },
	-- lr = { tb.lsp_references, "References" },
	k = { tb.keymaps, "Keymaps" },
	j = { tb.jumplist, "Jumplist" },
}

for key, spec in pairs(maps) do
	map("n", "<leader>" .. key, spec[1], {
		desc = "Telescope: " .. spec[2],
	})
end

map("n", "<leader>'", tb.resume, { desc = "Telescope: Resume" })
map("n", "<leader>/", tb.live_grep, { desc = "Telescope: Grep" })
map("n", "<leader>?", tb.help_tags, { desc = "Telescope: Help" })
