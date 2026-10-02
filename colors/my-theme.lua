-- Save as: <config>/colors/mytheme.lua
--   Windows: %LOCALAPPDATA%\nvim\colors\mytheme.lua
-- Use with: vim.cmd.colorscheme("mytheme")
-- Reload after edits: :colorscheme mytheme
-- Inspect what's under the cursor: :Inspect
-- List every group currently defined, to check your work: :hi

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "mytheme"
vim.o.termguicolors = true
vim.o.background = "dark"

---------------------------------------------------------------------
-- 1. Palette — change these, everything below follows
---------------------------------------------------------------------
local cp = {
	base00 = "#212121",
	base01 = "#303030",
	base02 = "#424242",
	base03 = "#545454",
	base04 = "#636363",
	base05 = "#727272",
	base06 = "#878787",
}

local c = {

	-- bg = "#16181d",
	-- bg_alt = "#1e2128", -- floats, statusline, cursorline
	-- bg_sel = "#2e3440", -- selection, popup selection, visual
	-- bg_dark = "#101217", -- dashboard, dimmer panels
	-- fg = "#d4d8e0",
	-- fg_alt = "#b0a898", -- secondary text, inactive items
	-- muted = "#5c6370", -- comments, line numbers, delimiters
	-- border = "#3b3f4c",

	bg = cp.base01,
	bg_alt = cp.base00, -- floats, statusline, cursorline
	bg_sel = cp.base02, -- selection, popup selection, visual
	bg_dark = cp.base01, -- dashboard, dimmer panels
	fg = cp.base06,
	fg_alt = cp.base05, -- secondary text, inactive items
	muted = cp.base03, -- comments, line numbers, delimiters
	border = cp.base02,

	-- red = "#e06c75",
	-- orange = "#d19a66",
	-- yellow = "#e5c07b",
	-- green = "#98c379",
	-- cyan = "#56b6c2",
	-- blue = "#61afef",
	-- purple = "#c678dd",

	red = "#b85860",
	orange = "#b58559",
	yellow = "#ccab6e",
	green = "#83a868",
	cyan = "#4a9da8",
	blue = "#589dd6",
	purple = "#af6ac4",

	-- diff/git backgrounds (dark, desaturated tints)
	diff_add_bg = "#20301f",
	diff_change_bg = "#232b3a",
	diff_delete_bg = "#3a2226",
	diff_text_bg = "#33415c",
}

---------------------------------------------------------------------
-- 2. Highlight groups
---------------------------------------------------------------------
local hl = {}

-- Editor UI ----------------------------------------------------------
hl.Normal = { fg = c.fg, bg = c.bg }
hl.NormalNC = { fg = c.fg, bg = c.bg } -- inactive windows; set bg="none" to dim them
hl.NormalFloat = { fg = c.fg, bg = c.bg }
hl.FloatBorder = { fg = c.border, bg = c.bg }
hl.FloatTitle = { fg = c.blue, bg = c.bg_alt, bold = true }
hl.CursorLine = { bg = c.bg_alt }
hl.CursorLineNr = { fg = c.yellow, bold = true }
hl.CursorColumn = { bg = c.bg_alt }
hl.LineNr = { fg = c.muted }
hl.SignColumn = { bg = c.bg }
hl.ColorColumn = { bg = c.bg_alt }
hl.Visual = { bg = c.bg_sel }
hl.VisualNOS = { bg = c.bg_sel }
hl.Search = { fg = c.bg, bg = c.yellow }
hl.IncSearch = { fg = c.bg, bg = c.orange }
hl.CurSearch = { fg = c.bg, bg = c.orange }
hl.MatchParen = { fg = c.orange, bold = true }
hl.Pmenu = { fg = c.fg, bg = c.bg }
hl.PmenuSel = { bg = c.bg_sel }
hl.PmenuSbar = { bg = c.bg_alt }
hl.PmenuThumb = { bg = c.border }
hl.StatusLine = { fg = c.fg, bg = c.bg_alt }
hl.StatusLineNC = { fg = c.muted, bg = c.bg_alt }
hl.WinSeparator = { fg = c.bg_sel }
hl.WinBar = { fg = c.fg_alt, bg = c.bg }
hl.WinBarNC = { fg = c.muted, bg = c.bg }
hl.TabLine = { fg = c.muted, bg = c.bg_alt }
hl.TabLineSel = { fg = c.fg, bg = c.bg_sel, bold = true }
hl.TabLineFill = { bg = c.bg }
hl.Folded = { fg = c.muted, bg = c.bg_alt }
hl.FoldColumn = { fg = c.muted, bg = c.bg }
hl.NonText = { fg = c.bg_sel }
hl.Whitespace = { fg = c.bg_sel }
hl.SpecialKey = { fg = c.muted }
hl.EndOfBuffer = { fg = c.bg }
hl.Directory = { fg = c.blue }
hl.Title = { fg = c.blue, bold = true }
hl.ModeMsg = { fg = c.fg_alt }
hl.MoreMsg = { fg = c.green }
hl.Question = { fg = c.green }
hl.ErrorMsg = { fg = c.red }
hl.WarningMsg = { fg = c.yellow }
hl.MsgArea = { fg = c.fg, bg = c.bg }
hl.MsgSeparator = { fg = c.muted, bg = c.bg }
hl.WildMenu = { fg = c.bg, bg = c.blue }
hl.Conceal = { fg = c.muted }
hl.Cursor = { fg = c.bg, bg = c.fg }
hl.TermCursor = { fg = c.bg, bg = c.fg }
hl.QuickFixLine = { bg = c.bg_sel }
hl.SpellBad = { undercurl = true, sp = c.red }
hl.SpellCap = { undercurl = true, sp = c.yellow }
hl.SpellRare = { undercurl = true, sp = c.purple }
hl.SpellLocal = { undercurl = true, sp = c.cyan }

