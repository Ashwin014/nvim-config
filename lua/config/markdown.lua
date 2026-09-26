-- In-buffer rendering: headings, tables, code blocks, checkboxes.
-- Toggle with :RenderMarkdown toggle
require("render-markdown").setup({
	heading = { icons = {} }, -- no Nerd Font needed
	code = { sign = false },
	latex = { enabled = false },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(ev)
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.conceallevel = 2

		-- <leader>x: toggle "- [ ]" / "- [x]" (adds a checkbox on a plain list item)
		vim.keymap.set("n", "<leader>x", function()
			local line = vim.api.nvim_get_current_line()
			local new
			if line:find("%[ %]") then
				new = line:gsub("%[ %]", "[x]", 1)
			elseif line:find("%[x%]") then
				new = line:gsub("%[x%]", "[ ]", 1)
			else
				new = line:gsub("^(%s*[-*+] )", "%1[ ] ", 1)
			end
			vim.api.nvim_set_current_line(new)
		end, { buffer = ev.buf, desc = "Toggle checkbox" })
	end,
})

-- timestamping
vim.keymap.set("n", "<leader>it", function()
	vim.api.nvim_put({ os.date("%Y-%m-%d-T%H%M%S") }, "c", true, true)
end, { desc = "Insert timestamp" })

vim.keymap.set("n", "<leader>iT", function()
	vim.api.nvim_put({ os.date("[[%Y-%m-%d]]-T%H%M%S") }, "c", true, true)
end, { desc = "Insert timestamp (Wiki)" })

-- set ctrl+t as keymap in insert mode
vim.keymap.set("i", "<C-t>", function()
	return os.date("%Y-%m-%d-T%H%M%S")
end, { expr = true, desc = "Insert timestamp" })

-- add timestamping as :command
vim.api.nvim_create_user_command("Timestamp", function()
	vim.api.nvim_put({ os.date("[[%Y-%m-%d]]-T%H%M%S") }, "c", true, true)
end, {})
