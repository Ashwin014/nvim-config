-- Save as: <config>/lua/lush_theme/mytheme.lua
--   Windows: %LOCALAPPDATA%\nvim\lua\lush_theme\mytheme.lua
--   (lush requires this exact lua/lush_theme/<name>.lua path)
-- Use with: vim.cmd.colorscheme("mytheme")
-- Live-edit: open this file and run :Lushify, then save to see changes instantly

local lush = require("lush")
local hsl = lush.hsl

-- 1. Palette — same colors as your plain mytheme.lua, as HSL so you can
--    derive shades with .lighten()/.darken() instead of picking new hex values
local bg = hsl(225, 12, 11) -- #16181d
local bg_alt = hsl(222, 12, 15) -- #1e2128
local bg_sel = hsl(222, 12, 21) -- #2e3440
local fg = hsl(222, 16, 83) -- #d4d8e0
local muted = hsl(220, 7, 39) -- #5c6370

local red = hsl(355, 68, 71) -- #e06c75
local orange = hsl(29, 54, 60) -- #d19a66
local yellow = hsl(39, 68, 71) -- #e5c07b
local green = hsl(95, 38, 62) -- #98c379
local cyan = hsl(187, 47, 55) -- #56b6c2
local blue = hsl(207, 82, 66) -- #61afef
local purple = hsl(286, 52, 68) -- #c678dd

-- 2. Theme: same groups as your plain mytheme.lua, written with lush's
--   `GroupName { ... }` syntax; `sym(...)` is needed for groups whose
--   name has characters Lua identifiers can't have, like "@variable"
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return lush.extends({}).with(function()
		return {
			-- Editor UI
			Normal({ bg = bg, fg = fg }),
			NormalFloat({ bg = bg_alt, fg = fg }),
			FloatBorder({ bg = bg_alt, fg = muted }),
			CursorLine({ bg = bg_alt }),
			CursorLineNr({ fg = yellow, gui = "bold" }),
			LineNr({ fg = muted }),
			SignColumn({ bg = bg }),
			Visual({ bg = bg_sel }),
			Search({ bg = yellow, fg = bg }),
			IncSearch({ bg = orange, fg = bg }),
			MatchParen({ fg = orange, gui = "bold" }),
			Pmenu({ bg = bg_alt, fg = fg }),
			PmenuSel({ bg = bg_sel }),
			StatusLine({ bg = bg_alt, fg = fg }),
			StatusLineNC({ bg = bg_alt, fg = muted }),
			WinSeparator({ fg = bg_sel }),
			Folded({ bg = bg_alt, fg = muted }),
			NonText({ fg = bg_sel }),
			EndOfBuffer({ fg = bg }),
			Directory({ fg = blue }),
			Title({ fg = blue, gui = "bold" }),
			ErrorMsg({ fg = red }),
			WarningMsg({ fg = yellow }),

			-- Syntax
			Comment({ fg = muted, gui = "italic" }),
			Constant({ fg = orange }),
			String({ fg = green }),
			Number({ fg = orange }),
			Boolean({ fg = orange }),
			Identifier({ fg = fg }),
			Function({ fg = blue }),
			Statement({ fg = purple }),
			Keyword({ fg = purple }),
			Operator({ fg = cyan }),
			Type({ fg = yellow }),
			PreProc({ fg = cyan }),
			Special({ fg = cyan }),

			-- Treesitter overrides
			sym("@variable")({ fg = fg }),
			sym("@variable.builtin")({ fg = red }),
			sym("@variable.parameter")({ Identifier }), -- same as plain Identifier
			sym("@variable.member")({ fg = red }),
			sym("@property")({ fg = red }),
			sym("@tag")({ fg = red }),
			sym("@punctuation.bracket")({ fg = yellow }),
			sym("@punctuation.delimiter")({ fg = muted }),
			sym("@punctuation.special")({ fg = cyan }),
			sym("@tag.delimiter")({ fg = muted }),
			sym("@markup.heading")({ fg = blue, gui = "bold" }),
			sym("@markup.link.url")({ fg = cyan, gui = "underline" }),

			-- turn semantic tokens off the lush way, instead of
			-- vim.lsp.semantic_tokens.enable(false) in init.lua:
			-- sym("@lsp.type.variable") { Normal },

			-- Diagnostics
			DiagnosticError({ fg = red }),
			DiagnosticWarn({ fg = yellow }),
			DiagnosticInfo({ fg = blue }),
			DiagnosticHint({ fg = cyan }),
			DiagnosticUnderlineError({ gui = "undercurl", sp = red }),
			DiagnosticUnderlineWarn({ gui = "undercurl", sp = yellow }),
			DiagnosticUnderlineInfo({ gui = "undercurl", sp = blue }),
			DiagnosticUnderlineHint({ gui = "undercurl", sp = cyan }),

			-- Diff / git
			DiffAdd({ bg = green.darken(70) }),
			DiffChange({ bg = blue.darken(75) }),
			DiffDelete({ bg = red.darken(70) }),
			DiffText({ bg = blue.darken(60) }),
			GitSignsAdd({ fg = green }),
			GitSignsChange({ fg = yellow }),
			GitSignsDelete({ fg = red }),
		}
	end)
end)

return theme
