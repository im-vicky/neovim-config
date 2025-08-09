return {
  'kazhala/close-buffers.nvim',
  cmd = { 'BDelete', 'BWipeout' },
  keys = {
    { '<leader>q', '<cmd>BDelete this<cr>', desc = 'Delete Buffer' },
  },
}
