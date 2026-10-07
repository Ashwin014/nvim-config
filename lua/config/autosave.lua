require("auto-save").setup({
	trigger_events = { "InsertLeave", "TextChanged" },
	debounce_delay = 1500, -- ms after a trigger before it actually saves
	condition = function(buf)
		local fn = vim.fn
		if fn.getbufvar(buf, "&modifiable") == 1 then
			return true
		end
		return false
	end,
})
