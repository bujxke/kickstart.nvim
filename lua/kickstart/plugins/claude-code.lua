-- Claude Code integration for AI-assisted development
-- https://github.com/coder/claudecode.nvim

return {
  'coder/claudecode.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  keys = {
    -- Core commands
    { '<leader>cc', '<cmd>ClaudeCode<cr>', desc = '[C]laude [C]ode toggle' },
    { '<leader>cf', '<cmd>ClaudeCodeFocus<cr>', desc = '[C]laude [F]ocus' },
    { '<leader>cr', '<cmd>ClaudeCode --resume<cr>', desc = '[C]laude [R]esume' },
    { '<leader>cR', '<cmd>ClaudeCode --continue<cr>', desc = '[C]laude Continue' },
    { '<leader>cm', '<cmd>ClaudeCodeSelectModel<cr>', desc = '[C]laude Select [M]odel' },
    -- Context commands
    { '<leader>cb', '<cmd>ClaudeCodeAdd %<cr>', desc = '[C]laude Add [B]uffer' },
    { '<leader>cs', ':ClaudeCodeSend<cr>', mode = 'v', desc = '[C]laude [S]end selection' },
  },
  config = function(_, opts)
    require('claudecode').setup(opts)
    -- Exit terminal mode and return to last focused window
    vim.keymap.set('t', '<C-Space>', '<C-\\><C-n><C-w>p', { desc = 'Exit terminal mode & go to previous window' })
  end,
  opts = {
    -- Terminal configuration
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.30,
      provider = 'snacks',
      auto_close = true,
    },
    -- Disable diff integration
    diff_opts = false,
    -- Selection tracking for visual mode
    track_selection = true,
    -- Focus terminal after sending selection
    focus_after_send = true,
  },
}
