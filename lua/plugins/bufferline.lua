return {
  'akinsho/bufferline.nvim',
  version = '*', -- or a specific release tag
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- can also be "tabs"
        numbers = 'ordinal',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        indicator = {
          style = 'icon',
          icon = '▎',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'thin', -- options: "slant", "padded_slant", "thick", "thin", "none"
        diagnostics = 'nvim_lsp', -- or "coc"
        diagnostics_indicator = function(count, level)
          if level == 'error' then
            return '  ' .. count
          end
          return ''
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = ' File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
      highlights = {
        buffer_selected = {
          fg = '#ffffff', -- text color
          underline = false, -- enable underline
          bold = true,
          italic = false,
        },
        buffer = {
          fg = '#888888',
          bg = '#202020',
          underline = false,
        },
      },
    }
  end,
}
