local jdtls = require 'jdtls'

local home = os.getenv 'HOME'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.local/share/eclipse/' .. project_name

local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'

local function set_jdtls_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set('n', '<leader>oi', jdtls.organize_imports, opts)
  vim.keymap.set('n', '<leader>ev', jdtls.extract_variable, opts)
  vim.keymap.set('n', '<leader>ec', jdtls.extract_constant, opts)
  vim.keymap.set('v', '<leader>em', [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]], opts)
end

local config = {
  cmd = {
    '/usr/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    jdtls_path .. '/config_linux',
    '-data',
    workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      import = {
        -- Enables importing from workspace dependencies (Maven/Gradle)
        enabled = true,
        -- Automatically organizes imports on save
        organizeImports = {
          enabled = true,
        },
      },
      maven = {
        downloadSources = true, -- to help with code navigation & completion
      },
      -- Enable workspace symbol indexing
      referencesCodeLens = { enabled = true },
      implementationsCodeLens = { enabled = true },
      eclipse = {
        downloadSources = true,
      },
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*',
          'org.springframework.util.StringUtils.*',
          'org.springframework.beans.factory.annotation.Autowired',
        },
      },
    },
  },
  capabilities = require('blink.cmp').get_lsp_capabilities(),

  -- <-- Add this on_attach callback
  on_attach = function(client, bufnr)
    set_jdtls_keymaps(bufnr)
  end,

  init_options = {
    bundles = {
      vim.fn.glob(home .. '/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'),
    },
  },
}

jdtls.start_or_attach(config)

require('jdtls').setup_dap {
  hotcodereplace = 'auto',
}
