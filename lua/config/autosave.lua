vim.api.nvim_create_autocmd("TextChanged", {
	callback = function(ev)
		local b = vim.bo[ev.buf]
		if b.modified and b.buftype == "" and vim.api.nvim_buf_get_name(ev.buf) ~= "" then
			vim.api.nvim_buf_call(ev.buf, function()
				vim.cmd("silent! write")
			end)
		end
	end,
})
