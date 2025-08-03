return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true,
  keys = {
    -- Toggle the TODO list with Trouble
    { '<leader>td', '<cmd>TodoTrouble<cr>', desc = 'TODOs (Trouble)' },

    -- Show TODOs in Telescope
    { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'TODOs (Telescope)' },

    -- Quickly jump to next/prev TODO comment
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next TODO',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous TODO',
    },
  },
}
