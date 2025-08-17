return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  cmd = 'Neotree',
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
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['<space>'] = 'none',
            ['Y'] = {
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                vim.fn.setreg('+', path, 'c')
              end,
              desc = 'Copy Path to Clipboard',
            },
            ['O'] = {
              function(state)
                require('lazy.util').open(state.tree:get_node().path, { system = true })
              end,
              desc = 'Open with System Application',
            },
            ['P'] = { 'toggle_preview', config = { use_float = false } },
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
      end,
      desc = 'Explorer NeoTree (cwd)',
    },
  },

  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        symbols = {
          unstaged = '󰄱',
          staged = '󰱒',
        },
      },
    },
  },
}
