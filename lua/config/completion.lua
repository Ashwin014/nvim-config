---------------------------------------------------------------------
-- Completion (blink.cmp)
---------------------------------------------------------------------
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<C-j>"] = { "show" },
	}, -- <CR> accept, <C-n>/<C-p> move, <C-space> open, <Tab> snippet jump
	completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
	signature = { enabled = true },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("nvim-autopairs").setup({})
require("nvim-surround").setup({}) -- ys{motion}{char}, ds{char}, cs{old}{new}
