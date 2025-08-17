return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      ';f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    -- format_on_save = function(bufnr)
    --   -- Disable "format_on_save lsp_fallback" for languages that don't
    --   -- have a well standardized coding style. You can add additional
    --   -- languages here or re-enable it for the disabled ones.
    --   local disable_filetypes = { c = true, cpp = true }
    --   if disable_filetypes[vim.bo[bufnr].filetype] then
    --     return nil
    --   else
    --     return {
    --       timeout_ms = 500,
    --       lsp_format = 'fallback',
    --     }
    --   end
    -- end,
    --
    -- ✅ Register formatters per filetype
    formatters_by_ft = {
      lua = { 'stylua' },
      svelte = { { 'prettierd', 'prettier', stop_after_first = true } },
      astro = { { 'prettierd', 'prettier', stop_after_first = true } },
      javascript = { { 'prettierd', 'prettier', stop_after_first = true } },
      typescript = { { 'prettierd', 'prettier', stop_after_first = true } },
      javascriptreact = { { 'prettierd', 'prettier', stop_after_first = true } },
      typescriptreact = { { 'prettierd', 'prettier', stop_after_first = true } },
      json = { { 'prettierd', 'prettier', stop_after_first = true } },
      graphql = { { 'prettierd', 'prettier', stop_after_first = true } },
      java = { 'google-java-format' },
      kotlin = { 'ktlint' },
      ruby = { 'standardrb' },
      markdown = { { 'prettierd', 'prettier', stop_after_first = true } },
      erb = { 'htmlbeautifier' },
      html = { 'htmlbeautifier' },
      bash = { 'beautysh' },
      proto = { 'buf' },
      rust = { 'rustfmt' },
      yaml = { 'yamlfix' },
      toml = { 'taplo' },
      css = { { 'prettierd', 'prettier', stop_after_first = true } },
      scss = { { 'prettierd', 'prettier', stop_after_first = true } },
      sh = { 'shellcheck' },
      go = { 'gofmt' },
      xml = { 'xmllint' },
    },
    -- ✅ Define custom formatter
    formatters = {
      google_java_format = {
        command = 'google-java-format',
        args = { '-' },
        stdin = true,
      },
    },
  },
}
