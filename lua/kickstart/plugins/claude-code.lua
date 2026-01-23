-- Claude Code integration for AI-assisted development
-- https://github.com/greggh/claude-code.nvim

return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>cc', '<cmd>ClaudeCode<CR>', desc = '[C]laude [C]ode toggle' },
  },
  config = function()
    require('claude-code').setup {
      -- Default configuration
      -- Toggle terminal: <leader>cc (custom) or <C-,> (default)
      -- Continue mode: <leader>cC
      -- Verbose mode: <leader>cV

      -- Customize here if needed:
      -- window = {
      --   split_ratio = 0.5,
      --   position = 'right',
      -- },
    }
  end,
}
