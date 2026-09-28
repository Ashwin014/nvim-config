require("telescope").setup({})
local tb = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", tb.find_files, { desc = "files" })
map("n", "<leader>fg", tb.live_grep, { desc = "grep" })
map("n", "<leader>fb", tb.buffers, { desc = "buffers" })
map("n", "<leader>fr", tb.oldfiles, { desc = "recent files" })
map("n", "<leader>fw", tb.grep_string, { desc = "grep word" })
map("n", "<leader>fh", tb.help_tags, { desc = "help" })
map("n", "<leader>fs", tb.lsp_document_symbols, { desc = "symbols (file)" })
map("n", "<leader>fS", tb.lsp_dynamic_workspace_symbols, { desc = "symbols (project)" })
map("n", "<leader>fd", tb.diagnostics, { desc = "diagnostics" })
map("n", "<leader>fR", tb.lsp_references, { desc = "references" })
