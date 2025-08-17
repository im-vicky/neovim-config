return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  enabled = true,
  lazy = false,
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = false,
          show_hidden_count = false,
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_current',
        bind_to_cwd = true,
        use_libuv_file_watcher = true,

        commands = {
          trash = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local choice = vim.fn.confirm('Move to Trash?\n' .. path, '&Yes\n&No', 2)
            if choice == 1 then
              vim.fn.system { 'trash', path } -- or "trash-put"
              require('neo-tree.sources.manager').refresh(state.name)
            end
          end,

          confirm_delete = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local choice = vim.fn.confirm('Permanently delete?\n' .. path, '&Yes\n&No', 2)
            if choice == 1 then
              require('neo-tree.sources.filesystem.commands').delete(state)
            end
          end,
        },

        window = {
          mappings = {
            ['f'] = {
              'fuzzy_finder',
              config = { title = 'Filter' },
            },
            ['<esc>'] = 'clear_filter',
            ['d'] = 'trash', -- Safe delete with confirmation
            ['D'] = 'confirm_delete', -- Permanent delete with confirmation
          },
        },
      },
    }
  end,
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {},
}
