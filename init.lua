vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.general")
require("core.keymaps")


-- Plugin manager (lazy.nvim) bootstraps itself and lazy-loads plugin configs
require("config.plugins")

