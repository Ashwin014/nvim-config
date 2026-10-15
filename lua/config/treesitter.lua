---------------------------------------------------------------------
-- Treesitter (highlight, indent, folds)
---------------------------------------------------------------------
require("nvim-treesitter").install({
	"lua",
	"vim",
	"vimdoc",
	"query",
	"python",
	"javascript",
	"typescript",
	"tsx",
	"bash",
	"json",
	"yaml",
	"toml",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"regex",
	"diff",
	"rust",
	"c",
	"cpp",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		-- silently skips filetypes without a parser
		if pcall(vim.treesitter.start, ev.buf) then
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo[0][0].foldmethod = "expr"
		end
	end,
})
vim.o.foldlevelstart = 99 -- open all folds by default

require("treesitter-context").setup({ max_lines = 3 })
