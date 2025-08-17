return {
  desc = 'Aerial Symbol Browser',
  {
    'stevearc/aerial.nvim',
    opts = function()
      ---@type table<string, string[]>|false
      local filter_kind = false

      local opts = {
        attach_mode = 'global',
        backends = { 'lsp', 'treesitter', 'markdown', 'man' },
        show_guides = true,
        autojump = true,
        highlight_on_hover = true,
        layout = {
          min_width = 30,
          resize_to_content = false,
          win_opts = {
            winhl = 'Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB',
            signcolumn = 'yes',
            statuscolumn = ' ',
          },
        },
        filter_kind = filter_kind,
        -- stylua: ignore
        guides = {
          mid_item   = "├╴",
          last_item  = "└╴",
          nested_top = "│ ",
          whitespace = "  ",
        },
      }
      return opts
    end,
    keys = {
      { '<leader>o', '<cmd>AerialToggle<cr>', desc = 'Aerial (Symbols)' },
    },
  },

  -- Telescope integration
  {
    'nvim-telescope/telescope.nvim',
    optional = true,
    opts = function()
      require('telescope').load_extension 'aerial'
    end,
    keys = {
      {
        '<leader>sS',
        '<cmd>Telescope aerial<cr>',
        desc = 'Goto Symbol (Aerial)',
      },
    },
  },
}
