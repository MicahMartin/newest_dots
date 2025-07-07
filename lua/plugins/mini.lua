return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("mini.surround").setup({})
    require("mini.pairs").setup({})
    require("mini.ai").setup({
      mappings = {
        around = "a",
        inside = "i",
        outside = "u",
        delete = "d",
        find = "f",
        find_left = "F",
        jump = "j",
        last = "p",
      },
    })
  end,
}
