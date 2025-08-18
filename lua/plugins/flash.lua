return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  enabled = true,
  opts = {
    modes = {
      -- Disable single-char mode if you prefer word jumps
      char = { enabled = false },
      search = {
        enabled = true,
        -- Smart jump highlights the closest matches
        incremental = true,
      },
      -- Optional: tree-sitter aware motions
      treesitter = { enabled = true },
    },
    search = {
      -- highlight matches while searching
      highlight = {
        backdrop = true, -- dims non-matching text
        matches = true,
      },
      multi_window = false, -- don't jump across windows by default
    },
    label = {
      before = true, -- show label before match
      after = false, -- don't show after match
      style = 'inline', -- inline labels, subtle
    },
    jump = {
      -- Highlight cursor line briefly after jump
      pos = 'start', -- place cursor at start of match
      wait = 50, -- ms for animation effect
    },
  },
  keys = {
    -- Jump forward by word (like f)
    {
      'f',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = { mode = 'search' },
          label = { before = true, after = false, style = 'inline' },
          highlight = { backdrop = true, matches = true },
        }
      end,
      desc = 'Flash Jump Forward',
    },
    -- Jump backward by word (like F)
    {
      'F',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = { mode = 'search', forward = false },
          label = { before = true, after = false, style = 'inline' },
          highlight = { backdrop = true, matches = true },
        }
      end,
      desc = 'Flash Jump Backward',
    },
  },
}
