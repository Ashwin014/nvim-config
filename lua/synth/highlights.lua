local M = {}

function M.setup()
	-- Clear existing highlights and reset syntax
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "synth"

	local p = require("synth.palette").colors

	-- Helper function to apply highlight groups cleanly
	local function hl(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- ----------------------------------------------------------------co
	-- Editor UI Groups
	-- -------------------------------------------------------------
	hl("Normal", { fg = p.fg, bg = p.bg })
	hl("NormalNC", { fg = p.fg, bg = p.bg_dark })
	hl("SignColumn", { bg = p.bg })
	hl("CursorLine", { bg = p.cursorline })
	hl("CursorLineNr", { fg = p.yellow, bold = true })
	hl("LineNr", { fg = p.comment })
	hl("VertSplit", { fg = p.border })
	hl("StatusLine", { fg = p.fg, bg = p.bg_highlight })
	hl("Visual", { bg = p.selection })
	hl("Search", { fg = p.bg, bg = p.yellow, bold = true })
	hl("Pmenu", { fg = p.fg, bg = p.bg_highlight })
	hl("PmenuSel", { fg = p.bg, bg = p.blue, bold = true })

	-- -------------------------------------------------------------
	-- Standard Syntax Groups
	-- -------------------------------------------------------------
	hl("Comment", { fg = p.comment, italic = true })
	hl("Constant", { fg = p.orange })
	hl("String", { fg = p.green })
	hl("Character", { fg = p.green })
	hl("Number", { fg = p.orange })
	hl("Boolean", { fg = p.orange })
	hl("Identifier", { fg = p.blue })
	hl("Function", { fg = p.cyan, italic = true, bold = true })
	hl("Statement", { fg = p.purple })
	hl("Conditional", { fg = p.purple, italic = true })
	hl("Repeat", { fg = p.purple, italic = true })
	hl("Label", { fg = p.purple })
	hl("Operator", { fg = p.cyan })
	hl("Keyword", { fg = p.purple, bold = true })
	hl("Exception", { fg = p.red })
	hl("PreProc", { fg = p.yellow })
	hl("Type", { fg = p.yellow })
	hl("Special", { fg = p.blue })
	hl("Underlined", { underline = true })
	hl("Error", { fg = p.red, bg = p.bg_dark, bold = true })

	-- -------------------------------------------------------------
	-- Treesitter Highlighting (Modern Nvim Syntax)
	-- -------------------------------------------------------------
	hl("@variable", { fg = p.fg })
	hl("@variable.builtin", { fg = p.red })
	hl("@variable.parameter", { fg = p.orange, italic = true })
	hl("@property", { fg = p.cyan })
	hl("@field", { fg = p.cyan })
	hl("@constructor", { fg = p.yellow })
	hl("@function", { fg = p.cyan })
	hl("@function.builtin", { fg = p.blue })
	hl("@function.macro", { fg = p.blue })
	hl("@keyword", { fg = p.purple, bold = true })
	hl("@keyword.function", { fg = p.purple })
	hl("@string", { fg = p.green })
	hl("@number", { fg = p.orange })
	hl("@type", { fg = p.yellow })
	hl("@type.builtin", { fg = p.yellow })
	hl("@tag", { fg = p.red })
	hl("@tag.attribute", { fg = p.orange })
end

return M
