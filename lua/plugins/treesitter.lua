return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local filetypes = {
      "cpp",
      "lua",
      "go",
      "python",
      "html",
      "css",
      "javascript*",
      "typescript*",
      "markdown",
      "markdown_inline",
      "yaml",
      "bash",
      "http",
      "xml",
      "json",
      "cmake",
      "diff",
      "latex",
      "norg",
      "scss",
      "svelte",
      "typst",
      "vue",
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
    require("nvim-treesitter").install(filetypes)
  end,
}
