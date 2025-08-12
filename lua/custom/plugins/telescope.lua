return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require 'telescope'
    telescope.setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
          width = 0.9,
          height = 0.8,
          preview_cutoff = 120,
        },
        sorting_strategy = 'ascending',
        winblend = 0,
        border = true,
        file_ignore_patterns = { 'node_modules', '.git/', 'dist', 'build' },
      },
      extensions = {
        ['ui-select'] = require('telescope.themes').get_dropdown(),
      },
    }

    -- Load extensions
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    -- Keymaps
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>f', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 15,
        previewer = true,
        prompt_title = 'Buffer Search',
        results_title = false,
        layout_config = {
          width = 0.6,
          height = 0.4,
        },
        prompt_prefix = '🔍 ',
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
