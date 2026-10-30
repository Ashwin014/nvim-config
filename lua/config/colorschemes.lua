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

-- require("onedark").setup({ style = "warm" })
-- vim.cmd.colorscheme("onedark")

-- require("gruvbox").setup()
-- vim.cmd.colorscheme("gruvbox")

-- require("soviet").setup({}) -- Optional; add your settings here.
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
