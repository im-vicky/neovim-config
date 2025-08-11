return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      'f',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = {
            mode = 'search',
          },
          label = {
            before = true, -- show label before match
            after = false, -- don't show after
            style = 'inline',
          },
          highlight = {
            backdrop = true,
            matches = true,
          },
        }
      end,
      desc = 'Flash Jump to Word',
    },
  },
}
