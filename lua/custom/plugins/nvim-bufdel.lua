return {
  'ojroques/nvim-bufdel',
  config = function()
    vim.keymap.set('n', '<leader>q', '<Cmd>BufDel<CR>', { desc = 'Close current buffer' })
  end,
}
