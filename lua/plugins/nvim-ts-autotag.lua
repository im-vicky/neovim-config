return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup {
      opts = {
        enable_close = true,  -- auto-close tags
        enable_rename = true, -- auto-rename paired tags
        enable_close_on_slash = true -- auto-close on typing </
      },
    }

    -- Filetypes where autotag should work
    vim.g.autotag_filetypes = {
      "html", "xml",
      "javascript", "javascriptreact",
      "typescript", "typescriptreact",
      "svelte", "vue", "tsx", "jsx",
      "rescript", "eruby", "php",
      "markdown", "astro",
    }
  end,
}

