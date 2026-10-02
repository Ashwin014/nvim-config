-- colors/fringe.lua  (dark, warm, tight value range)
-- Palette from the portrait image.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "fringe"

local c = {
	bg = "#2b201f", -- dark brown wall
	bg_alt = "#352827",
	bg_sel = "#4a3638",
	line = "#302423",
	fg = "#c2a39c", -- skin / hair pale rose
	fg_dim = "#9a7c78",
	comment = "#7a605f",
	rose = "#b86a68", -- lips
	orange = "#b98c68", -- warm shoulder
	gold = "#b3a063", -- yellow patch
	blue = "#8c98b0", -- eyes
	lav = "#9a8aae", -- shirt lavender
	mauve = "#a67a8e",
	tan = "#a7766d",
	white = "#ddbbb2",
}

local hl = function(g, o)
	vim.api.nvim_set_hl(0, g, o)
end

-- UI
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hl("FloatBorder", { fg = c.fg_dim, bg = c.bg_alt })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.line })
hl("CursorLineNr", { fg = c.orange, bold = true })
hl("LineNr", { fg = c.comment })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.bg_alt })
hl("Visual", { bg = c.bg_sel })
hl("Search", { fg = c.bg, bg = c.gold })
hl("IncSearch", { fg = c.bg, bg = c.orange })
hl("MatchParen", { fg = c.white, bg = c.bg_sel, bold = true })
hl("VertSplit", { fg = c.bg_sel })
hl("WinSeparator", { fg = c.bg_sel })
hl("StatusLine", { fg = c.fg, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.fg_dim, bg = c.bg_alt })
hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.white, bg = c.bg_sel })
hl("Folded", { fg = c.fg_dim, bg = c.bg_alt })
hl("NonText", { fg = c.bg_sel })
hl("Whitespace", { fg = c.bg_sel })
hl("Directory", { fg = c.blue })
hl("Title", { fg = c.orange, bold = true })
hl("ErrorMsg", { fg = c.rose })
hl("WarningMsg", { fg = c.gold })

-- Syntax
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.orange })
hl("String", { fg = c.gold })
hl("Number", { fg = c.orange })
hl("Boolean", { fg = c.orange })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.blue })
hl("Statement", { fg = c.rose })
hl("Keyword", { fg = c.rose })
hl("Operator", { fg = c.fg_dim })
hl("PreProc", { fg = c.mauve })
hl("Type", { fg = c.lav })
hl("Special", { fg = c.mauve })
hl("Delimiter", { fg = c.fg_dim })
hl("Error", { fg = c.rose })
hl("Todo", { fg = c.bg, bg = c.gold, bold = true })

-- Treesitter
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.mauve })
hl("@property", { fg = c.lav })
hl("@parameter", { fg = c.fg, italic = true })
hl("@constructor", { fg = c.lav })
hl("@tag", { fg = c.rose })
hl("@tag.attribute", { fg = c.orange })
hl("@punctuation", { fg = c.fg_dim })
hl("@markup.heading", { fg = c.orange, bold = true })
hl("@markup.link", { fg = c.blue, underline = true })

-- Diagnostics
hl("DiagnosticError", { fg = c.rose })
hl("DiagnosticWarn", { fg = c.gold })
hl("DiagnosticInfo", { fg = c.blue })
hl("DiagnosticHint", { fg = c.lav })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.rose })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.gold })

-- Git / diff
hl("DiffAdd", { bg = "#2f3126" })
hl("DiffChange", { bg = "#33293a" })
hl("DiffDelete", { bg = "#402627" })
hl("DiffText", { bg = "#4a3638" })
hl("Added", { fg = c.gold })
hl("Changed", { fg = c.blue })
hl("Removed", { fg = c.rose })
