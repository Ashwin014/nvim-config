local rainbow_delimiters = require("rainbow-delimiters")

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
	},
	highlight = {
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		-- "RainbowDelimiterCyan",
		-- "RainbowDelimiterPurple",
		"RainbowDelimiterRed",
		-- "RainbowDelimiterOrange",
		-- "RainbowDelimiterGreen",
	},
	blacklist = { "markdown", "text" },
}

-- map to vscode colorscheme
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#FFD700" }) -- gold
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#DA70D6" }) -- orchid
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#179fff" }) -- blue
-- vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#FA8072" }) -- salmon
-- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#7CFC00" }) -- lawn green
-- vim.api.nvim_set_hl(0, "RainbowDelimiterPurple", { fg = "#FF8C00" }) -- dark orange
-- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#DA70D6" }) -- rainbow-delimiters has 7 slots, VS Code's default only has 6, so this repeats orchid

-- Or mapping them directly to One Dark hex values:
-- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterPurple", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#e06c75" })
