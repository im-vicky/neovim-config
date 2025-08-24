return {
  'NMAC427/guess-indent.nvim',
  event = 'BufReadPre',
  opts = {
    filetype_exclude = { 'java' },
    default_indent = {
      tabstop = 2,
      shiftwidth = 2,
      expandtab = true,
    },
  },
  config = function(_, opts)
    require('guess-indent').setup(opts)

    -- Manually set Java indentation
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
      end,
    })
  end,
}
