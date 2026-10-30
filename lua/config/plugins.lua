-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- UI / Theme / Aesthetics
	{ "ember-theme/nvim", name = "ember" },
	{ "Mofiqul/vscode.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "rezniqov/soviet.nvim" },
	{ "neanias/everforest-nvim" },

	{
		"folke/which-key.nvim",
		config = function()
			require("config.which-key")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.git")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine")
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"folke/snacks.nvim",
		config = function()
			require("config.snacks")
		end,
	},
	{
		"smoka7/hop.nvim",
		config = function()
			require("config.hop")
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("config.surround")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		config = function()
			require("config.markdown")
		end,
	},

	{
		"sphamba/smear-cursor.nvim",
		config = function()
			require("config.smear-cursor")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
		config = function()
			require("config.aerial")
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- LSP + installer
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{ "mason-org/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = "main",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },

	-- Completion + snippets
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { { "saghen/blink.lib", version = "1.*", build = "cargo build --release" } },
		config = function()
			require("config.completion")
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("config.formatting")
		end,
	},

	-- Find / files
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope")
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"stevearc/oil.nvim",
		config = function()
			require("config.oil")
		end,
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dap")
		end,
	},
	{ "rcarriga/nvim-dap-ui" },
	{ "nvim-neotest/nvim-nio" },
	{ "mfussenegger/nvim-dap-python" },

	-- Notes
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		ft = "markdown",
		config = function()
			require("config.obsidian")
		end,
	},

	-- Tools
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		config = function()
			require("config.grugfar")
		end,
	},

	-- QoL
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			require("config.harpoon")
		end,
	},
	{
		"shortcuts/no-neck-pain.nvim",
		config = function()
			require("config.no-neck-pain")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.indent-blankline")
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("config.goto-preview")
		end,
	},
	{
		"Wansmer/treesj",
		config = function()
			require("config.treejs")
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("config.rainbow-delimiters")
		end,
	},

	-- prog-lanaguages
	{ "mmikeww/autohotkey.vim" },
}, {
	ui = { border = "rounded" },
})
