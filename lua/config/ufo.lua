local M = {}

function M.setup()
	local ufo = require("ufo")
	ufo.setup({
		provider_selector = function(bufnr, filetype, buftype)
			return { "lsp", "treesitter", "indent" }
		end,
	})

	vim.keymap.set("n", "zR", ufo.openAllFolds)
	vim.keymap.set("n", "zM", ufo.closeAllFolds)
	vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
	vim.keymap.set("n", "zm", ufo.closeFoldsWith)
end

return M
