return {
  'nvimdev/lspsaga.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lspsaga').setup {
      ui = {
        border = 'rounded',
        winblend = 10,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
      },
      diagnostics = {
        severity_sort = true,
        show_code_action = true,
        jump_num_shortcut = true,
      },
      symbol_in_winbar = {
        enable = true,
        separator = ' > ',
        hide_keyword = true,
        folder_level = 2,
      },
      hover = {
        max_width = 0.6,
        max_height = 0.6,
        open_link = 'gx', -- open links inside docs
      },
    }

    -- Hover docs
    vim.keymap.set('n', '<leader>k', '<cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Documentation' })
  end,
}
