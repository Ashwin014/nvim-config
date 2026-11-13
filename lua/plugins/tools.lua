return {
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
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		config = function()
			require("config.grugfar")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		cmd = { "Harpoon" },
		config = function()
			require("config.harpoon")
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("config.goto-preview")
		end,
	},
	{
		"mmikeww/autohotkey.vim",
	},
}
