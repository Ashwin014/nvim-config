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

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Toggle comment (native gc)
map("n", "<leader>c", "gcc", { remap = true, silent = true })
map("v", "<leader>c", "gc", { remap = true, silent = true })

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
vim.keymap.set("n", "<leader>o", function()
	vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open current file externally" })

vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word back" })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Resize down" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })
