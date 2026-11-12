local m = require("core.map")
local nmap = m.nmap
local vmap = m.vmap
local imap = m.imap
local xmap = m.xmap

-- leader is set in init.lua before this module loads

-- map CAPSLOCK (F13) as Esc
nmap("<F13>", "<Esc>")
imap("<F13>", "<Esc>")
vmap("<F13>", "<Esc>")
xmap("<F13>", "<Esc>")

-- ========================================================
-- WINDOW
-- ========================================================

-- nmap("<leader>q", ":q<CR>", { desc = "Quit" })
-- nmap("<leader>Q", ":q!<CR>", { desc = "Quit (forced)" })
-- nmap("<leader>w", ":w<CR>", { desc = "Save" })
-- nmap("<leader>W", ":w!<CR>", { desc = "Save (forced)" })
-- nmap("<leader>R", ":restart<CR>", { desc = "Restart" })

vim.api.nvim_create_user_command("W", "w", { nargs = "*" }) -- make :W equal to :w
vim.api.nvim_create_user_command("WR", "write | restart", {}) -- :write | restart
vim.api.nvim_create_user_command("R", "restart", {})

-- window navigation
-- nmap("<C-h>", "<C-w>h")
-- nmap("<C-l>", "<C-w>l")
-- nmap("<C-j>", "<C-w>j")
-- nmap("<C-k>", "<C-w>k")

