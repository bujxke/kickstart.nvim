# Repository Guidelines

This repository is a Neovim configuration based on kickstart.nvim. The primary entry point is `init.lua`, with plugins managed by `lazy.nvim`.

## Project Structure & Module Organization
- `init.lua` is the main configuration: options, keymaps, plugins, LSP, and formatting.
- `lua/kickstart/` holds optional modules and plugin configs; extra plugins live in `lua/kickstart/plugins/*.lua` and are enabled by `require` in `init.lua`.
- `lua/custom/plugins/` is a safe area for local plugin specs; enable by uncommenting `{ import = 'custom.plugins' }` in `init.lua`.
- `colors/` contains custom colorschemes; `doc/` provides help docs/tags; `telescope.ignore` tunes file search; `lazy-lock.json` pins plugin versions.

## Build, Test, and Development Commands
- `nvim` launches the config; first run installs plugins via lazy.nvim.
- `:Lazy` opens the plugin manager; `:Lazy update` updates pinned plugins.
- `:Mason` manages LSP/formatter installs; `:ConformInfo` shows formatter status.
- `:checkhealth` diagnoses environment issues; `:TSUpdate` refreshes Treesitter parsers.

## Coding Style & Naming Conventions
- Lua uses 2-space indentation and spaces (see the modeline in `init.lua`).
- Keep plugin specs in `lua/kickstart/plugins/<name>.lua` or `lua/custom/plugins/<name>.lua` with matching module names.
- Prefer `opts = {}` for plugin setup and include keymap `desc` fields.
- Formatting is handled by `conform.nvim`: `stylua` for Lua, `biome` for JS/TS/JSON, and `<leader>f` formats the current buffer.

## Testing Guidelines
- No automated test suite. Validate changes by starting `nvim`, running `:checkhealth`, and exercising affected features (LSP, formatter, keymaps).
- When modifying plugins, ensure `lazy-lock.json` updates and `:Lazy` shows a clean status.

## Commit & Pull Request Guidelines
- Recent history uses short, imperative summaries and occasionally Conventional Commits (`feat:`, `fix:`). Follow that style.
- PRs should include a concise description, test notes (commands or Neovim checks run), and screenshots for UI changes (colors, statusline, file tree).
