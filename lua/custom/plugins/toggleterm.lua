return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[;t]],
      direction = 'horizontal', -- or 'vertical' or 'float', 'horizontal'
      start_in_insert = true,
      persist_size = true,
      shade_terminals = true,
      insert_mappings = true,
      terminal_mappings = true,
      float_opts = {
        border = 'curved',
      },
    }

    -- Keybindings
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

    -- Optional: Add Lazygit toggle (if using toggleterm instead of lazygit.nvim)
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      on_open = function()
        vim.cmd 'startinsert!'
      end,
    }

    vim.keymap.set('n', '<leader>gg', function()
      lazygit:toggle()
    end, { desc = 'Toggle Lazygit (ToggleTerm)' })
  end,
}
