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
		lualine_c = { { "filename", path = 1 } },
		lualine_x = {
			{
				require("noice").api.statusline.command.get,
				cond = require("noice").api.statusline.command.has,
				color = { fg = "#ff9e64" },
			},
			function()
				local r = vim.fn.reg_recording()
				return r ~= "" and ("recording @" .. r) or ""
			end,
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})

vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
	callback = function()
		vim.schedule(function()
			require("lualine").refresh()
		end)
	end,
})
