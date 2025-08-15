return {
  'stevearc/aerial.nvim',
  opts = {
    backends = { 'lsp', 'treesitter' },
    layout = { min_width = 30 },
    show_guides = true,
    autojump = true,
    highlight_on_hover = true,
  },
  keys = {
    { '<leader>o', '<cmd>AerialToggle!<CR>', desc = 'Toggle Outline' },
  },
}
