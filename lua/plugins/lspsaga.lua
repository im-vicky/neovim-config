return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach', -- only load when LSP attaches
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lspsaga').setup {
      ui = {
        border = 'rounded',
        winblend = 10,
        devicon = true,
        title = true,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = false, -- cleaner UI
        extend_gitsigns = true,
        keys = {
          quit = 'q',
          exec = '<CR>',
        },
      },
      diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        keys = {
          exec_action = 'o',
          quit = 'q',
          toggle_or_jump = '<CR>',
        },
      },
      symbol_in_winbar = {
        enable = true,
        separator = ' > ',
        hide_keyword = true,
        folder_level = 2,
        color_mode = true,
      },
      hover = {
        max_width = 0.7,
        max_height = 0.7,
        open_link = 'gx',
      },
      finder = {
        keys = {
          toggle_or_open = '<CR>',
          vsplit = 'v',
          split = 's',
          quit = 'q',
        },
      },
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = false,
        virtual_text = true,
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>k', '<cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Docs' })
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>', { desc = 'References & Definitions' })
    vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', { desc = 'Buffer Diagnostics' })
  end,
}
