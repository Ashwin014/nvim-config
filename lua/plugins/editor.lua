return {
	{
		"smoka7/hop.nvim",
		cmd = { "HopWord", "HopChar1", "HopLine" },
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
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
		config = function()
			require("config.aerial")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"Wansmer/treesj",
		cmd = { "TSJToggle", "TSJ" },
		config = function()
  		require("config.treejs")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	},
}
