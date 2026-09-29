-- onedark-zed.lua
-- Neovim port of "Zed OneDark" (Helix theme by EricHenry)
-- Install: save as ~/.config/nvim/colors/onedark-zed.lua
-- Use:     :colorscheme onedark-zed

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "onedark-zed"

-- palette (alpha stripped from source hex values)
local c = {
	yellow = "#c9b89e",
	orange = "#b09d86",
	blue = "#96afd0",
	blue_gray = "#5a6f89",
	red = "#be9090",
	purple = "#b393be",
	green = "#a3b596",
	cyan = "#6eb4bf",
	gray = "#323439",
	light_gray = "#6a6d73",
	faint_gray = "#3b4048",
	linenr = "#5d636f",
	white = "#ced0d4",
	black = "#282c33",
	selection = "#293b5b",
	frameline = "#97202a",
	none = "NONE",
}

local fg = c.white
local bg = c.black

local hl = vim.api.nvim_set_hl

-- editor UI
hl(0, "Normal", { fg = fg, bg = bg })
hl(0, "NormalFloat", { fg = fg, bg = c.gray })
hl(0, "NormalNC", { fg = fg, bg = bg })
hl(0, "SignColumn", { fg = fg, bg = bg })
hl(0, "FoldColumn", { fg = c.light_gray, bg = bg })
hl(0, "Folded", { fg = c.light_gray, bg = c.gray })

hl(0, "LineNr", { fg = c.linenr })
hl(0, "CursorLineNr", { fg = fg })
hl(0, "CursorLine", { bg = c.gray })
hl(0, "CursorColumn", { bg = c.gray })
hl(0, "ColorColumn", { bg = c.gray })

hl(0, "Cursor", { fg = bg, bg = fg })
hl(0, "lCursor", { fg = bg, bg = fg })
hl(0, "TermCursor", { fg = bg, bg = fg })

hl(0, "Visual", { bg = c.selection })
hl(0, "VisualNOS", { bg = c.faint_gray })

hl(0, "Search", { fg = fg, bg = c.blue, underline = true })
hl(0, "IncSearch", { fg = bg, bg = c.orange })
hl(0, "CurSearch", { fg = bg, bg = c.orange })

hl(0, "StatusLine", { fg = c.white, bg = c.gray })
hl(0, "StatusLineNC", { fg = c.light_gray, bg = c.black })
hl(0, "WinSeparator", { fg = c.gray, bg = bg })
hl(0, "VertSplit", { fg = c.gray, bg = bg })

hl(0, "TabLine", { fg = c.light_gray, bg = c.gray })
hl(0, "TabLineFill", { bg = c.gray })
hl(0, "TabLineSel", { fg = fg, bg = c.blue_gray })

hl(0, "Pmenu", { fg = fg, bg = c.gray })
hl(0, "PmenuSel", { fg = bg, bg = c.blue })
hl(0, "PmenuSbar", { bg = c.gray })
hl(0, "PmenuThumb", { bg = c.light_gray })

hl(0, "WildMenu", { fg = bg, bg = c.blue })
hl(0, "MsgArea", { fg = fg, bg = bg })
hl(0, "ModeMsg", { fg = fg, bold = true })
hl(0, "MoreMsg", { fg = c.blue })
hl(0, "Question", { fg = c.blue })
hl(0, "ErrorMsg", { fg = c.red })
hl(0, "WarningMsg", { fg = c.yellow })

hl(0, "MatchParen", { fg = c.blue, underline = true })
hl(0, "NonText", { fg = c.faint_gray })
hl(0, "Whitespace", { fg = c.light_gray })
hl(0, "SpecialKey", { fg = c.faint_gray })
hl(0, "Conceal", { fg = c.light_gray })
hl(0, "Directory", { fg = c.blue })
hl(0, "Title", { fg = c.red, bold = true })

hl(0, "DiffAdd", { fg = c.green })
hl(0, "DiffChange", { fg = c.yellow })
hl(0, "DiffDelete", { fg = c.red })
hl(0, "DiffText", { fg = c.yellow, bold = true })

-- syntax
hl(0, "Comment", { fg = c.light_gray, italic = true })

hl(0, "Constant", { fg = c.yellow })
hl(0, "String", { fg = c.green })
hl(0, "Character", { fg = c.yellow })
hl(0, "Number", { fg = c.orange })
hl(0, "Boolean", { fg = c.yellow })
hl(0, "Float", { fg = c.orange })

hl(0, "Identifier", { fg = fg })
hl(0, "Function", { fg = c.blue })

hl(0, "Statement", { fg = c.purple })
hl(0, "Conditional", { fg = c.purple })
hl(0, "Repeat", { fg = c.purple })
hl(0, "Label", { fg = fg })
hl(0, "Operator", { fg = fg })
hl(0, "Keyword", { fg = c.purple })
hl(0, "Exception", { fg = c.purple })

hl(0, "PreProc", { fg = c.purple })
hl(0, "Include", { fg = c.purple })
hl(0, "Define", { fg = c.purple })
hl(0, "Macro", { fg = c.blue })
hl(0, "PreCondit", { fg = c.purple })

hl(0, "Type", { fg = c.cyan })
hl(0, "StorageClass", { fg = c.cyan })
hl(0, "Structure", { fg = c.cyan })
hl(0, "Typedef", { fg = c.cyan })

