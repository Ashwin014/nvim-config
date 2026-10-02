local map = vim.keymap.set

vim.g.mapleader = " "

-- ================================================================================================
-- WINDOW
-- ================================================================================================

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

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

map("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- TEXT
map("i", "<C-BS>", "<C-w>", { desc = "Delete word back" })

-- Convert current selection or run a specific transformation sequence
-- Example: map <leader>lc to your lowercase/uppercase toggle sequence
map("v", "<leader>lc", "Uv$~", { desc = "Toggle to lowercased" })

-- select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Insert-Mode: paste
map("i", "<C-v>", "<Esc>pi", { desc = "Paste in insert mode" })

-- Insert-Mode: delete line
map("i", "<C-d>", "<Esc>ddi", { desc = "Delete line" })

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
vim.keymap.set("n", "<left>", "zh")
vim.keymap.set("n", "<down>", "<c-e>")
vim.keymap.set("n", "<up>", "<c-y>")
vim.keymap.set("n", "<right>", "zl")

vim.keymap.set("n", "<S-left>", "zH")
vim.keymap.set("n", "<S-right>", "zL")
-- ================================================================================================
-- UTILS
-- ================================================================================================

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
