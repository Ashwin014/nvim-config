require("blink.cmp").setup({
	keymap = { preset = "enter" }, -- <CR> accept, <C-n>/<C-p> move, <C-space> open, <Tab> snippet jump
	completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
	signature = { enabled = true },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("nvim-surround").setup({}) -- ys{motion}{char}, ds{char}, cs{old}{new}

require("nvim-autopairs").setup({
	enable_check_bracket_line = true,
	disable_filetype = {}, -- unused when starting disabled, left here in case you re-enable per-filetype later
})

require("nvim-autopairs").disable()

vim.keymap.set("n", "<leader>up", function()
	local npairs = require("nvim-autopairs")
	if npairs.state.disabled then
		npairs.enable()
	else
		npairs.disable()
	end
end, { desc = "Toggle autopairs" })
