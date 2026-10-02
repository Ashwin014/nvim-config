-- colors/xray.lua  (dark, tight value range)
-- Palette from the x-ray / dusk landscape image.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "xray"

local c = {
	bg = "#1b1722", -- night field
	bg_alt = "#231e2b",
	bg_sel = "#342b44", -- purple arms
	line = "#211c29",
	fg = "#a3ae90", -- gauze sky
	fg_dim = "#7b8672",
	comment = "#5e6a66",
	red = "#c0786f", -- sternum salmon
	orange = "#c57c52", -- horizon glow
	gold = "#a9a574",
	teal = "#4f9d8e", -- x-ray teal
	green = "#6f9c7a", -- hills
	mint = "#8fb3a0",
	purple = "#8a76a8",
	pink = "#b87a9a",
	white = "#c5cdb0",
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
hl("Directory", { fg = c.teal })
hl("Title", { fg = c.orange, bold = true })
hl("ErrorMsg", { fg = c.red })
hl("WarningMsg", { fg = c.gold })

-- Syntax
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.orange })
hl("String", { fg = c.green })
hl("Number", { fg = c.orange })
hl("Boolean", { fg = c.orange })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.teal })
hl("Statement", { fg = c.purple })
hl("Keyword", { fg = c.purple })
hl("Operator", { fg = c.fg_dim })
hl("PreProc", { fg = c.pink })
hl("Type", { fg = c.mint })
hl("Special", { fg = c.red })
hl("Delimiter", { fg = c.fg_dim })
hl("Error", { fg = c.red })
hl("Todo", { fg = c.bg, bg = c.gold, bold = true })

-- Treesitter
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.pink })
hl("@property", { fg = c.mint })
hl("@parameter", { fg = c.fg, italic = true })
hl("@constructor", { fg = c.mint })
hl("@tag", { fg = c.purple })
hl("@tag.attribute", { fg = c.orange })
hl("@punctuation", { fg = c.fg_dim })
hl("@markup.heading", { fg = c.orange, bold = true })
hl("@markup.link", { fg = c.teal, underline = true })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.gold })
hl("DiagnosticInfo", { fg = c.teal })
hl("DiagnosticHint", { fg = c.mint })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.gold })

-- Git / diff
hl("DiffAdd", { bg = "#1f3330" })
hl("DiffChange", { bg = "#2a2536" })
hl("DiffDelete", { bg = "#3a2530" })
hl("DiffText", { bg = "#342b44" })
hl("Added", { fg = c.green })
hl("Changed", { fg = c.gold })
hl("Removed", { fg = c.red })
