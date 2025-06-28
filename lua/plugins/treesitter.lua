return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    { "OXY2DEV/markview.nvim", lazy = false, dependencies = { "saghen/blink.cmp" } },
  },
  config = function()
    local filetypes = {
      "cpp",
      "lua",
      "go",
      "python",
      "css",
      "javascr*",
      "typescr*",
      "markdown",
      "markdown_inline",
      "html",
      "yaml",
      "typst",
      "latex",
      "sql",
      "bash",
      "http",
      "xml",
      "json",
      "cmake",
      "diff",
      "norg",
      "scss",
      "svelte",
      "vue",
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- form some guy on reddit
      end,
    })
    require("nvim-treesitter").install(filetypes)
  end,
}
