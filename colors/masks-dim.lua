-- colors/masks-dim.lua  (dark, tight value range)
-- Same hues as masks.lua, but every color sits in a narrow brightness band.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "masks-dim"

local c = {
	bg = "#25232a",
	bg_alt = "#2d2b33",
	bg_sel = "#3d3a44",
	line = "#2a282f",
	fg = "#b5ad9c",
	fg_dim = "#8a8478",
	comment = "#6f6a72",
	red = "#b8606a",
	coral = "#b8795f",
	rose = "#a87072",
	gold = "#a89468",
	teal = "#5f98ab",
	mask = "#7a9a94",
	purple = "#8878b0",
	pink = "#aa6a8c",
	white = "#cfc7b5",
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
hl("DiffAdd", { bg = "#2c3835" })
hl("DiffChange", { bg = "#312f3a" })
hl("DiffDelete", { bg = "#3d2b31" })
hl("DiffText", { bg = "#3d3a44" })
hl("Added", { fg = c.mask })
hl("Changed", { fg = c.gold })
hl("Removed", { fg = c.red })
