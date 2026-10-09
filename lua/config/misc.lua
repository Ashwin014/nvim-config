local map = require("map")
local nmap = map.nmap
local tmap = map.tmap

require("oil").setup({
	view_options = { show_hidden = true },
	skip_confirm_for_simple_edits = true,
})
nmap("-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
nmap("<leader>-", "<CMD>Oil --preview<CR>", { desc = "Oil with preview" })
-- nmap("<leader>_f", function(
-- 	require("oil").toggle_float()
-- end, { desc = "Oil float" })

-- oil.nvim dep
require("nvim-web-devicons").setup({})

-----------------------------------------------------------------------------------------

-- Terminal: <leader>t opens a split, <Esc><Esc> leaves terminal mode
nmap("<leader>`", "<cmd>botright 12split | terminal<cr>", { desc = "Terminal" })
tmap("<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

------------------------------------------------------------------------------------------

-- Jump to errors specifically, skipping warnings
nmap("]e", function()
	vim.diagnostic.jump({
		count = 1,
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Next error" })

nmap("[e", function()
	vim.diagnostic.jump({
		count = -1,
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Prev error" })

------------------------------------------------------------------------------------------

-- no-neck-pain.nvim
require("no-neck-pain").setup({
	width = 100, -- text column width; 80-100 reads well for prose
})
nmap("<leader>uc", "<cmd>NoNeckPain<cr>", { desc = "Center buffer" })

-- auto saving --------------------------------------------------------------------------
-- Create an augroup to manage auto-save autocommands cleanly
local autosave_group = vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "FocusLost" }, {
	group = autosave_group,
	pattern = "*",
	callback = function()
		-- Ensure the buffer is modifiable, has a file name, and has unsaved changes
		if vim.bo.modifiable and vim.fn.empty(vim.fn.expand("%:t")) == 0 and vim.bo.modified then
			-- Use silent! to prevent annoying errors for read-only or special files
			vim.cmd("silent! update")
		end
	end,
})
