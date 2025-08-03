return {
  'Pocco81/auto-save.nvim',
  config = function()
    local autosave = require 'auto-save'

    autosave.setup {
      enabled = true,
      execution_message = {
        message = function()
          return '💾 Saved at ' .. vim.fn.strftime '%H:%M:%S'
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { 'InsertLeave' }, -- disable built-in triggers
      condition = function(buf)
        local fn = vim.fn
        local utils = require 'auto-save.utils.data'
        return fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), { 'oil', 'nofile', 'quickfix' })
      end,
    }
  end,
}
