# Neovim Config

Refactored structure:

- `init.lua` — bootstrap: sets leader, requires core, then lazy.nvim.
- `lua/core/` — options, keymaps, autocmds (general), map helper.
- `lua/plugins/` — lazy.nvim plugin specs by category (ui, editor, lsp, treesitter, git, notes, tools).
- `lua/config/` — per-plugin setup modules.

## Adding a plugin

1. Add spec to the appropriate `lua/plugins/<category>.lua`.
2. Add setup in `lua/config/<name>.lua` and wire via `config = function() require("config.<name>").setup() end` (or current side-effect style).

## Formatting

`stylua .` (config in `stylua.toml`).
`selene .` (config in `selene.toml`).

## Health

Run `:checkhealth` after changes.
