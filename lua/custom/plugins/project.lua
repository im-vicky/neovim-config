return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      detection_methods = { 'lsp', 'pattern' },
      patterns = { '.git', 'gradlew', 'mvnw', 'Makefile', 'package.json' },
    }
    require('telescope').load_extension 'projects'
  end,
}
