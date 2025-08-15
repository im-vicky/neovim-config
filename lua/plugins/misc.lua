return {
  { 'NvChad/nvim-colorizer.lua', config = true },

  -- Formatter and Linter
  { 'nvimtools/none-ls.nvim' }, -- null-ls replacement

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
