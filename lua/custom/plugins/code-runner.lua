return {
  'CRAG666/code_runner.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('code_runner').setup {
      mode = 'float', -- or 'float', 'toggleterm', 'term'
      float = {
        border = 'rounded', -- optional: "single", "double", "rounded", "none"
        height = 0.5, -- relative height (60% of screen)
        width = 0.6, -- relative width (80% of screen)
      },
      startinsert = true,
      focus = true,
      filetype = {
        java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
        python = 'python3 -u',
        cpp = 'cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt',
        lua = 'lua',
        javascript = 'node',
      },
    }

    vim.keymap.set('n', ';r', ':RunCode<CR>', { desc = 'Run Code' })
  end,
}
