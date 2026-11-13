return {
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

	-- Completion
	{
		"saghen/blink.cmp",
		-- version = "1.*",
		-- dependencies = { { "saghen/blink.lib", version = "1.*", build = "cargo build --release" } },
		build = "cargo build --release", -- for delimiters
		config = function()
			require("config.completion")
		end,
	},

	{ "rafamadriz/friendly-snippets" },

	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("config.formatting")
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
}
