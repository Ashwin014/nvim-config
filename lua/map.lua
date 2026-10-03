-- lua/config/keymap.lua

local M = {}

function M.map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false -- default to silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
	M.map("n", lhs, rhs, opts)
end
function M.vmap(lhs, rhs, opts)
	M.map("v", lhs, rhs, opts)
end
function M.imap(lhs, rhs, opts)
	M.map("i", lhs, rhs, opts)
end
function M.xmap(lhs, rhs, opts)
	M.map("x", lhs, rhs, opts)
end
function M.tmap(lhs, rhs, opts)
	M.map("t", lhs, rhs, opts)
end
function M.cmap(lhs, rhs, opts)
	M.map("c", lhs, rhs, opts)
end

function M.nvmap(lhs, rhs, opts)
	M.map({ "n", "v" }, lhs, rhs, opts)
end
function M.nxmap(lhs, rhs, opts)
	M.map({ "n", "x" }, lhs, rhs, opts)
end

-- Optional: also export the generic one
M.map = M.map

return M
