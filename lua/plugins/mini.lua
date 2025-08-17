return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Indentation scope line
    require('mini.snippets').setup()
    require('mini.indentscope').setup {
      -- Symbol to use for drawing
      symbol = '▏',

      -- Options
      options = {
        border = 'both', -- 'both', 'top', 'bottom', 'none'
        indent_at_cursor = true, -- Highlight scope of current line
        try_as_border = true, -- Use indent as border if possible
      },

      -- Draw settings
      draw = {
        delay = 0, -- animation delay in ms (0 = instant)
        animation = require('mini.indentscope').gen_animation.none(),
      },
    }

    -- Simple and easy statusline
    local statusline = require 'mini.statusline'

    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- Customize section to show line and column
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
