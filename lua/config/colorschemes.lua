-- vim.cmd.colorscheme("ember")

-- vim.cmd.colorscheme("school")

-- vim.lsp.semantic_tokens.enable(false)

--

local function is_dark_mode()
	if vim.fn.has("win32") == 1 then
		local handle = io.popen(
			'reg query "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" /v AppsUseLightTheme 2>nul'
		)
		if handle then
			local result = handle:read("*a") or ""
			handle:close()
			if result:match("0x0") then
				return true
			end
			if result:match("0x1") then
				return false
			end
		end
	elseif vim.fn.has("mac") == 1 then
		local r = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
		return (r or ""):match("Dark") ~= nil
	else
		local r = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
		return (r or ""):match("dark") ~= nil
	end
	return false
end

require("vscode").setup({
	style = is_dark_mode() and "dark" or "light",
	italic_comments = false,
	transparency = true,
})
vim.cmd.colorscheme("vscode")

-- Refresh lualine whenever the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.schedule(function()
			pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/lualine.lua")
			pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/indent-blankline.lua")
		end)
	end,
})

-- Optional: follow system theme changes while Neovim is open
vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		local new_style = is_dark_mode() and "dark" or "light"
		if vim.o.background ~= new_style then
			require("vscode").setup({ style = new_style, italic_comments = false, transparency = true })
			vim.cmd.colorscheme("vscode")
			vim.schedule(function()
				pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/lualine.lua")
				pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/indent-blankline.lua")
			end)
		end
	end,
})

--

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

-- require("everforest").setup({
-- 	background = "medium",
-- 	ui_contrast = "low",
-- })
-- vim.o.background = "light"
-- vim.cmd.colorscheme("everforest")

require("config.transparency")

-- =================================================================================
-- Change background colors to none
-- =================================================================================

-- local set_hl = vim.api.nvim_set_hl
-- local base = {
-- 	gray = "#2f343e",
-- 	light_gray = "#5d636f",
-- 	faint_gray = "#3b4048",
-- 	ember_border = "#3e3c38",
--
-- 	default = "#424242",
--
-- }

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

-- local vsc = require("vscode.colors").get_colors()
--
-- set_hl(0, "Normal", { bg = "none" })
-- set_hl(0, "NormalNC", { bg = "none" })
-- set_hl(0, "NormalFloat", { bg = "none" })
-- -- -- set_hl(0, "FloatBorder", { fg = onedark_zed.light_gray, bg = "none" })
-- -- -- set_hl(0, "FloatBorder", { fg = base.ember_border, bg = "none" })
-- set_hl(0, "FloatBorder", { fg = vsc.vscSplitDark, bg = "none" })
-- -- -- -- set_hl(0, "FloatTitle", { fg = onedark_zed.blue, bg = "none" })
-- -- -- set_hl(0, "FloatTitle", { fg = base.ember_border, bg = "none" })
-- set_hl(0, "FloatTitle", { bg = "none" })
-- set_hl(0, "SignColumn", { bg = "none" })
-- set_hl(0, "StatusLine", { bg = "none" })
-- set_hl(0, "CursorColumn", { bg = "none" })
-- set_hl(0, "StatusLineNC", { bg = "none" })
-- set_hl(0, "LineNr", { fg = vsc.vscLineNumber, bg = "none" })
-- set_hl(0, "MsgArea", { bg = "none" })
-- set_hl(0, "WinSeparator", { link = "VertSplit" })
-- set_hl(0, "TabLineFill", { bg = "none" })
-- set_hl(0, "TabLine", { bg = "none" })
-- set_hl(0, "TabLineSel", { bg = "none", bold = true })
-- set_hl(0, "VertSplit", { fg = vsc.vscSplitDark, bg = "none" })
-- set_hl(0, "Pmenu", { bg = "none" })
-- set_hl(0, "Directory", { fg = vsc.vscBlue, bg = "none" })

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
