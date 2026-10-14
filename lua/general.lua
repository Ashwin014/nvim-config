-- Flash text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

--#region sourced from https://youtu.be/v36vLiFVOXY
-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- -- open help in vertical split
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "help",
-- 	command = "wincmd L",
-- })

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- ide like highlight when stopping cursor
vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
	desc = "highlight references under cursor",
	callback = function()
		-- only run if the cursor is not in insert mode
		if vim.fn.mode() ~= "i" then
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local supports_highlight = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.documentHighlightProvider then
					supports_highlight = true
					break -- found a supporting client, no need to check others
				end
			end

			-- 3. Proceed only if an LSP is active AND supports the feature
			if supports_highlight then
				vim.lsp.buf.clear_references()
				vim.lsp.buf.document_highlight()
			end
		end
	end,
})

-- ide like highlight when stopping cursor
vim.api.nvim_create_autocmd("CursorHoldI", {
	group = "LspReferenceHighlight",
	desc = "clear highlights when entering insert mode",
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})

--#endregion

-----------------------------------------------------------------------------------------

-- Terminal: <leader>t opens a split, <Esc><Esc> leaves terminal mode
vim.keymap.set("n", "<leader>`", "<cmd>botright 12split | terminal<cr>", { desc = "Terminal" })
tmap("<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

------------------------------------------------------------------------------------------

-- Jump to errors specifically, skipping warnings
vim.keymap.set("n", "]e", function()
	vim.diagnostic.jump({
		count = 1,
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Next error" })

vim.keymap.set("n", "[e", function()
	vim.diagnostic.jump({
		count = -1,
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Prev error" })

------------------------------------------------------------------------------------------

-- auto saving --------------------------------------------------------------------------
-- Create an augroup to manage auto-save autocommands cleanly
-- local autosave_group = vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "FocusLost" }, {
-- 	group = autosave_group,
-- 	pattern = "*",
-- 	callback = function()
-- 		-- Ensure the buffer is modifiable, has a file name, and has unsaved changes
-- 		if vim.bo.modifiable and vim.fn.empty(vim.fn.expand("%:t")) == 0 and vim.bo.modified then
-- 			-- Use silent! to prevent annoying errors for read-only or special files
-- 			vim.cmd("silent! update")
-- 		end
-- 	end,
-- })
