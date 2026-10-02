-- colors/neon.lua  (dark, cool, clean accents, tight value range)
-- Palette from the neon street image.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "neon"

local c = {
	bg = "#151926", -- night navy
	bg_alt = "#1c2133",
	bg_sel = "#2f2d52", -- violet haze
	line = "#1a1e2d",
	fg = "#c4c9e8", -- jacket white-lavender
	fg_dim = "#8087ad",
	comment = "#596085",
	violet = "#9a80d6", -- neon sign
	teal = "#45b5c9", -- teal trim
	blue = "#7a9ad6", -- fog blue
	coral = "#e57f7c", -- jacket coral
	peach = "#e8a58a",
	magenta = "#c274b8",
	lav = "#b3a2dc",
	gold = "#e0b07a",
	white = "#e5e9fa",
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
hl("CursorLineNr", { fg = c.violet, bold = true })
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
hl("Title", { fg = c.violet, bold = true })
hl("ErrorMsg", { fg = c.coral })
hl("WarningMsg", { fg = c.gold })

-- Syntax
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.coral })
hl("String", { fg = c.peach })
hl("Number", { fg = c.coral })
hl("Boolean", { fg = c.coral })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.teal })
hl("Statement", { fg = c.violet })
hl("Keyword", { fg = c.violet })
hl("Operator", { fg = c.fg_dim })
hl("PreProc", { fg = c.magenta })
hl("Type", { fg = c.blue })
hl("Special", { fg = c.lav })
hl("Delimiter", { fg = c.fg_dim })
hl("Error", { fg = c.coral })
hl("Todo", { fg = c.bg, bg = c.gold, bold = true })

-- Treesitter
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.magenta })
hl("@property", { fg = c.blue })
hl("@parameter", { fg = c.fg, italic = true })
hl("@constructor", { fg = c.blue })
hl("@tag", { fg = c.violet })
hl("@tag.attribute", { fg = c.teal })
hl("@punctuation", { fg = c.fg_dim })
hl("@markup.heading", { fg = c.violet, bold = true })
hl("@markup.link", { fg = c.teal, underline = true })

-- Diagnostics
hl("DiagnosticError", { fg = c.coral })
hl("DiagnosticWarn", { fg = c.gold })
hl("DiagnosticInfo", { fg = c.teal })
hl("DiagnosticHint", { fg = c.lav })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.coral })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.gold })

-- Git / diff
hl("DiffAdd", { bg = "#183037" })
hl("DiffChange", { bg = "#25274a" })
hl("DiffDelete", { bg = "#3a2233" })
hl("DiffText", { bg = "#2f2d52" })
hl("Added", { fg = c.teal })
hl("Changed", { fg = c.blue })
hl("Removed", { fg = c.coral })
