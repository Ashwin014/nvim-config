require("nvim-tree").setup({
	view = {
		width = 30,
		side = "left",
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
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

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>", { desc = "Find current file in tree" })

-- always open on startup, alongside your dashboard
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	nested = true, -- lets other VimEnter autocmds (like snacks dashboard) also run normally
-- 	callback = function()
-- 		vim.schedule(function()
-- 			require("nvim-tree.api").tree.open()
-- 			vim.cmd("wincmd p") -- jump focus back to prev (main) window
-- 		end)
-- 	end,
-- })
