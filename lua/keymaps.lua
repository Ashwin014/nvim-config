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

-- Multi-mode helpers (very useful)
local function nvmap(lhs, rhs, opts)
	map({ "n", "v" }, lhs, rhs, opts)
end
local function nxmap(lhs, rhs, opts)
	map({ "n", "x" }, lhs, rhs, opts)
end

-- ================================================================================================
-- WINDOW
-- ================================================================================================

-- Window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")

-- Window resize
nmap("<C-Up>", "<cmd>resize +5<cr>", { desc = "Resize up" })
nmap("<C-Down>", "<cmd>resize -5<cr>", { desc = "Resize down" })
nmap("<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
nmap("<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })

-- Window splits
nmap("<leader>|", "<C-w>v", { desc = "Split vertically" })
nmap("<leader>\\", "<C-w>s", { desc = "Split horizontally" })

--

-- Buffer keymaps
nmap("<Tab>", ":bn<CR>", { desc = "Go to next buffer" })
nmap("<S-Tab>", ":bp<CR>", { desc = "Go to prev buffer" })

nmap("<leader>bn", ":bn<CR>", { desc = "Go to next buffer" })
nmap("<leader>bp", ":bp<CR>", { desc = "Go to prev buffer" })
nmap("<leader>bd", ":bd<CR>", { desc = "Delete buffer" })

--

-- Tabs keymaps
nmap("<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
nmap("<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
nmap("<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
nmap("<leader>tl", "<cmd>tabnext<cr>", { desc = "Next tab" })
nmap("<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev tab" })
nmap("<leader>ti", "<cmd>tabs<cr>", { desc = "List tabs" }) -- was inlay hints toggle

-- ================================================================================================
-- EDITOR
-- ================================================================================================
-- clear search highlight
nmap("<Esc>", "<cmd>nohlsearch<CR>")

-- move selected lines down/up
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")
-- keep selection when indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- keep cursor centered on scroll
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
-- same for search jumps
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

map("x", "<leader>p", '"_dP', { desc = "paste over selection without losing your yank" })
-- keep last yanked when pasting
vmap("p", '"_dP', { noremap = true, silent = true })

nmap("<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vmap("<leader>/", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- TEXT
imap("<C-BS>", "<C-w>", { desc = "Delete word back" })

-- Convert current selection or run a specific transformation sequence
-- Example: map <leader>lc to your lowercase/uppercase toggle sequence
-- map("v", "<leader>lc", "Uv$~", { desc = "Toggle to lowercased" })

-- select all
nmap("<leader>a", "gg<S-v>G", { desc = "Select all text" })

-- Insert-Mode: paste
imap("<C-v>", "<Esc>pi", { desc = "Paste in insert mode" })

-- Insert-Mode: delete line
imap("<C-d>", "<Esc>ddi", { desc = "Delete line" })

-- delete single character without copying into register/clipboard
nmap("x", '"_x', { noremap = true, silent = true })

-- LINES

-- Move line(s) up/down — Alt+Up/Down and Alt+j/k
nmap("<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
nmap("<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
nmap("<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
nmap("<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

imap("<A-Down>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
imap("<A-Up>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
imap("<A-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
imap("<A-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })

-- This solution flickers the cmdline
vmap("<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vmap("<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
vmap("<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vmap("<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Duplicate a line and comment out the first line
nmap("yc", "yygccp", { remap = true })

--
-- sourced from https://www.reddit.com/r/neovim/comments/1gryk36/what_are_some_of_your_favorite_small_custom/
nmap("<left>", "zh")
nmap("<down>", "<c-e>")
nmap("<up>", "<c-y>")
nmap("<right>", "zl")

nmap("<S-left>", "zH")
nmap("<S-right>", "zL")

-- ================================================================================================
-- UTILS
-- ================================================================================================
-- map undo "U"
nmap("U", "<C-r>")

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
nmap("<leader>E", function()
	vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open current file externally" })

-- quickly jump to init.lua & wezterm.lua
nmap("<leader>vv", "<cmd>edit $MYVIMRC<cr>", { desc = "Edit init.lua" })
nmap("<leader>vw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>", { desc = "Edit wezterm.lua" })

imap("jk", "<Esc>", { desc = "Exit insert mode" })

nmap("<leader>cf", function()
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
