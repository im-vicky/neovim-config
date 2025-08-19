return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-dap.nvim',
    {
      'mason-org/mason.nvim',
      opts = { ensure_installed = { 'java-debug-adapter', 'java-test' } },
    },
    'jay-babu/mason-nvim-dap.nvim',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {},
    }

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        enabled = true,
        element = 'repl',
        icons = {
          pause = '⏸',
          play = '▶️',
          step_into = '↘️',
          step_over = '➡️',
          step_out = '↗️',
          step_back = '↩️',
          run_last = '🔄',
          terminate = '🛑',
        },
      },
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.5 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
          },
          size = 40,
          position = 'left',
        },
        {
          elements = { 'repl', 'console' },
          size = 10,
          position = 'bottom',
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = 'rounded',
        mappings = { close = { 'q', '<Esc>' } },
      },
      render = {
        max_type_length = 60,
        max_value_lines = 20,
      },
    }

    -- Custom colors
    vim.api.nvim_set_hl(0, 'DapUIVariable', { fg = '#A6E3A1' })
    vim.api.nvim_set_hl(0, 'DapUIScope', { fg = '#89B4FA' })
    vim.api.nvim_set_hl(0, 'DapUIBreakpointsPath', { fg = '#F38BA8', bold = true })
    vim.api.nvim_set_hl(0, 'DapUIBreakpointsInfo', { fg = '#F9E2AF' })

    -- Auto open/close DAP UI
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Virtual text inline values
    require('nvim-dap-virtual-text').setup {
      enabled = true,
      commented = true,
    }

    -- Telescope integration
    pcall(function()
      require('telescope').load_extension 'dap'
    end)

    -- Keymaps
    local map = vim.keymap.set
    map('n', '<F5>', dap.continue, { desc = 'DAP Continue' })
    map('n', '<F3>', dap.step_over, { desc = 'DAP Step Over' })
    map('n', '<F2>', dap.step_into, { desc = 'DAP Step Into' })
    map('n', '<F1>', dap.step_out, { desc = 'DAP Step Out' })
    map('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP Toggle Breakpoint' })
    map('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'DAP Set Conditional Breakpoint' })
    map('n', '<leader>lp', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, { desc = 'DAP Set Log Point' })
    map('n', '<leader>dr', dap.repl.open, { desc = 'DAP Open REPL' })
    map('n', '<leader>dl', dap.run_last, { desc = 'DAP Run Last' })
    map('n', '<leader>du', dapui.toggle, { desc = 'DAP UI Toggle' })
    map('n', '<leader>dt', dap.terminate, { desc = 'DAP Terminate' })
    map('n', '<leader>ds', dap.run_to_cursor, { desc = 'DAP Run to cursor' })
    map('n', '<leader>dc', dap.clear_breakpoints, { desc = 'DAP Clear breakpoints' })
  end,
}
