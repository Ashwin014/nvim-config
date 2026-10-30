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
		"FloatTitle",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"LineNr",
		"CursorColumn",
		"WinSeparator",
		"WinBar",
		"WinBarNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"MsgArea",
		"Folded",
		"FoldColumn",
		"VertSplit",
		"Pmenu",
		"Directory",

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

		-- Harpoon
		"HarpoonNormal",
		"HarpoonBorderX",
		"HarpoonTitleX",

		-- nvim-tree
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"NvimTreeWinSeparator",
		"NvimTreeEndOfBuffer",
		"NvimTreeStatusLine",
		"NvimTreeStatusLineNC",
		"NvimTreeCursorLine",

		-- Bufferline
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineBuffer",
		"BufferLineBufferSelected",
		"BufferLineBufferVisible",
		"BufferLineTab",
		"BufferLineTabSelected",
		"BufferLineTabClose",
		"BufferLineCloseButton",
		"BufferLineCloseButtonSelected",
		"BufferLineCloseButtonVisible",
		"BufferLineSeparator",
		"BufferLineSeparatorSelected",
		"BufferLineSeparatorVisible",
		"BufferLineOffsetSeparator",
	}

	for _, group in ipairs(groups) do
		-- keep whatever fg/style the active theme already set; only clear bg
		local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
		if ok then
			-- `bg = "none"` is valid at runtime (see :help nvim_set_hl()), but
			-- lua_ls's stubs type `bg` as integer-only, so it flags this as a
			-- mismatch. Scoped disable instead of a blanket one, so a real
			-- type error elsewhere in this block still gets caught.
			---@diagnostic disable-next-line: assign-type-mismatch
			current.bg = "none"
			-- `current` is typed as nvim_get_hl's OUTPUT shape
			-- (vim.api.keyset.get_hl_info), not the INPUT shape nvim_set_hl
			-- expects (vim.api.keyset.highlight). They overlap in practice,
			-- but lua_ls treats them as distinct types, hence this second,
			-- separate disable.
			---@diagnostic disable-next-line: param-type-mismatch
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
