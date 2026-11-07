vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("general")
require("keymaps")

-- Plugin manager (lazy.nvim) bootstraps itself and lazy-loads plugin configs
require("config.plugins")