hl(0, "Special", { fg = fg })
hl(0, "SpecialChar", { fg = c.yellow })
hl(0, "Tag", { fg = fg })
hl(0, "Delimiter", { fg = fg })
hl(0, "SpecialComment", { fg = c.light_gray, italic = true })
hl(0, "Debug", { fg = c.red })

hl(0, "Underlined", { underline = true })
hl(0, "Ignore", { fg = c.light_gray })
hl(0, "Error", { fg = c.red, bold = true })
hl(0, "Todo", { fg = c.yellow, bold = true })

-- diagnostics
hl(0, "DiagnosticError", { fg = c.red, bold = true })
hl(0, "DiagnosticWarn", { fg = c.yellow, bold = true })
hl(0, "DiagnosticInfo", { fg = c.blue, bold = true })
hl(0, "DiagnosticHint", { fg = c.green, bold = true })

hl(0, "DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hl(0, "DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hl(0, "DiagnosticUnderlineHint", { sp = c.green, undercurl = true })
hl(0, "DiagnosticDeprecated", { strikethrough = true })
hl(0, "DiagnosticUnnecessary", { fg = c.light_gray })

hl(0, "DiagnosticVirtualTextError", { fg = c.red, bg = c.gray })
hl(0, "DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.gray })
hl(0, "DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.gray })
hl(0, "DiagnosticVirtualTextHint", { fg = c.green, bg = c.gray })

-- LSP
hl(0, "LspReferenceText", { bg = c.faint_gray })
hl(0, "LspReferenceRead", { bg = c.faint_gray })
hl(0, "LspReferenceWrite", { bg = c.faint_gray })
hl(0, "LspInlayHint", { fg = c.blue_gray, bold = true, bg = c.faint_gray })
hl(0, "LspCodeLens", { fg = c.light_gray })

-- treesitter
hl(0, "@variable", { fg = fg })
hl(0, "@variable.builtin", { fg = c.orange })
hl(0, "@variable.parameter", { fg = fg })
hl(0, "@variable.member", { fg = c.red })

hl(0, "@constant", { fg = c.yellow })
hl(0, "@constant.builtin", { fg = c.yellow })
hl(0, "@constant.macro", { fg = c.yellow })

hl(0, "@string", { fg = c.green })
hl(0, "@string.escape", { fg = c.yellow })
hl(0, "@string.regexp", { fg = c.yellow })
hl(0, "@character", { fg = c.yellow })
hl(0, "@number", { fg = c.orange })
hl(0, "@boolean", { fg = c.yellow })
hl(0, "@float", { fg = c.orange })

hl(0, "@function", { fg = c.blue })
hl(0, "@function.builtin", { fg = c.blue })
hl(0, "@function.macro", { fg = c.blue })
hl(0, "@function.method", { fg = c.blue })
hl(0, "@constructor", { fg = c.blue })

hl(0, "@keyword", { fg = c.purple })
hl(0, "@keyword.function", { fg = c.purple })
hl(0, "@keyword.return", { fg = c.purple })
hl(0, "@keyword.operator", { fg = c.purple })
hl(0, "@conditional", { fg = c.purple })
hl(0, "@repeat", { fg = c.purple })
hl(0, "@exception", { fg = c.purple })
hl(0, "@label", { fg = fg })
hl(0, "@operator", { fg = fg })
hl(0, "@punctuation", { fg = fg })
hl(0, "@punctuation.bracket", { fg = fg })
hl(0, "@punctuation.delimiter", { fg = fg })
hl(0, "@punctuation.special", { fg = fg })

hl(0, "@type", { fg = c.cyan })
hl(0, "@type.builtin", { fg = c.cyan })
hl(0, "@namespace", { fg = fg })
hl(0, "@module", { fg = fg })
hl(0, "@attribute", { fg = c.yellow })
hl(0, "@property", { fg = c.red })
hl(0, "@tag", { fg = fg })
hl(0, "@tag.attribute", { fg = c.yellow })
hl(0, "@tag.delimiter", { fg = fg })
hl(0, "@comment", { fg = c.light_gray, italic = true })

hl(0, "@markup.heading", { fg = c.red, bold = true })
hl(0, "@markup.list", { fg = c.red })
hl(0, "@markup.bold", { fg = c.yellow, bold = true })
hl(0, "@markup.italic", { fg = c.purple, italic = true })
hl(0, "@markup.strikethrough", { strikethrough = true })
hl(0, "@markup.raw", { fg = c.green })
hl(0, "@markup.quote", { fg = c.yellow })
hl(0, "@markup.link.url", { fg = c.cyan, underline = true })
hl(0, "@markup.link.label", { fg = c.purple })

-- gitsigns / git
hl(0, "GitSignsAdd", { fg = c.green })
hl(0, "GitSignsChange", { fg = c.yellow })
hl(0, "GitSignsDelete", { fg = c.red })

-- telescope
hl(0, "TelescopeNormal", { fg = fg, bg = c.gray })
hl(0, "TelescopeBorder", { fg = c.gray, bg = c.gray })
hl(0, "TelescopeSelection", { bg = c.faint_gray })
hl(0, "TelescopePromptNormal", { fg = fg, bg = c.gray })
hl(0, "TelescopeMatching", { fg = c.blue, bold = true })
