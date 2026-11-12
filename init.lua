vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make space do nothing in normal mode so it doesn’t move the cursor
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

require("core.options")
require("core.general")
require("core.keymaps")

-- Plugin manager (lazy.nvim) bootstraps itself and lazy-loads plugin configs
require("config.plugins")
