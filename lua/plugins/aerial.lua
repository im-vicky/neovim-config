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
    {
      '<leader>o',
      function()
        vim.cmd 'AerialToggle'
        -- If aerial window exists, focus it
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == 'aerial' then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      end,
      desc = 'Toggle Outline & Focus',
    },
  },
}
