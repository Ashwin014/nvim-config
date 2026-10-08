-- vim.cmd.colorscheme("ember")

-- vim.cmd.colorscheme("school")

-- vim.lsp.semantic_tokens.enable(false)

require("vscode").setup({
	style = "dark", -- or "light"
	italic_comments = true,
	transparency = true,
})
vim.cmd.colorscheme("vscode")

-- vim.cmd.colorscheme("synth")

require("onedark").setup({ style = "warm" })
-- vim.cmd.colorscheme("onedark")

require("gruvbox").setup()
-- vim.cmd.colorscheme("gruvbox")

require("soviet").setup({}) -- Optional; add your settings here.
-- vim.cmd.colorscheme("soviet-dark")
-- vim.cmd.colorscheme("soviet-light")

-- vim.cmd.colorscheme("onedark-zed")

-- vim.cmd.colorscheme("retrobox")

-- =================================================================================
-- Change background colors to none
-- =================================================================================

local set_hl = vim.api.nvim_set_hl
local base = {
	gray = "#2f343e",
	light_gray = "#5d636f",
	faint_gray = "#3b4048",
	ember_border = "#3e3c38",

	default = "#424242",

	-- vscGray = "#808080",
	-- vscLineNr = "#5a5a5a",
	-- vscSplitDark = "#444444",
}
-- local onedark_zed = {
-- 	fg = "#878787",
-- 	gray = "#2f343e",
-- 	light_gray = "#5d636f",
-- 	faint_gray = "#3b4048",
--
-- 	red = "#b85860",
-- 	orange = "#b58559",
-- 	yellow = "#ccab6e",
-- 	green = "#83a868",
-- 	cyan = "#4a9da8",
-- 	blue = "#589dd6",
-- 	purple = "#af6ac4",
-- }
--

local vsc = require("vscode.colors").get_colors()

set_hl(0, "Normal", { bg = "none" })
set_hl(0, "NormalNC", { bg = "none" })
set_hl(0, "NormalFloat", { bg = "none" })
-- -- set_hl(0, "FloatBorder", { fg = onedark_zed.light_gray, bg = "none" })
-- set_hl(0, "FloatBorder", { fg = base.ember_border, bg = "none" })
set_hl(0, "FloatBorder", { fg = vsc.vscSplitDark, bg = "none" })
-- -- set_hl(0, "FloatTitle", { fg = onedark_zed.blue, bg = "none" })
-- set_hl(0, "FloatTitle", { fg = base.ember_border, bg = "none" })
set_hl(0, "FloatTitle", { bg = "none" })
set_hl(0, "SignColumn", { bg = "none" })
set_hl(0, "StatusLine", { bg = "none" })
set_hl(0, "CursorColumn", { bg = "none" })
set_hl(0, "StatusLineNC", { bg = "none" })
set_hl(0, "LineNr", { fg = vsc.vscLineNumber, bg = "none" })
set_hl(0, "MsgArea", { bg = "none" })
set_hl(0, "WinSeparator", { link = "VertSplit" })
set_hl(0, "TabLineFill", { bg = "none" })
set_hl(0, "TabLine", { bg = "none" })
set_hl(0, "TabLineSel", { bg = "none", bold = true })
set_hl(0, "VertSplit", { fg = vsc.vscSplitDark, bg = "none" })
set_hl(0, "Pmenu", { bg = "none" })

-- -- Telescope
-- set_hl(0, "TelescopeNormal", { bg = "none" })
-- set_hl(0, "TelescopeBorder", { fg = onedark_zed.light_gray, bg = "none" })
-- set_hl(0, "TelescopeBorder", { fg = base.ember_border, bg = "none", blend = 50 })
-- set_hl(0, "TelescopePromptTitle", { bg = "none" })
-- set_hl(0, "TelescopePromptNormal", { bg = "none" })
-- set_hl(0, "TelescopePromptBorder", { bg = "none" })
-- set_hl(0, "TelescopeResultsNormal", { bg = "none" })
-- set_hl(0, "TelescopeResultsBorder", { bg = "none" })
-- set_hl(0, "TelescopePreviewNormal", { bg = "none" })
-- set_hl(0, "TelescopePreviewBorder", { bg = "none" })
-- set_hl(0, "TelescopeSelection", { bg = "none" })
--
-- -- which-key
-- set_hl(0, "WhichKeyBorder", { fg = onedark_zed.light_gray, bg = "none" })
-- set_hl(0, "WhichKeyBorder", { fg = base.ember_border, bg = "none" })
-- set_hl(0, "WhichKeyNormal", { bg = "none" })
--
-- -- Snacks
-- set_hl(0, "SnacksNormal", { fg = "none", bg = "none" })
-- set_hl(0, "SnacksPicker", { bg = "none" })
-- set_hl(0, "SnacksPickerBorder", { fg = onedark_zed.light_gray, bg = "none" })
--
-- -- Blink
-- set_hl(0, "BlinkCmpMenu", { link = "Pmenu" })
-- set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
-- set_hl(0, "BlinkCmpDoc", { link = "NormalFloat" })
-- set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
--
-- -- Diagnostics (LSP)
-- set_hl(0, "DiagnosticVirtualTextError", { fg = onedark_zed.red, bg = "none" })
-- set_hl(0, "DiagnosticVirtualTextWarn", { fg = onedark_zed.yellow, bg = "none" })
-- set_hl(0, "DiagnosticVirtualTextInfo", { fg = onedark_zed.blue, bg = "none" })
-- set_hl(0, "DiagnosticVirtualTextHint", { fg = onedark_zed.cyan, bg = "none" })
-- set_hl(0, "LspInlayHint", { fg = onedark_zed.light_gray, bg = "none", italic = true })
--
-- -- Harpoon
-- set_hl(0, "HarpoonNormal", { bg = "none" })
-- set_hl(0, "HarpoonBorderX", { fg = onedark_zed.light_gray, bg = "none" })
-- set_hl(0, "HarpoonTitleX", { fg = onedark_zed.light_gray, bg = "none" })
