-- colors/earth.lua  (dark, built from the supplied palette)
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "earth"

-- Palette (bg, graphite, shadow and moss are raised in value from the original)
local p = {
	carbon = "#443f3c",
	graphite = "#4c4743",
	shadow = "#4f423e",
	charcoal = "#5F5A56",
	moss = "#5b6151", -- charcoal brown
	pine = "#315144",
	slate = "#385C6D",
	espresso = "#472019",
	cyan = "#3D8E9F",
	toffee = "#8D5F4A",
}

-- Lifted tints of the same hues, for text only, so they read on the lighter bg.
local t = {
	fg = "#aca69f", -- lifted charcoal
	green = "#6a9e88", -- lifted pine
	blue = "#749fb4", -- lifted slate
	sage = "#8c9c7c", -- lifted moss
	rust = "#b5675a", -- lifted espresso
	toffee = "#d0a48b", -- lifted toffee (constants)
	cyan = "#67b2c1", -- lifted pacific cyan
	kw = "#bd866b", -- lifted toffee (keywords)
}

local c = {
	bg = p.carbon,
	bg_alt = p.graphite,
	bg_sel = p.moss,
	line = p.shadow,
	fg = t.fg,
	fg_dim = "#8a827d",
	comment = "#7a736e",
	cyan = t.cyan,
	toffee = t.kw,
	toffee2 = t.toffee,
	green = t.green,
	blue = t.blue,
	sage = t.sage,
	rust = t.rust,
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
hl("CursorLineNr", { fg = c.toffee2, bold = true })
hl("LineNr", { fg = c.comment })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.bg_alt })
hl("Visual", { bg = c.bg_sel })
hl("Search", { fg = c.bg, bg = c.toffee2 })
hl("IncSearch", { fg = c.bg, bg = c.cyan })
hl("MatchParen", { fg = c.fg, bg = p.slate, bold = true })
hl("VertSplit", { fg = c.bg_alt })
hl("WinSeparator", { fg = c.bg_alt })
hl("StatusLine", { fg = c.fg, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.fg_dim, bg = c.bg_alt })
hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.fg, bg = p.slate })
hl("Folded", { fg = c.fg_dim, bg = c.bg_alt })
hl("NonText", { fg = c.bg_sel })
hl("Whitespace", { fg = c.bg_alt })
hl("Directory", { fg = c.cyan })
hl("Title", { fg = c.toffee2, bold = true })
hl("ErrorMsg", { fg = c.rust })
hl("WarningMsg", { fg = c.toffee2 })

-- Syntax
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.toffee2 })
hl("String", { fg = c.green })
hl("Number", { fg = c.toffee2 })
hl("Boolean", { fg = c.toffee2 })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.cyan })
hl("Statement", { fg = c.toffee })
hl("Keyword", { fg = c.toffee })
hl("Operator", { fg = c.fg_dim })
hl("PreProc", { fg = c.sage })
hl("Type", { fg = c.blue })
hl("Special", { fg = c.sage })
hl("Delimiter", { fg = c.fg_dim })
hl("Error", { fg = c.rust })
hl("Todo", { fg = c.bg, bg = c.toffee2, bold = true })

-- Treesitter
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.sage })
hl("@property", { fg = c.blue })
hl("@parameter", { fg = c.fg, italic = true })
hl("@constructor", { fg = c.blue })
hl("@tag", { fg = c.toffee })
hl("@tag.attribute", { fg = c.cyan })
hl("@punctuation", { fg = c.fg_dim })
hl("@markup.heading", { fg = c.toffee2, bold = true })
hl("@markup.link", { fg = c.cyan, underline = true })

-- Diagnostics
hl("DiagnosticError", { fg = c.rust })
hl("DiagnosticWarn", { fg = c.toffee2 })
hl("DiagnosticInfo", { fg = c.cyan })
hl("DiagnosticHint", { fg = c.sage })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.rust })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.toffee2 })

-- Git / diff (lifted so they show against the lighter bg)
hl("DiffAdd", { bg = "#37624f" })
hl("DiffChange", { bg = "#3e5865" })
hl("DiffDelete", { bg = "#60352e" })
hl("DiffText", { bg = p.moss })
hl("Added", { fg = c.green })
hl("Changed", { fg = c.blue })
hl("Removed", { fg = c.rust })
