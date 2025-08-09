return {
  'nvim-pack/nvim-spectre',
  keys = {
    -- 🔍 Project-wide search and replace
    {
      '<leader>sr',
      function()
        require('spectre').open()
      end,
      desc = '[S]earch and [R]eplace (project-wide)',
    },

    -- 📄 Current buffer only
    {
      '<leader>sb',
      function()
        require('spectre').open_file_search { select_word = true }
      end,
      desc = '[S]earch in current [B]uffer',
    },
  },
  opts = {
    open_cmd = 'vnew', -- or "split", "vsplit", etc.
    is_block_ui_break = true, -- less jank UI refresh
  },
}
