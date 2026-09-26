-- Obsidian
require("obsidian").setup({
	legacy_commands = false, -- this will be removed in 4.0.0
	frontmatter = { enabled = false }, -- don't auto-add id / aliases / tags
	workspaces = {
		{
			name = "personal",
			path = "~/Documents/STIC",
		},
	},
})
