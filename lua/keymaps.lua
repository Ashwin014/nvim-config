local map = vim.keymap.set

vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false -- default silent = true
	-- opts.noremap is already the default of vim.keymap.set
	vim.keymap.set(mode, lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
	map("n", lhs, rhs, opts)
end
local function vmap(lhs, rhs, opts)
	map("v", lhs, rhs, opts)
end
local function imap(lhs, rhs, opts)
	map("i", lhs, rhs, opts)
end
local function xmap(lhs, rhs, opts)
	map("x", lhs, rhs, opts)
end -- visual block
local function tmap(lhs, rhs, opts)
	map("t", lhs, rhs, opts)
end -- terminal
local function cmap(lhs, rhs, opts)
	map("c", lhs, rhs, opts)
end -- command-line

-- ================================================================================================
-- WINDOW
-- ================================================================================================

-- Window navigation
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")

nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")

-- Window resize
map("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Resize up" })
map("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Resize down" })
map("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
map("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })

-- Window splits
map("n", "<leader>|", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>\\", "<C-w>s", { desc = "Split horizontally" })

--

-- Buffer keymaps
map("n", "<Tab>", ":bn<CR>", { desc = "Go to next buffer" })
map("n", "<S-Tab>", ":bp<CR>", { desc = "Go to prev buffer" })

map("n", "<leader>bn", ":bn<CR>", { desc = "Go to next buffer" })
map("n", "<leader>bp", ":bp<CR>", { desc = "Go to prev buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })

--

-- Tabs keymaps
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev tab" })
map("n", "<leader>ti", "<cmd>tabs<cr>", { desc = "List tabs" }) -- was inlay hints toggle

-- ================================================================================================
-- EDITOR
-- ================================================================================================
-- clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move selected lines down/up
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- keep selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- keep cursor centered on scroll
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- same for search jumps
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", '"_dP', { desc = "paste over selection without losing your yank" })
-- keep last yanked when pasting
map("v", "p", '"_dP', { noremap = true, silent = true })

map("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- TEXT
map("i", "<C-BS>", "<C-w>", { desc = "Delete word back" })

-- Convert current selection or run a specific transformation sequence
-- Example: map <leader>lc to your lowercase/uppercase toggle sequence
-- map("v", "<leader>lc", "Uv$~", { desc = "Toggle to lowercased" })

-- select all
map("n", "<leader>a", "gg<S-v>G", { desc = "Select all text" })

-- Insert-Mode: paste
map("i", "<C-v>", "<Esc>pi", { desc = "Paste in insert mode" })

-- Insert-Mode: delete line
map("i", "<C-d>", "<Esc>ddi", { desc = "Delete line" })

-- delete single character without copying into register/clipboard
map("n", "x", '"_x', { noremap = true, silent = true })

-- LINES

-- Move line(s) up/down — Alt+Up/Down and Alt+j/k
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

map("i", "<A-Down>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<A-Up>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })

-- This solution flickers the cmdline
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Duplicate a line and comment out the first line
map("n", "yc", "yygccp", { remap = true })

--
-- sourced from https://www.reddit.com/r/neovim/comments/1gryk36/what_are_some_of_your_favorite_small_custom/
map("n", "<left>", "zh")
map("n", "<down>", "<c-e>")
map("n", "<up>", "<c-y>")
map("n", "<right>", "zl")

map("n", "<S-left>", "zH")
map("n", "<S-right>", "zL")

-- ================================================================================================
-- UTILS
-- ================================================================================================
-- map undo "U"
map("n", "U", "<C-r>")

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
map("n", "<leader>E", function()
	vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open current file externally" })

-- quickly jump to init.lua & wezterm.lua
map("n", "<leader>vv", "<cmd>edit $MYVIMRC<cr>", { desc = "Edit init.lua" })
map("n", "<leader>vw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>", { desc = "Edit wezterm.lua" })

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

map("n", "<leader>cf", function()
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
