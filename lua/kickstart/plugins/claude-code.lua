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
    -- Diff commands are defined in config function to wrap with buffer cleanup
  },
  config = function(_, opts)
    require('claudecode').setup(opts)
    -- Exit terminal mode and return to last focused window
    vim.keymap.set('t', '<C-Space>', '<C-\\><C-n><C-w>p', { desc = 'Exit terminal mode & go to previous window' })

    -- Wrap diff accept/deny to close both buffers
    local function close_diff_buffers(action_cmd)
      local current_buf = vim.api.nvim_get_current_buf()
      local current_win = vim.api.nvim_get_current_win()
      local tab_wins = vim.api.nvim_tabpage_list_wins(0)

      -- Run the accept/deny command first
      vim.cmd(action_cmd)

      -- Close any remaining diff windows in this tab
      vim.schedule(function()
        for _, win in ipairs(tab_wins) do
          if vim.api.nvim_win_is_valid(win) then
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_name = vim.api.nvim_buf_get_name(buf)
            -- Close buffers that look like diff buffers (claude temp files)
            if buf_name:match('claude') or vim.wo[win].diff then
              pcall(vim.api.nvim_win_close, win, true)
            end
          end
        end
      end)
    end

    vim.keymap.set('n', '<leader>ca', function()
      close_diff_buffers('ClaudeCodeDiffAccept')
    end, { desc = '[C]laude Diff [A]ccept' })

    vim.keymap.set('n', '<leader>cd', function()
      close_diff_buffers('ClaudeCodeDiffDeny')
    end, { desc = '[C]laude Diff [D]eny' })
  end,
  opts = {
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.30,
      provider = 'snacks',
      auto_close = true,
    },
    diff_opts = {
      auto_close_on_accept = true,
      vertical_split = false,
      open_in_current_tab = true,
    },
    track_selection = true,
  },
}
