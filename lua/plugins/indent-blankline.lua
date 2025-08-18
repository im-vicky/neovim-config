return {
  'lukas-reineke/indent-blankline.nvim',
  opts = function()
    Snacks.toggle({
      name = 'Indention Guides',
      get = function()
        return require('ibl.config').get_config(0).enabled
      end,
      set = function(state)
        require('ibl').setup_buffer(0, { enabled = state })
      end,
    }):map '<leader>ug'
    return {
      indent = {
        char = ' ', -- Use space or empty char to hide regular indent guides
        tab_char = ' ',
      },
      scope = {
        enabled = true, -- Ensure scope is enabled
        char = '│', -- Character for scope indentation
        show_start = true, -- show the start of the current scope
        show_end = false, -- hide the end of other scopes
      },
      exclude = {
        filetypes = {
          'Trouble',
          'alpha',
          'dashboard',
          'help',
          'lazy',
          'mason',
          'neo-tree',
          'notify',
          'snacks_dashboard',
          'snacks_notif',
          'snacks_terminal',
          'snacks_win',
          'toggleterm',
          'trouble',
        },
      },
    }
  end,
  main = 'ibl',
}
