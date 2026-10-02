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

-- vim.cmd.colorscheme("onedark-zed")
vim.cmd.colorscheme("xray")

-- vim.cmd.colorscheme("retrobox")

-- =================================================================================
-- Change background colors to none
-- =================================================================================

-- local set_hl = vim.api.nvim_set_hl
--
-- set_hl(0, "Normal", { bg = "none" })
-- set_hl(0, "NormalFloat", { bg = "none" })
-- set_hl(0, "NormalNC", { bg = "none" })
-- set_hl(0, "SignColumn", { bg = "none" })
-- set_hl(0, "StatusLine", { bg = "none" })
-- set_hl(0, "StatusLineNC", { bg = "none" })
-- set_hl(0, "MsgArea", { bg = "none" })
--
-- set_hl(0, "WinSeparator", { bg = "none" })
--
-- set_hl(0, "TabLineFill", { bg = "none" })
-- set_hl(0, "TabLine", { bg = "none" })
-- set_hl(0, "TabLineSel", { bg = "none", bold = true })
--
-- set_hl(0, "TelescopeNormal", { bg = "none" })
-- set_hl(0, "TelescopeBorder", { bg = "none" })
-- set_hl(0, "TelescopePromptNormal", { bg = "none" })
-- set_hl(0, "TelescopePromptBorder", { bg = "none" })
-- set_hl(0, "TelescopeResultsNormal", { bg = "none" })
-- set_hl(0, "TelescopeResultsBorder", { bg = "none" })
-- set_hl(0, "TelescopePreviewNormal", { bg = "none" })
-- set_hl(0, "TelescopePreviewBorder", { bg = "none" })
-- set_hl(0, "TelescopeSelection", { bg = "none" })
--
-- -- which-key
-- set_hl(0, "WhichKeyBorder", { bg = "none" })
-- set_hl(0, "WhichKeyNormal", { bg = "none" })
