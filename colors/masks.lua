-- colors/masks.lua  (dark)
-- Palette taken from the three-masks image.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "masks"

local c = {
	bg = "#1c1b1f", -- void
	bg_alt = "#242228",
	bg_sel = "#383033",
	line = "#2b2c33",
	fg = "#d6cdb8", -- robe cream
	fg_dim = "#918175",
	comment = "#6b6470",
	red = "#d6455a", -- orb glow
	coral = "#d9805f", -- skin / flame
	rose = "#b76a65",
	gold = "#c9a66b",
	teal = "#4aa3bf", -- thread lines
	mask = "#7fa8a2", -- mask grey-green
	purple = "#8a72c4", -- background indigo, lifted
	pink = "#c9588a",
	white = "#fff4e0", -- orb core
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
hl("CursorLineNr", { fg = c.coral, bold = true })
hl("LineNr", { fg = c.comment })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.bg_alt })
hl("Visual", { bg = c.bg_sel })
hl("Search", { fg = c.bg, bg = c.gold })
hl("IncSearch", { fg = c.bg, bg = c.coral })
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
hl("Directory", { fg = c.teal })
hl("Title", { fg = c.coral, bold = true })
hl("ErrorMsg", { fg = c.red })
hl("WarningMsg", { fg = c.gold })

-- Syntax
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.coral })
hl("String", { fg = c.gold })
hl("Number", { fg = c.coral })
hl("Boolean", { fg = c.coral })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.teal })
hl("Statement", { fg = c.red })
hl("Keyword", { fg = c.red })
hl("Operator", { fg = c.rose })
hl("PreProc", { fg = c.pink })
hl("Type", { fg = c.mask })
hl("Special", { fg = c.purple })
hl("Delimiter", { fg = c.fg_dim })
hl("Error", { fg = c.red })
hl("Todo", { fg = c.bg, bg = c.gold, bold = true })

-- Treesitter
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.pink })
hl("@property", { fg = c.mask })
hl("@parameter", { fg = c.fg, italic = true })
hl("@constructor", { fg = c.mask })
hl("@tag", { fg = c.red })
hl("@tag.attribute", { fg = c.coral })
hl("@punctuation", { fg = c.fg_dim })
hl("@markup.heading", { fg = c.coral, bold = true })
hl("@markup.link", { fg = c.teal, underline = true })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.gold })
hl("DiagnosticInfo", { fg = c.teal })
hl("DiagnosticHint", { fg = c.mask })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.gold })

-- Git / diff
hl("DiffAdd", { bg = "#233430" })
hl("DiffChange", { bg = "#2b2c33" })
hl("DiffDelete", { bg = "#3a2127" })
hl("DiffText", { bg = "#383033" })
hl("Added", { fg = c.mask })
hl("Changed", { fg = c.gold })
hl("Removed", { fg = c.red })
