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
    { '<leader>cs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = '[C]laude [S]end selection' },
    -- Diff commands
    { '<leader>ca', '<cmd>ClaudeCodeDiffAccept<cr>', desc = '[C]laude Diff [A]ccept' },
    { '<leader>cd', '<cmd>ClaudeCodeDiffDeny<cr>', desc = '[C]laude Diff [D]eny' },
  },
  opts = {
    -- Terminal configuration
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.40,
      provider = 'snacks',
      auto_close = true,
    },
    -- Diff integration
    diff_opts = {
      auto_close_on_accept = true,
      vertical_split = true,
      open_in_current_tab = true,
    },
    -- Selection tracking for visual mode
    track_selection = true,
    -- Focus terminal after sending selection
    focus_after_send = true,
  },
}
