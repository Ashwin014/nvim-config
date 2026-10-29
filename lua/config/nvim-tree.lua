-- plugin list

-- setup
require("nvim-tree").setup({
	view = {
		width = 32,
		side = "left",
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
		},
	},
	filters = {
		dotfiles = false, -- toggle with the keymap below if you want .git etc hidden by default
	},
	git = {
		enable = true,
	},
	actions = {
		open_file = {
			window_picker = { enable = false }, -- opens files in the last used window, not a picker prompt
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>", { desc = "Find current file in tree" })

-- always open on startup, alongside your dashboard
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("nvim-tree.api").tree.open()
	end,
})
