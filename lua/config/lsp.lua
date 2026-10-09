require("mason").setup({})

-- applies to every server; must run before servers start
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "Snacks" } },
			workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
			telemetry = { enable = false },
		},
	},
})

-- installs servers and auto-enables them via vim.lsp.enable
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ruff",
		"ts_ls",
		"eslint",
		"bashls",
		"jsonls",
		"html",
		"cssls",
		"rust_analyzer",
		"clangd", -- drop what you don't use
		"yamlls",
		"taplo",
		"marksman",
	},
	automatic_enable = true,
})

-- formatters / debuggers (non-LSP tools)
require("mason-tool-installer").setup({
	ensure_installed = { "stylua", "prettier", "debugpy", "js-debug-adapter", "codelldb" },
})

vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	severity_sort = true,
	update_in_insert = false,
	float = { source = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
	},
})

-- Built-in defaults already give you:
--   K hover, grn rename, gra code action, grr references,
--   gri implementation, grt type def, gO doc symbols,
--   [d ]d diagnostics, <C-s> signature help (insert)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local buf = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
		end

		map("gd", vim.lsp.buf.definition, "Go to definition")
		map("gD", vim.lsp.buf.declaration, "Go to declaration")
		map("<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
		map("<leader>lq", vim.diagnostic.setqflist, "Diagnostics to quickfix")
		map("gR", vim.lsp.buf.references, "Go to references")
		map("gi", vim.lsp.buf.implementation, "Go to implementation")
		map("<leader>ci", vim.lsp.buf.incoming_calls, "Incoming calls")
		map("<leader>co", vim.lsp.buf.outgoing_calls, "Outgoing calls")

		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = buf })
			map("<leader>ti", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
			end, "Toggle inlay hints")
		end

		-- ruff = lint/format only; let pyright handle hover
		if client and client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
})

-- AutoHotkey v2
vim.lsp.config("ahk2", {
	cmd = { "node", "C:/Users/ashwi/vscode-autohotkey2-lsp/server/dist/server.js", "--stdio" },
	filetypes = { "autohotkey" },
	root_markers = { ".git" },
})
vim.lsp.enable("ahk2")

vim.filetype.add({
	extension = { ahk = "autohotkey" },
})
