-- vim.cmd.colorscheme("ember")

-- vim.cmd.colorscheme("mytheme")

-- vim.lsp.semantic_tokens.enable(false)

require("vscode").setup({
	style = "dark", -- or "light"
	italic_comments = true,
})
-- vim.cmd.colorscheme("vscode")

-- vim.cmd.colorscheme("synth")

require("onedark").setup({ style = "warm" })
-- vim.cmd.colorscheme("onedark")

require("gruvbox").setup()
-- vim.cmd.colorscheme("gruvbox")

require("soviet").setup({}) -- Optional; add your settings here.
-- vim.cmd.colorscheme("soviet-dark")
-- vim.cmd.colorscheme("soviet-light")

vim.cmd.colorscheme("onedark-zed")

-- =================================================================================
-- Change background colors to none
-- =================================================================================

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none" })

vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
