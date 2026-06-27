return {
  "duskrose-theme.nvim",
  dir = vim.fn.stdpath("config") .. "/lua/plugins/themes/duskrose",
  name = "duskrose",
  lazy = false,
  priority = 1000,
  config = function()
    require("plugins.themes.duskrose").setup()
  end,
}
