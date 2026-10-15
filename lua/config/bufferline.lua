require("bufferline").setup({
	options = {
		mode = "buffers", -- show open buffers as tabs
		diagnostics = "nvim_lsp", -- show LSP errors/warnings in buffer tabs
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
