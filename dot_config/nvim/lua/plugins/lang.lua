return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  
  {
    "python-rope/ropevim",
    ft = "python",
  },
  
  {
    "m-demare/hlargs.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = {
          "css",
          "scss",
          "html",
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "lua",
          "rust",
        },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = false,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
          tailwind = true,
          sass = { enable = true, parsers = { "css" } },
          virtualtext = "■",
        },
      })
    end,
  },
}
