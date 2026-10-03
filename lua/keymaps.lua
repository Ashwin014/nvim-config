local m = require("map")

vim.g.mapleader = " "

-- ================================================================================================
-- WINDOW
-- ================================================================================================

-- Window navigation
m.nmap("<C-h>", "<C-w>h")
m.nmap("<C-l>", "<C-w>l")
m.nmap("<C-j>", "<C-w>j")
m.nmap("<C-k>", "<C-w>k")

-- Window resize
m.nmap("<C-Up>", "<cmd>resize +5<cr>", { desc = "Resize up" })
m.nmap("<C-Down>", "<cmd>resize -5<cr>", { desc = "Resize down" })
m.nmap("<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
m.nmap("<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })

-- Window splits
m.nmap("<leader>|", "<C-w>v", { desc = "Split vertically" })
m.nmap("<leader>\\", "<C-w>s", { desc = "Split horizontally" })

--

-- Buffer keymaps
m.nmap("<Tab>", ":bn<CR>", { desc = "Go to next buffer" })
m.nmap("<S-Tab>", ":bp<CR>", { desc = "Go to prev buffer" })

m.nmap("<leader>bn", ":bn<CR>", { desc = "Go to next buffer" })
m.nmap("<leader>bp", ":bp<CR>", { desc = "Go to prev buffer" })
m.nmap("<leader>bd", ":bd<CR>", { desc = "Delete buffer" })

--

-- Tabs keymaps
m.nmap("<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
m.nmap("<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
m.nmap("<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
m.nmap("<leader>tl", "<cmd>tabnext<cr>", { desc = "Next tab" })
m.nmap("<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev tab" })
m.nmap("<leader>ti", "<cmd>tabs<cr>", { desc = "List tabs" }) -- was inlay hints toggle

-- ================================================================================================
-- EDITOR
-- ================================================================================================
-- clear search highlight
m.nmap("<Esc>", "<cmd>nohlsearch<CR>")

-- move selected lines down/up
m.vmap("J", ":m '>+1<CR>gv=gv")
m.vmap("K", ":m '<-2<CR>gv=gv")
-- keep selection when indenting
m.vmap("<", "<gv")
m.vmap(">", ">gv")

-- keep cursor centered on scroll
m.nmap("<C-d>", "<C-d>zz")
m.nmap("<C-u>", "<C-u>zz")
-- same for search jumps
m.nmap("n", "nzzzv")
m.nmap("N", "Nzzzv")

m.xmap("<leader>p", '"_dP', { desc = "paste over selection without losing your yank" })
-- keep last yanked when pasting
m.vmap("p", '"_dP', { noremap = true, silent = true })

m.nmap("<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
m.vmap("<leader>/", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- TEXT
m.imap("<C-BS>", "<C-w>", { desc = "Delete word back" })

-- Convert current selection or run a specific transformation sequence
-- Example: map <leader>lc to your lowercase/uppercase toggle sequence
-- map("v", "<leader>lc", "Uv$~", { desc = "Toggle to lowercased" })

-- select all
m.nmap("<leader>a", "gg<S-v>G", { desc = "Select all text" })

-- Insert-Mode: paste
m.imap("<C-v>", "<Esc>pi", { desc = "Paste in insert mode" })

-- Insert-Mode: delete line
m.imap("<C-d>", "<Esc>ddi", { desc = "Delete line" })

-- delete single character without copying into register/clipboard
m.nmap("x", '"_x', { noremap = true, silent = true })

-- LINES

-- Move line(s) up/down — Alt+Up/Down and Alt+j/k
m.nmap("<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
m.nmap("<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
m.nmap("<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
m.nmap("<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

m.imap("<A-Down>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
m.imap("<A-Up>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
m.imap("<A-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
m.imap("<A-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })

-- This solution flickers the cmdline
m.vmap("<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
m.vmap("<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
m.vmap("<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
m.vmap("<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Duplicate a line and comment out the first line
m.nmap("yc", "yygccp", { remap = true })

--
-- sourced from https://www.reddit.com/r/neovim/comments/1gryk36/what_are_some_of_your_favorite_small_custom/
m.nmap("<left>", "zh")
m.nmap("<down>", "<c-e>")
m.nmap("<up>", "<c-y>")
m.nmap("<right>", "zl")

m.nmap("<S-left>", "zH")
m.nmap("<S-right>", "zL")

-- ================================================================================================
-- UTILS
-- ================================================================================================
-- map undo "U"
m.nmap("U", "<C-r>")

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
m.nmap("<leader>E", function()
	vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open current file externally" })

-- quickly jump to init.lua & wezterm.lua
m.nmap("<leader>vv", "<cmd>edit $MYVIMRC<cr>", { desc = "Edit init.lua" })
m.nmap("<leader>vw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>", { desc = "Edit wezterm.lua" })

m.imap("jk", "<Esc>", { desc = "Exit insert mode" })

m.nmap("<leader>cf", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Copied relative path!")
end)

-- Custom commands --------------------------------------------------------------------------------

-- 1. Edit Configuration (:EditConfig)
-- Opens your main init.lua file from anywhere in Neovim
vim.api.nvim_create_user_command("ConfigEdit", function()
	local config_file = vim.fn.stdpath("config") .. "/init.lua"
	vim.cmd("edit " .. vim.fn.fnameescape(config_file))
end, { desc = "Open Neovim init.lua configuration file" })

-- 2. Reload Configuration (:ReloadConfig)
-- Sources your init file and refreshes your runtime path
vim.api.nvim_create_user_command("ConfigReload", function()
	vim.cmd("source $MYVIMRC")
	print("Neovim configuration reloaded!")
end, { desc = "Reload Neovim configuration" })
