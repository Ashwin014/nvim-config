-- Save as: <config>/colors/mytheme.lua
--   Windows: %LOCALAPPDATA%\nvim\colors\mytheme.lua
--   (check with :lua print(vim.fn.stdpath("config")))
-- Use with: vim.cmd.colorscheme("mytheme")
-- Reload after edits: :colorscheme mytheme
-- Inspect what's under the cursor: :Inspect

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "mytheme"
vim.o.termguicolors = true
vim.o.background = "dark"

-- 1. Palette: change these, everything below follows
local c = {
	bg = "#1e1e1e",
	bg_alt = "#1e1e1e", -- floats, statusline, cursorline
	bg_sel = "#2e3440", -- selection, popup selection
	fg = "#ffffff",
	muted = "#727272", -- comments, line numbers
	red = "#e06c75",
	red_light = "#cc8a90",
	orange = "#d19a66",
	yellow = "#e5c07b",
	green = "#98c379",
	green_lime = "#00ffb3",
	cyan = "#56b6c2",
	blue = "#61afef",
	gold = "#968136",
	off_gold = "#c2b070",
	purple = "#c678dd",
	-- bubblegum = "#f55c82",
	bubblegum = "#ff527d",
	bubblegum_light = "#fffafb",
	blue_purple = "#5252ff",
	blue_purple_desat = "#8c8cc5",
}

local hl = {
	-- 2. Editor UI
	Normal = { fg = c.fg, bg = c.bg },
	NormalFloat = { fg = c.fg, bg = c.bg_alt },
	FloatBorder = { fg = c.muted, bg = c.bg_alt },
	CursorLine = { bg = c.bg_alt },
	CursorLineNr = { fg = c.yellow, bold = true },
	LineNr = { fg = c.muted },
	SignColumn = { bg = c.bg },
	Visual = { bg = c.bg_sel },
	Search = { fg = c.bg, bg = c.yellow },
	IncSearch = { fg = c.bg, bg = c.orange },
	MatchParen = { fg = c.orange, bold = true },
	Pmenu = { fg = c.fg, bg = c.bg_alt },
	PmenuSel = { bg = c.bg_sel },
	StatusLine = { fg = c.fg, bg = c.bg_alt },
	StatusLineNC = { fg = c.muted, bg = c.bg_alt },
	WinSeparator = { fg = c.bg_sel },
	Folded = { fg = c.muted, bg = c.bg_alt },
	NonText = { fg = c.bg_sel },
	EndOfBuffer = { fg = c.bg },
	Directory = { fg = c.blue },
	Title = { fg = c.blue, bold = true },
	ErrorMsg = { fg = c.red },
	WarningMsg = { fg = c.yellow },

	-- 3. Syntax (treesitter groups like @function fall back to these)
	Comment = { fg = c.muted, italic = true },
	Constant = { fg = c.red },
	String = { fg = c.yellow },
	Number = { fg = c.orange },
	Boolean = { fg = c.orange },
	Identifier = { fg = c.fg },
	Function = { fg = c.orange },
	Statement = { fg = c.purple },
	Keyword = { fg = c.blue_purple_desat },
	Operator = { fg = c.cyan },
	Type = { fg = c.green_lime },
	PreProc = { fg = c.cyan },
	Special = { fg = c.cyan },

	-- Treesitter overrides (only where you want to differ from the above)
	["@variable"] = { fg = c.bubblegum_light },
	["@variable.builtin"] = { link = "@variable" },
	["@property"] = { fg = c.red_light },
	["@tag"] = { fg = c.red },
	["@punctuation.bracket"] = { fg = c.orange }, -- () [] {}
	["@punctuation.delimiter"] = { fg = c.muted }, -- , ; : .
	["@punctuation.special"] = { fg = c.cyan }, -- ${} in strings
	["@tag.delimiter"] = { fg = c.muted }, -- < > </ /> in HTML/JSX
	["@markup.heading"] = { fg = c.blue, bold = true },
	["@markup.link.url"] = { fg = c.cyan, underline = true },

	-- 4. Diagnostics (LSP)
	DiagnosticError = { fg = c.red },
	DiagnosticWarn = { fg = c.yellow },
	DiagnosticInfo = { fg = c.blue },
	DiagnosticHint = { fg = c.cyan },
	DiagnosticUnderlineError = { undercurl = true, sp = c.red },
	DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
	DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
	DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },

	-- 5. Diff / git
	DiffAdd = { bg = "#20301f" },
	DiffChange = { bg = "#232b3a" },
	DiffDelete = { bg = "#3a2226" },
	DiffText = { bg = "#33415c" },
	GitSignsAdd = { fg = c.green },
	GitSignsChange = { fg = c.yellow },
	GitSignsDelete = { fg = c.red },
}

for group, spec in pairs(hl) do
	vim.api.nvim_set_hl(0, group, spec)
end
