return {
  'rlane/pounce.nvim',
  keys = {
    {
      'f',
      function()
        require('pounce').pounce()
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Pounce search',
    },
  },
}
