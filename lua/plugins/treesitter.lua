return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = "main",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
}
