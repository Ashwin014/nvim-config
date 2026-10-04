-- In-buffer rendering: headings, tables, code blocks, checkboxes.
-- Toggle with :RenderMarkdown toggle
require("render-markdown").setup({
	heading = { icons = {} }, -- no Nerd Font needed
	code = { sign = false },
	latex = { enabled = false },
	bullet = {
		icons = { "•", "◦", "▪", "▫" },
	},
	dash = { enabled = false }, -- disables the rendered horizontal rule line
	html = {
		comment = {
			conceal = false, -- show HTML comments instead of hiding them
		},
	},
	link = {
		enabled = true,
		image = "📷",
		email = "",
		hyperlink = "🌐",
		wiki = { icon = "🔗" },
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(ev)
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.conceallevel = 2
		-- be list/outline aware
		-- vim.opt_local.comments = "b:-,b:*,b:+,n:>"
		vim.opt_local.formatoptions:append({ "r", "o" })

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
		end, { buffer = ev.buf, desc = "toggle checkbox" })
	end,
})

-- open browser with rendered markdown
vim.keymap.set("n", "<leader>up", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown preview (browser)" })
