---------------------------------------------------------------------
-- Jump to label (Helix `gw` style)
---------------------------------------------------------------------
require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
local hop = require("hop")
local map = vim.keymap.set

-- Note: `gw` shadows Vim's native format operator (rarely needed; use gq)
map({ "n", "x", "o" }, "gw", function()
	hop.hint_words()
end, { desc = "Hop: Jump to word (labels)" })

map({ "n", "x", "o" }, "gl", function()
	hop.hint_lines()
end, { desc = "Hop: Jump to line (labels)" })

map({ "n", "x", "o" }, "gs", function()
	hop.hint_char2()
end, { desc = "Hop: Jump to 2-char match" })
