require("gitsigns").setup({
	on_attach = function(buf)
		local gs = require("gitsigns")
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
		end
		map("]h", function()
			gs.nav_hunk("next")
		end, "next hunk")
		map("[h", function()
			gs.nav_hunk("prev")
		end, "prev hunk")
		map("<leader>hp", gs.preview_hunk, "preview hunk")
		map("<leader>hs", gs.stage_hunk, "stage hunk")
		map("<leader>hr", gs.reset_hunk, "reset hunk")
		map("<leader>hb", gs.blame_line, "blame line")
	end,
})
