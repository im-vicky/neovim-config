return {
  'windwp/nvim-ts-autotag', -- plugin repo
  dependencies = 'nvim-treesitter/nvim-treesitter', -- needs treesitter
  config = function()
    require('nvim-ts-autotag').setup {} -- setup call
  end,
  lazy = true, -- mark as lazy-loaded
  event = 'VeryLazy', -- load only on VeryLazy event
}
