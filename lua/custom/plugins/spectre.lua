return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>rp',
      function()
        require('spectre').open()
      end,
      desc = 'Search & Replace in Project',
    },
    {
      '<leader>rw',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      desc = 'Search Current Word',
    },
    {
      '<leader>rb',
      function()
        require('spectre').open_file_search()
      end,
      desc = 'Search & Replace in Current Buffer',
    },
  },
}
