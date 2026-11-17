return {
	-- Themes
	{ "ember-theme/nvim", name = "ember" },
	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("config.colorschemes")
		end,
	},
	{ "navarasu/onedark.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "rezniqov/soviet.nvim" },
	{ "ramojus/mellifluous.nvim" },

	-- UI
	{
		"folke/which-key.nvim",
		config = function()
			require("config.which-key")
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
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.indent-blankline")
		end,
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("config.bufferline")
	-- 	end,
	-- },
}
