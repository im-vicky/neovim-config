return {
  'nvimdev/lspsaga.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lspsaga').setup {
      -- Optional: Customize lspsaga settings below
      ui = {
        -- Border style for floating windows
        border = 'rounded', -- Can be 'single', 'double', 'rounded', 'solid', or 'shadow'
        winblend = 10,
        code_action = '💡',
        -- Additional UI options
      },

      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
      },

      -- Diagnostic settings (navigation between issues)
      diagnostics = {
        severity_sort = true, -- Sort diagnostics by severity
        show_code_action = true,
        jump_num_shortcut = true,
      },

      -- Enable or disable specific Lspsaga features
      symbol_in_winbar = {
        enable = true, -- Enable symbol display in the status line (e.g., method name)
        separator = ' > ',
        hide_keyword = true, -- Hide keywords from the symbol name
        folder_level = 2, -- Control how deep symbols should be displayed
      },
    }
  end,
}
