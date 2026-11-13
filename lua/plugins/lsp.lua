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
	-- {
	-- 	"saghen/blink.cmp",
	-- 	version = "1.*",
	-- 	dependencies = { { "saghen/blink.lib", version = "1.*", build = "cargo build --release" } },
	-- 	config = function()
	-- 		require("config.completion")
	-- 	end,
	-- },
	--
  {
  'saghen/blink.nvim',
  build = 'cargo build --release', -- for delimiters
  keys = {
	-- chartoggle
	{
	  '<C-;>',
	  function()
	  	require('blink.chartoggle').toggle_char_eol(';')
	  end,
	  mode = { 'n', 'v' },
	  desc = 'Toggle ; at eol',
	},
	{
	  ',',
	  function()
	  	require('blink.chartoggle').toggle_char_eol(',')
	  end,
	  mode = { 'n', 'v' },
	  desc = 'Toggle , at eol',
	},

	-- tree
	{ '<C-e>', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
	{ '<leader>E', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
	{ '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
  },
  -- all modules handle lazy loading internally
  lazy = false,
  opts = {
    chartoggle = { enabled = true },
    tree = { enabled = true }
  }
},

  {
  'saghen/blink.nvim',
  build = 'cargo build --release', -- for delimiters
  keys = {
	-- chartoggle
	{
	  '<C-;>',
	  function()
	  	require('blink.chartoggle').toggle_char_eol(';')
	  end,
	  mode = { 'n', 'v' },
	  desc = 'Toggle ; at eol',
	},
	{
	  ',',
	  function()
	  	require('blink.chartoggle').toggle_char_eol(',')
	  end,
	  mode = { 'n', 'v' },
	  desc = 'Toggle , at eol',
	},

	-- tree
	{ '<C-e>', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
	{ '<leader>E', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
	{ '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
  },
  -- all modules handle lazy loading internally
  lazy = false,
  opts = {
    chartoggle = { enabled = true },
    tree = { enabled = true }
  }
}



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
