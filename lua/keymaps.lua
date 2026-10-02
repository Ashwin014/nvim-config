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

map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight
map("v", "J", ":m '>+1<CR>gv=gv") -- move selected lines down
map("v", "K", ":m '<-2<CR>gv=gv") -- move selected lines up
map("v", "<", "<gv") -- keep selection when indenting
map("v", ">", ">gv")
map("n", "<C-d>", "<C-d>zz") -- keep cursor centered on scroll
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv") -- same for search jumps
map("n", "N", "Nzzzv")
map("x", "<leader>p", '"_dP') -- paste over selection without losing your yank

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Toggle comment (native gc)
map("n", "<leader>c", "gcc", { remap = true, silent = true })
map("v", "<leader>c", "gc", { remap = true, silent = true })

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
map("n", "<leader>E", function()
	vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open current file externally" })

map("i", "<C-BS>", "<C-w>", { desc = "Delete word back" })

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

-- Convert current selection or run a specific transformation sequence
-- Example: map <leader>lc to your lowercase/uppercase toggle sequence
map("v", "<leader>lc", "Uv$~", { desc = "Toggle to lowercased" })

-- quickly jump to init.lua & wezterm.lua
map("n", "<leader>vv", "<cmd>edit $MYVIMRC<cr>", { desc = "Edit init.lua" })
map("n", "<leader>vw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>", { desc = "Edit wezterm.lua" })

-- select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })
