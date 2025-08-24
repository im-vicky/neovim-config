return {
  desc = 'Aerial Symbol Browser',
  {
    'stevearc/aerial.nvim',
    opts = function()
      local opts = {
        attach_mode = 'global',
        backends = { 'lsp', 'treesitter', 'markdown', 'man' },
        show_guides = true,
        autojump = true,
        highlight_on_hover = true,
        layout = {
          min_width = 40,
          resize_to_content = false,
          win_opts = {
            winhl = 'Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB',
            signcolumn = 'yes',
            statuscolumn = ' ',
          },
        },
        -- Show only important symbol kinds
        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Struct",
          "Trait",
        },
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
