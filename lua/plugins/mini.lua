return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("mini.surround").setup({})
    require("mini.pairs").setup({})
  end,
}
