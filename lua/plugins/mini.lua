return {
  'echasnovski/mini.nvim',
  version = false, -- always use latest
  config = function()
    -- 🔹 Textobjects (better a/i motions)
    require('mini.ai').setup { n_lines = 500 }
    require('mini.snippets').setup()

    -- 🔹 Starter screen
    require('mini.starter').setup {
      evaluate_single = true,
      header = '🚀 Welcome back, Vicky!',
    }

    -- 🔹 Statusline
    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
    }
    statusline.section_location = function()
      return ' %2l │  %-2v' -- line/column with icons if nerd font available
    end

    -- 🔹 Autopairs (like windwp/nvim-autopairs but lighter)
    require('mini.pairs').setup()

    -- 🔹 Commenting
    require('mini.comment').setup()

    -- 🔹 Git signs (diff in signcolumn, hunk textobjects)
    require('mini.git').setup()

    -- 🔹 Bufremove (better buffer closing than :bdelete)
    require('mini.bufremove').setup()

    -- Close current buffer (but keep window open)
    vim.keymap.set('n', '<leader>bd', function()
      require('mini.bufremove').delete(0, false) -- 0 = current buffer, false = don’t force
    end, { desc = 'Delete Buffer' })

    -- Force delete (useful if buffer has unsaved changes)
    vim.keymap.set('n', '<leader>bD', function()
      require('mini.bufremove').delete(0, true)
    end, { desc = 'Force Delete Buffer' })

    require('mini.tabline').setup()

    require('mini.trailspace').setup() -- trim trailing spaces
  end,
}
