# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Neovim configuration based on kickstart.nvim. The primary entry point is `init.lua`, with plugins managed by `lazy.nvim`.

## Commands

- `nvim` - Launch config; first run installs plugins via lazy.nvim
- `:Lazy` - Open plugin manager; `:Lazy update` updates pinned plugins
- `:Mason` - Manage LSP/formatter installs
- `:ConformInfo` - Show formatter status
- `:checkhealth` - Diagnose environment issues
- `:TSUpdate` - Refresh Treesitter parsers
- `<leader>f` - Format current buffer

## Architecture

### Entry Point
`init.lua` contains all core configuration: options, keymaps, plugin specs, LSP setup, and formatting rules.

### Plugin Structure
- `lua/kickstart/plugins/*.lua` - Optional plugin configs enabled by `require` in init.lua
- `lua/custom/plugins/` - Local plugin specs; enable by uncommenting `{ import = 'custom.plugins' }` in init.lua
- `after/lsp/*.lua` - Per-LSP server configuration overrides (lua_ls, ts_ls, yamlls)

### Other Directories
- `colors/` - Custom colorschemes
- `doc/` - Help documentation
- `lazy-lock.json` - Plugin version pinning
- `telescope.ignore` - File patterns excluded from Telescope searches

## Code Style

- Lua uses 2-space indentation (see modeline in init.lua)
- Format with `stylua` for Lua, `biome` for JS/TS/JSON
- Plugin specs use `opts = {}` pattern when possible
- Keymaps must include `desc` field for which-key integration

## Testing

No automated test suite. Validate changes by:
1. Starting `nvim`
2. Running `:checkhealth`
3. Exercising affected features (LSP, formatter, keymaps)
4. Verifying `:Lazy` shows clean status

## Commits

Use short, imperative summaries. Conventional Commits prefix (`feat:`, `fix:`) optional but encouraged per recent history.
