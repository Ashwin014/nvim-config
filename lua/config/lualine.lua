require("lualine").setup({
	options = {
		theme = "auto", -- takes its colors from your colorscheme
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = {
			left = vim.fn.nr2char(0xe0b8),
			right = vim.fn.nr2char(0xe0be),
		},
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = vim.fn.nr2char(0xe0b8) }, right_padding = 2 } },
		lualine_b = { "filename", "branch" },
		lualine_c = {
			"%=", --[[ add your center components here in place of this comment ]]
		},
		lualine_x = {
			"%S",
			function()
				local r = vim.fn.reg_recording()
				return r ~= "" and ("recording @" .. r) or ""
			end,
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", separator = { right = "", left = vim.fn.nr2char(0xe0be) }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})

vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
	callback = function()
		vim.schedule(function()
			require("lualine").refresh()
		end)
	end,
})
