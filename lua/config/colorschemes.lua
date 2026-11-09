-- #region system theme detection
--
-- Detect whether the OS is currently using a dark or light theme.
-- Supports Windows (registry), macOS (defaults), and Linux (gsettings).
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

--- Return "dark" or "light" based on the current system theme.
local function system_background()
	return is_dark_mode() and "dark" or "light"
end
-- #endregion

-- #region per-theme setup
--
-- Each entry receives the system background ("dark" | "light") and is
-- responsible for configuring that theme before it is loaded.  Add new
-- themes here as you adopt them; no other part of this file needs to change.
--
local theme_setup = {
	ember = function(bg)
		require("ember").setup({
			variant = "ember-auto",
			dark_variant = "ember",
			light_variant = "ember-light",
		})
	end,

	vscode = function(bg)
		require("vscode").setup({
			style = bg,
			italic_comments = false,
			transparency = true,
		})
	end,

	soviet = function(bg)
		require("soviet").setup({
			styles = {
				keywords = { bold = false },
				-- functions = {},
				-- strings = {},
				variables = { bold = false },
			},
		})
		require("soviet").load(bg)
	end,
}

-- Map a theme key to the actual `:colorscheme` name.  Most themes load by
-- their own key, but ember must load "ember-auto" so the plugin can resolve
-- dark_variant / light_variant at load time.
local colorscheme_for = {
	ember = "ember-auto",
	vscode = "vscode",
	school = "school",
}
-- #endregion

local M = {}

--- Apply a theme keyed by `name`.  Sets `vim.o.background` first (required
-- by ember-auto before it loads), runs that theme's setup, then loads the
-- colorscheme.
function M.apply(name)
	local bg = system_background()
	vim.o.background = bg

	local setup = theme_setup[name]
	if setup then
		setup(bg)
	end

	local scheme = colorscheme_for[name]
	if scheme then
		-- Only call :colorscheme for themes that have a colorscheme file.
		-- Themes like soviet self-load via require(...).load(style).
		vim.cmd.colorscheme(scheme)
	end

	M.current_theme = name
end

-- #region refresh UI plugins on colorscheme change
--
-- Keep lualine and indent-blankline in sync whenever the colorscheme changes.
--
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.schedule(function()
			pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/lualine.lua")
			pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/indent-blankline.lua")
		end)
	end,
})
-- #endregion

-- #region follow system theme while Neovim is open
--
-- When Neovim regains focus, re-check the system theme.  If it changed,
-- reload the current theme with the new light/dark variant.
--
vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		local new_bg = system_background()
		if vim.o.background ~= new_bg and M.current_theme then
			M.apply(M.current_theme)
			vim.schedule(function()
				pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/lualine.lua")
				pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/indent-blankline.lua")
			end)
		end
	end,
})
-- #endregion

-- Activate ember at startup.
-- M.apply("ember")
-- M.apply("vscode")
M.apply("soviet")

-- NEEDS LIGHT THEMES, CURRENTLY JUST DARK
-- M.apply("school")
-- M.apply("onedark-zed")

require("config.transparency")
