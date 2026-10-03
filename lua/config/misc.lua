local map = require("map")
local nmap = map.nmap
local tmap = map.tmap

require("oil").setup({
	view_options = { show_hidden = true },
	skip_confirm_for_simple_edits = true,
})
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "<leader>_o", "<CMD>Oil --preview<CR>", { desc = "Oil with preview" })
-- vim.keymap.set("n", "<leader>_f", function()
-- 	require("oil").toggle_float()
-- end, { desc = "Oil float" })

nmap("_", "<CMD>Oil --preview<CR>", { desc = "Oil with preview" })
nmap("-", function()
	require("oil").toggle_float()
end, { desc = "Oil float" })

-- oil.nvim dep
require("nvim-web-devicons").setup({})

require("which-key").setup({
	-- delay = 0,
	win = {
		border = "rounded", -- single | double | solid | rounded
		col = 0.99, -- push the window to the right edge
		width = { min = 30, max = 60 }, -- cap the width instead of full-width
	},
	layout = {
		align = "right",
	},
})

-- Terminal: <leader>t opens a split, <Esc><Esc> leaves terminal mode
nmap("<leader>`", "<cmd>botright 12split | terminal<cr>", { desc = "Terminal" })
tmap("<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

--

-- Jump to errors specifically, skipping warnings
nmap("]e", function()
	vim.diagnostic.jump({
		count = 1,
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "next error" })

nmap("[e", function()
	vim.diagnostic.jump({
		count = -1,
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "prev error" })

-- no-neck-pain.nvim
require("no-neck-pain").setup({
	width = 100, -- text column width; 80-100 reads well for prose
})
nmap("<leader>uc", "<cmd>NoNeckPain<cr>", { desc = "Center buffer" })
