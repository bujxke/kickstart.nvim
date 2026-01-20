-- Ghostty "Monokai Remastered" palette mapped to Base16 slots.
vim.o.background = 'dark'

local palette = {
  base00 = '#0c0c0c',
  base01 = '#1a1a1a',
  base02 = '#343434',
  base03 = '#625e4c',
  base04 = '#c4c5b5',
  base05 = '#d9d9d9',
  base06 = '#ffffff',
  base07 = '#f6f6ef',
  base08 = '#f4005f',
  base09 = '#fd971f',
  base0A = '#e0d561',
  base0B = '#98e024',
  base0C = '#58d1eb',
  base0D = '#9d65ff',
  base0E = '#f4005f',
  base0F = '#625e4c',
}

require('mini.base16').setup { palette = palette }
vim.api.nvim_set_hl(0, 'Visual', { fg = palette.base06, bg = palette.base02 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = palette.base03, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = palette.base04, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = palette.base03, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = palette.base0C, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'CursorLineSign', { fg = palette.base03, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'CursorLineFold', { fg = palette.base0C, bg = palette.base00 })
vim.g.colors_name = 'ghostty_monokai_remastered'