-- window resize
-- nmap("<C-Up>", "<cmd>resize +5<cr>", { desc = "Resize up" })
-- nmap("<C-Down>", "<cmd>resize -5<cr>", { desc = "Resize down" })
-- nmap("<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
-- nmap("<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })

-- window splits
-- nmap("<leader>|", "<C-w>v", { desc = "Split vertically" })
-- nmap("<leader>\\", "<C-w>s", { desc = "Split horizontally" })

-----------------------------------------------------------

-- nmap("<leader>bn", ":bn<CR>", { desc = "Goto next buffer" })
-- nmap("<leader>bp", ":bp<CR>", { desc = "Goto prev buffer" })
-- nmap("<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
-- nmap("<leader>bs", ":b#<CR>", { desc = "Switch buffers" })

-- nmap("<A-Left>", "<C-o>")
-- nmap("<A-Right>", "<C-i>")
--
-- -- Create a user command :CloseOtherBuffers
-- vim.api.nvim_create_user_command("CloseOtherBuffers", function()
-- 	local current_buf = vim.api.nvim_get_current_buf()
-- 	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
-- 		if bufnr ~= current_buf and vim.api.nvim_buf_is_loaded(bufnr) then
-- 			vim.api.nvim_buf_delete(bufnr, {})
-- 		end
-- 	end
-- end, {})
--
-- -- Optional: Map it to <leader>bo (Buffer Only)
-- nmap("<leader>bo", ":CloseOtherBuffers<CR>", { silent = true, desc = "Close all other buffers" })

-----------------------------------------------------------

-- Tabs
-- nmap("<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
-- nmap("<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
-- nmap("<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
-- nmap("<leader>tl", "<cmd>tabnext<cr>", { desc = "Next tab" })
-- nmap("<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev tab" })
-- nmap("<leader>ti", "<cmd>tabs<cr>", { desc = "List tabs" }) -- was inlay hints toggle
--
-----------------------------------------------------------
-- BRACKET-BASED NEXT/PREV NAVIGATION
-----------------------------------------------------------

-- Buffers
nmap("[b", ":bprevious<CR>", { desc = "Previous buffer" })
nmap("]b", ":bnext<CR>", { desc = "Next buffer" })

-- Tabs
nmap("[t", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
nmap("]t", "<cmd>tabnext<CR>", { desc = "Next tab" })

-- Quickfix / Location list
nmap("[q", "<cmd>cprevious<CR>", { desc = "Previous quickfix" })
nmap("]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
nmap("[l", "<cmd>lprevious<CR>", { desc = "Previous location list" })
nmap("]l", "<cmd>lnext<CR>", { desc = "Next location list" })

-- Diagnostics
nmap("[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })

nmap("]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

nmap("[e", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous error" })

nmap("]e", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error" })

-- Search
nmap("[/", "N", { desc = "Previous search match" })
nmap("]/", "n", { desc = "Next search match" })

-- ========================================================
-- EDITOR
-- ========================================================
-- clear search highlight
nmap("<Esc>", "<cmd>nohlsearch<CR>")

-- move selected lines down/up
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")
-- keep selection when indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- -- keep cursor centered on scroll
-- nmap("<C-d>", "<C-d>zz")
-- nmap("<C-u>", "<C-u>zz")
-- nmap("<C-f>", "<C-f>zz")
-- nmap("<C-b>", "<C-b>zz")
-- same for search jumps
-- nmap("n", "nzzzv")
-- nmap("N", "Nzzzv")

-- xmap("<leader>p", '"_dP', { desc = "paste over selection without losing your yank" })
-- keep last yanked when pasting
vmap("p", '"_dP', { noremap = true, silent = true })
-- TEXT ---------------------------------------------------

imap("<C-BS>", "<C-w>", { desc = "Delete word back" })

nmap("<leader>ca", "gg<S-v>G", { desc = "Select all text" })

-- imap("<C-d>", "<Esc>ddi", { desc = "Delete line" })

-- delete single character without copying into register/clipboard
nmap("x", '"_x', { noremap = true, silent = true })

-- vim.keymap.set("i", "<C-/>", function()
-- 	local pos = vim.api.nvim_win_get_cursor(0)
-- 	vim.cmd("normal! gcc")
-- 	vim.api.nvim_win_set_cursor(0, pos)
-- 	vim.cmd("startinsert")
-- end, { desc = "Toggle comment" })

-- nmap("<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
-- vmap("<leader>/", "gc", { remap = true, silent = true, desc = "Toggle comment" })
nmap("<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vmap("<C-/>", "gc", { remap = true, silent = true, desc = "Toggle comment" })
imap("<C-/>", "<Esc>gccA", { remap = true, desc = "Toggle comment" })

-- LINES --------------------------------------------------

-- Move line(s) up/down — Alt+Up/Down and Alt+j/e
nmap("<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
nmap("<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
nmap("<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
nmap("<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

imap("<A-Down>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
imap("<A-Up>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
imap("<A-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
imap("<A-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })

-- Duplicate a line and comment out the first line
-- nmap("<leader>yc", "yygccp", { remap = true })

-- This solution flickers the cmdline
vmap("<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vmap("<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
vmap("<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vmap("<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

--
-- sourced from https://www.reddit.com/r/neovim/comments/1gryk36/what_are_some_of_your_favorite_small_custom/
-- nvmap("<left>", "zh")
-- nvmap("<down>", "<c-e>")
-- nvmap("<up>", "<c-y>")
-- nvmap("<right>", "zl")

-- imap("<left>", "<Esc>zh")
-- imap("<down>", "<Esc><c-e>")
-- imap("<up>", "<Esc><c-y>")
-- imap("<right>", "<Esc>zl")

-- nvmap("<S-left>", "zH")
-- nvmap("<S-right>", "zL")

-- nmap("<up>", "^kzz")
-- nmap("<down>", "^jzz")
-- nmap("k", "^kzz")
-- nmap("j", "^jzz")

--

nmap("<Tab>", ">>")
vmap("<Tab>", ">gv")
nmap("<S-Tab>", "<<")
vmap("<S-Tab>", "<gv")

--

-- ========================================================
-- UTILS
-- ========================================================
-- map undo "U"
nmap("U", "<C-r>")

imap("jk", "<Esc>")
imap("jj", "<Esc>")

-- Video, audio and everything else: open with the system app.
-- `gx` (native) opens the URL/file under the cursor; in Oil, `gx` opens the file.
-- nmap("<leader>E", function()
-- 	vim.ui.open(vim.fn.expand("%:p"))
-- end, { desc = "Open current file externally" })

-- quickly jump to init.lua & wezterm.lua
-- nmap("<leader>vv", "<cmd>edit $MYVIMRC<cr>", { desc = "Edit init.lua" })
-- nmap("<leader>vw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>", { desc = "Edit wezterm.lua" })

-- nmap("<leader>cf", function()
-- 	vim.fn.setreg("+", vim.fn.expand("%"))
-- 	print("Copied relative path!")
-- end)

-----------------------------------------------------------

-- write + restart
vim.api.nvim_create_user_command("Wr", "write | source %", {})

-----------------------------------------------------------
-- Mouse TEMP

-- Ctrl+click: go to definition
vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>")

-- Right-click: hover docs
vim.keymap.set("n", "<RightMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover()<CR>")