-- Syntax (classic groups; treesitter falls back to these) -----------
hl.Comment = { fg = c.muted, italic = true }
hl.Constant = { fg = c.orange }
hl.String = { fg = c.green }
hl.Character = { fg = c.green }
hl.Number = { fg = c.orange }
hl.Boolean = { fg = c.orange }
hl.Float = { fg = c.orange }
hl.Identifier = { fg = c.fg }
hl.Function = { fg = c.blue }
hl.Statement = { fg = c.purple }
hl.Conditional = { fg = c.purple }
hl.Repeat = { fg = c.purple }
hl.Label = { fg = c.purple }
hl.Keyword = { fg = c.purple }
hl.Exception = { fg = c.purple }
hl.Operator = { fg = c.cyan }
hl.PreProc = { fg = c.cyan }
hl.Include = { fg = c.cyan }
hl.Define = { fg = c.cyan }
hl.Macro = { fg = c.cyan }
hl.Type = { fg = c.yellow }
hl.StorageClass = { fg = c.yellow }
hl.Structure = { fg = c.yellow }
hl.Typedef = { fg = c.yellow }
hl.Special = { fg = c.cyan }
hl.SpecialChar = { fg = c.cyan }
hl.Tag = { fg = c.red }
hl.Delimiter = { fg = c.muted }
hl.Underlined = { underline = true }
hl.Bold = { bold = true }
hl.Italic = { italic = true }
hl.Error = { fg = c.red }
hl.Todo = { fg = c.bg, bg = c.yellow, bold = true }

-- Treesitter overrides (only where you want to differ from classic) -
hl["@variable"] = { fg = c.fg }
hl["@variable.builtin"] = { fg = c.red }
hl["@variable.parameter"] = { fg = c.fg }
hl["@variable.member"] = { fg = c.red }
hl["@property"] = { fg = c.red }
hl["@field"] = { fg = c.red }
hl["@constructor"] = { fg = c.yellow }
hl["@tag"] = { fg = c.red }
hl["@tag.attribute"] = { fg = c.orange }
hl["@tag.delimiter"] = { fg = c.muted }
hl["@punctuation.bracket"] = { fg = c.yellow }
hl["@punctuation.delimiter"] = { fg = c.muted }
hl["@punctuation.special"] = { fg = c.cyan }
hl["@comment"] = { fg = c.muted, italic = true }
hl["@markup.heading"] = { fg = c.blue, bold = true }
hl["@markup.bold"] = { bold = true }
hl["@markup.italic"] = { italic = true }
hl["@markup.strikethrough"] = { strikethrough = true }
hl["@markup.link.url"] = { fg = c.cyan, underline = true }
hl["@markup.link.label"] = { fg = c.blue }
hl["@markup.list"] = { fg = c.muted }
hl["@markup.raw"] = { fg = c.green } -- inline/fenced code
hl["@markup.quote.markdown"] = { fg = c.fg }
hl["@lsp.type.class.markdown"] = { fg = c.purple }
hl["@lsp.type.enumMember.markdown"] = { fg = c.purple }
hl["@string.escape"] = { fg = c.cyan }
hl["@string.regexp"] = { fg = c.cyan }
hl["@keyword.function"] = { fg = c.purple }
hl["@keyword.return"] = { fg = c.purple }
hl["@keyword.operator"] = { fg = c.cyan }
hl["@keyword.directive.markdown"] = { fg = c.muted }

-- turn semantic tokens off instead, in init.lua, if colors keep "flipping":
--   vim.lsp.semantic_tokens.enable(false)
-- or silence specific ones here instead, e.g.:
-- hl["@lsp.type.variable"] = {}

-- Diagnostics (LSP) --------------------------------------------------
hl.DiagnosticError = { fg = c.red }
hl.DiagnosticWarn = { fg = c.yellow }
hl.DiagnosticInfo = { fg = c.blue }
hl.DiagnosticHint = { fg = c.cyan }
hl.DiagnosticOk = { fg = c.green }
hl.DiagnosticUnderlineError = { undercurl = true, sp = c.red }
hl.DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow }
hl.DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue }
hl.DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan }
hl.DiagnosticVirtualTextError = { fg = c.red, bg = c.diff_delete_bg }
hl.DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.diff_change_bg }
hl.DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.diff_change_bg }
hl.DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.diff_change_bg }
hl.DiagnosticFloatingError = { fg = c.red }
hl.DiagnosticFloatingWarn = { fg = c.yellow }
hl.DiagnosticSignError = { fg = c.red }
hl.DiagnosticSignWarn = { fg = c.yellow }
hl.DiagnosticSignInfo = { fg = c.blue }
hl.DiagnosticSignHint = { fg = c.cyan }
hl.LspReferenceText = { bg = c.bg_sel }
hl.LspReferenceRead = { bg = c.bg_sel }
hl.LspReferenceWrite = { bg = c.bg_sel, underline = true }
hl.LspSignatureActiveParameter = { fg = c.orange, bold = true }
hl.LspInlayHint = { fg = c.muted, italic = true }

-- Diff / Git -----------------------------------------------------------
hl.DiffAdd = { bg = c.diff_add_bg }
hl.DiffChange = { bg = c.diff_change_bg }
hl.DiffDelete = { bg = c.diff_delete_bg }
hl.DiffText = { bg = c.diff_text_bg }
hl.GitSignsAdd = { fg = c.green }
hl.GitSignsChange = { fg = c.yellow }
hl.GitSignsDelete = { fg = c.red }
hl.GitSignsAddLn = { bg = c.diff_add_bg }
hl.GitSignsChangeLn = { bg = c.diff_change_bg }
hl.GitSignsDeleteLn = { bg = c.diff_delete_bg }
hl.GitSignsCurrentLineBlame = { fg = c.muted }

-- Telescope ------------------------------------------------------------
hl.TelescopeNormal = { fg = c.fg, bg = c.bg }
hl.TelescopeBorder = { fg = c.border, bg = c.bg }
hl.TelescopePromptNormal = { fg = c.fg, bg = c.bg }
hl.TelescopePromptBorder = { fg = c.border, bg = c.bg }
hl.TelescopePromptPrefix = { fg = c.orange }
hl.TelescopePromptTitle = { fg = c.fg, bg = c.bg, bold = true }
hl.TelescopeResultsNormal = { fg = c.fg, bg = c.bg }
hl.TelescopeResultsBorder = { fg = c.border, bg = c.bg }
hl.TelescopeResultsTitle = { fg = c.fg, bg = c.bg, bold = true }
hl.TelescopePreviewNormal = { fg = c.fg, bg = c.bg }
hl.TelescopePreviewBorder = { fg = c.border, bg = c.bg }
hl.TelescopePreviewTitle = { fg = c.fg, bg = c.bg, bold = true }
hl.TelescopeSelection = { bg = c.bg_sel }
hl.TelescopeSelectionCaret = { fg = c.orange, bg = c.bg_sel }
hl.TelescopeMatching = { fg = c.yellow, bold = true }

-- which-key --------------------------------------------------------
hl.WhichKey = { fg = c.blue }
hl.WhichKeyGroup = { fg = c.cyan }
hl.WhichKeyDesc = { fg = c.fg }
hl.WhichKeySeparator = { fg = c.muted }
hl.WhichKeyFloat = { bg = c.bg }
hl.WhichKeyBorder = { fg = c.border, bg = c.bg }
hl.WhichKeyValue = { fg = c.muted }
hl.WhichKeyTitle = { fg = c.muted }

-- Snacks (dashboard, picker, explorer, zen, notifier, indent) -------
hl.SnacksNormal = { fg = c.fg, bg = c.bg }
hl.SnacksWinBar = { fg = c.fg, bg = c.bg }
hl.SnacksDashboardHeader = { fg = c.blue }
hl.SnacksDashboardDesc = { fg = c.fg }
hl.SnacksDashboardIcon = { fg = c.orange }
hl.SnacksDashboardKey = { fg = c.yellow }
hl.SnacksDashboardSpecial = { fg = c.muted }
hl.SnacksDashboardFile = { fg = c.fg_alt }
hl.SnacksDashboardDir = { fg = c.muted }
hl.SnacksPicker = { fg = c.fg, bg = c.bg }
hl.SnacksPickerBorder = { fg = c.border, bg = c.bg }
hl.SnacksPickerMatch = { fg = c.yellow, bold = true }
hl.SnacksPickerDir = { fg = c.muted }
hl.SnacksIndent = { fg = c.bg_sel }
hl.SnacksIndentScope = { fg = c.blue }
hl.SnacksNotifierInfo = { fg = c.blue }
hl.SnacksNotifierWarn = { fg = c.yellow }
hl.SnacksNotifierError = { fg = c.red }

