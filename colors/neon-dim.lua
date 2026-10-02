-- colors/neon-dim.lua  (mid-tone, HSL lightness 25-65%)
-- Palette from the neon street image.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "neon-dim"

local c = {
	bg = "#2e3352", -- night navy
	bg_alt = "#33395b",
	bg_sel = "#4a3d71", -- violet haze
	line = "#313656",
	fg = "#9499b8", -- jacket white-lavender
	fg_dim = "#717698",
	comment = "#606580",
	violet = "#8c69d3", -- neon sign
	teal = "#53b6c6", -- teal trim
	blue = "#6d8fd5", -- fog blue
	coral = "#d96e68", -- jacket coral
	peach = "#da8b6c",
	magenta = "#c270b4",
	lav = "#927ece",
	gold = "#d8a464",
	white = "#8f95bc",
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
hl("DiffAdd", { bg = "#3a565a" })
hl("DiffChange", { bg = "#433a5f" })
hl("DiffDelete", { bg = "#5a3a4a" })
hl("DiffText", { bg = "#4a3d71" })
hl("Added", { fg = c.teal })
hl("Changed", { fg = c.blue })
hl("Removed", { fg = c.coral })
