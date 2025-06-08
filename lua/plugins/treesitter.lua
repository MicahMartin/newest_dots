return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "cpp",
      "lua",
      "python",
      "html",
      "css",
      "javascript",
      "typescript",
      "markdown",
      "markdown_inline",
      "yaml",
      "bash",
      "http",
      "xml",
      "json",
      "cmake",
      "diff",
    })
  end,
}