-- Noice --------------------------------------------------------------
hl.NoiceCmdlinePopup = { fg = c.fg, bg = c.bg }
hl.NoiceCmdlinePopupBorder = { fg = c.border, bg = c.bg }
hl.NoiceCmdlineIcon = { fg = c.blue }
hl.NoicePopupmenuSelected = { bg = c.bg_sel }
hl.NoiceMini = { fg = c.fg, bg = c.bg_alt }

-- Oil ------------------------------------------------------------------
hl.OilDir = { fg = c.blue, bold = true }
hl.OilFile = { fg = c.fg }
hl.OilLink = { fg = c.cyan }
hl.OilCreate = { fg = c.green }
hl.OilDelete = { fg = c.red }
hl.OilMove = { fg = c.yellow }
hl.OilCopy = { fg = c.cyan }
hl.OilPermissionNone = { fg = c.muted }
hl.OilPermissionRead = { fg = c.yellow }
hl.OilPermissionWrite = { fg = c.red }
hl.OilPermissionExecute = { fg = c.green }

-- render-markdown ------------------------------------------------------
hl.RenderMarkdownH1 = { fg = c.red, bold = true }
hl.RenderMarkdownH2 = { fg = c.orange, bold = true }
hl.RenderMarkdownH3 = { fg = c.yellow, bold = true }
hl.RenderMarkdownH4 = { fg = c.green, bold = true }
hl.RenderMarkdownH5 = { fg = c.cyan, bold = true }
hl.RenderMarkdownH6 = { fg = c.blue, bold = true }
hl.RenderMarkdownH1Bg = { bg = c.bg }
hl.RenderMarkdownH2Bg = { bg = c.bg }
hl.RenderMarkdownH3Bg = { bg = c.bg }
hl.RenderMarkdownH4Bg = { bg = c.bg }
hl.RenderMarkdownH5Bg = { bg = c.bg }
hl.RenderMarkdownH6Bg = { bg = c.bg }
hl.RenderMarkdownCode = { bg = c.bg_alt }
hl.RenderMarkdownCodeInline = { bg = c.bg_sel, fg = c.fg }
hl.RenderMarkdownBullet = { fg = c.muted }
hl.RenderMarkdownQuote = { fg = c.muted, italic = true }
hl.RenderMarkdownDash = { fg = c.muted }
hl.RenderMarkdownLink = { fg = c.cyan, underline = true }
hl.RenderMarkdownWikiLink = { fg = c.blue }
hl.RenderMarkdownTableHead = { fg = c.blue }
hl.RenderMarkdownTableRow = { fg = c.fg }
hl.RenderMarkdownChecked = { fg = c.green }
hl.RenderMarkdownUnchecked = { fg = c.muted }
hl.RenderMarkdownTodo = { fg = c.yellow }

-- lualine (if you set theme = "mytheme" instead of "auto") ----------
-- lualine builds its own groups per mode when theme="auto"; only needed
-- if you want a dedicated lualine theme table instead. Left out here
-- since "auto" already derives from the groups above.

-- Completion (blink.cmp) ----------------------------------------------
hl.BlinkCmpMenu = { fg = c.fg, bg = c.bg }
hl.BlinkCmpMenuBorder = { fg = c.border, bg = c.bg }
hl.BlinkCmpMenuSelection = { bg = c.bg_sel }
hl.BlinkCmpDoc = { fg = c.fg, bg = c.bg }
hl.BlinkCmpDocBorder = { fg = c.border, bg = c.bg }
hl.BlinkCmpLabel = { fg = c.fg }
hl.BlinkCmpLabelMatch = { fg = c.yellow, bold = true }
hl.BlinkCmpKind = { fg = c.muted }
hl.BlinkCmpSource = { fg = c.muted, italic = true }

-- Quiz / misc UI widgets you've added ---------------------------------
hl.FidgetTitle = { fg = c.blue, bold = true }
hl.FidgetTask = { fg = c.muted }

---------------------------------------------------------------------
-- 3. Apply
---------------------------------------------------------------------
for group, spec in pairs(hl) do
	vim.api.nvim_set_hl(0, group, spec)
end
