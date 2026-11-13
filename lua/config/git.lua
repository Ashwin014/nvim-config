require("gitsigns").setup({
	on_attach = function(buf)
		local gs = require("gitsigns")
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
		end
		map("]h", function()
			gs.nav_hunk("next")
		end, "Next hunk")
		map("[h", function()
			gs.nav_hunk("prev")
		end, "Prev hunk")
		map("<leader>ghp", gs.preview_hunk, "Preview hunk")
		map("<leader>ghs", gs.stage_hunk, "Stage hunk")
		map("<leader>ghr", gs.reset_hunk, "Reset hunk")
		map("<leader>ghb", gs.blame_line, "Blame line")
	end,
})
