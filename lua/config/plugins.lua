---------------------------------------------------------------------
-- Plugins (native vim.pack)
---------------------------------------------------------------------

-- Must be defined BEFORE vim.pack.add: keep treesitter parsers in sync
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local d = ev.data
		if d.spec.name == "nvim-treesitter" and (d.kind == "install" or d.kind == "update") then
			if not d.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
		-- new: build markdown-preview after install/update
		if d.spec.name == "markdown-preview.nvim" and (d.kind == "install" or d.kind == "update") then
			if not d.active then
				vim.cmd.packadd("markdown-preview.nvim")
			end
			vim.fn["mkdp#util#install"]()
		end
	end,
})

vim.pack.add({
	-- UI / Theme / Aesthetics
	{ src = "https://github.com/ember-theme/nvim", name = "ember" },
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/rezniqov/soviet.nvim" },

	--

	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/snacks.nvim" }, -- inline images
	{ src = "https://github.com/smoka7/hop.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	--{ src = "https://github.com/akinsho/bufferline.nvim" },

	{ src = "https://github.com/sphamba/smear-cursor.nvim" },

	--

	{ src = "https://github.com/iamcco/markdown-preview.nvim" },

	-- LSP + installer
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },

	-- Completion + snippets
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/windwp/nvim-autopairs" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Find / files
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- telescope dep
	{ src = "https://github.com/stevearc/oil.nvim" },

	-- Debugging
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" }, -- dap-ui dep
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },

	-- Notes
	{ src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") },

	-- Tools
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- noice dependency
	{ src = "https://github.com/folke/noice.nvim" },

	-- QoL
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{ src = "https://github.com/shortcuts/no-neck-pain.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround" },

	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

	-- prog-lanaguages
	{ src = "https://github.com/mmikeww/autohotkey.vim" },
})
