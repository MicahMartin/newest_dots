return {
  "stevearc/conform.nvim",
  event = { "BufNewfile", "BufReadPre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      -- python = { "isort", "black" },
      -- rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettierd" },
      sql = { "sqlfluff" },
    },
    format_on_save = {
      async = false,
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
