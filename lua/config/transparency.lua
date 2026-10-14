-- Transparency overrides, applied on top of whatever colorscheme is active.
--
-- Lives on its own so switching themes never means commenting/uncommenting
-- anything: this file doesn't care which colorscheme is loaded, it just
-- clears backgrounds after every `:colorscheme` call, including the one
-- that already ran before this file loads at startup.
--
-- To add a new group: add one line to the `groups` list below. No need
-- to touch the autocmd or anything else.

local function apply()
	local groups = {
		-- Core editor
		"Normal",
		"NormalNC",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"WinSeparator",
		"WinBar",
		"WinBarNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"MsgArea",
		"Folded",
		"FoldColumn",

		-- Telescope
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptNormal",
		"TelescopePromptBorder",
		"TelescopeResultsNormal",
		"TelescopeResultsBorder",
		"TelescopePreviewNormal",
		"TelescopePreviewBorder",

		-- which-key
		"WhichKeyFloat",
		"WhichKeyBorder",
		"WhichKeyNormal",

		-- Noice
		"NoiceCmdlinePopup",
		"NoiceCmdlinePopupBorder",
		"NoiceMini",

		-- Snacks
		"SnacksNormal",
		"SnacksWinBar",
		"SnacksPicker",
		"SnacksPickerBorder",

		-- blink.cmp
		"BlinkCmpMenu",
		"BlinkCmpMenuBorder",
		"BlinkCmpDoc",
		"BlinkCmpDocBorder",
	}

	for _, group in ipairs(groups) do
		-- keep whatever fg/style the active theme already set; only clear bg
		local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
		if ok then
			current.bg = "none"
			vim.api.nvim_set_hl(0, group, current)
		end
	end
end

-- reapply every time the colorscheme changes (manual :colorscheme calls,
-- or a plugin switching the theme at startup)
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = apply,
})

-- apply once immediately, for the theme already active when this file loads
apply()
