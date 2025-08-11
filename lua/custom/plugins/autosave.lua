return {
  'Pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup {
      enabled = true,
      execution_message = {
        message = function()
          return '💾 Saved at ' .. vim.fn.strftime '%H:%M:%S'
        end,
        dim = 0.18,
        cleaning_interval = 500,
      },
      debounce_delay = 1000,
      trigger_events = { 'InsertLeave', 'TextChanged' },
      condition = function(buf)
        local fn = vim.fn
        local utils = require 'auto-save.utils.data'
        local modifiable = fn.getbufvar(buf, '&modifiable') == 1
        local readonly = fn.getbufvar(buf, '&readonly') == 0
        local filetype = fn.getbufvar(buf, '&filetype')

        return modifiable and readonly
          and utils.not_in(filetype, { 'oil', 'nofile', 'quickfix', 'neo-tree', 'toggleterm' })
      end,
    }
  end,
}
