local map = vim.keymap.set

vim.g.mapleader = " "

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

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

map("i", "jk", "<Esc>", { desc = "exit insert mode" })

-- Toggle comment (native gc)
map("n", "<leader>c", "gcc", { remap = true, silent = true })
map("v", "<leader>c", "gc", { remap = true, silent = true })

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
map("n", "<leader>E", function()
	vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "open current file externally" })

map("i", "<C-BS>", "<C-w>", { desc = "delete word back" })

map("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "resize up" })
map("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "resize down" })
map("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "resize left" })
map("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "resize right" })

-- Move line(s) up/down — Alt+Up/Down and Alt+j/k
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "move line down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "move line up" })
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "move line up" })

map("i", "<A-Down>", "<Esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
map("i", "<A-Up>", "<Esc><cmd>m .-2<cr>==gi", { desc = "move line up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "move line up" })

-- This solution flickers the cmdline
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Convert current selection or run a specific transformation sequence
-- Example: map <leader>lc to your lowercase/uppercase toggle sequence
map("v", "<leader>lc", "Uv$~", { desc = "toggle to lowercased" })

-- quickly jump to init.lua & wezterm.lua
map("n", "<leader>vv", "<cmd>edit $MYVIMRC<cr>", { desc = "edit init.lua" })
map("n", "<leader>vw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>", { desc = "edit wezterm.lua" })
