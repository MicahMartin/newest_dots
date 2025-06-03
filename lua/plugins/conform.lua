local M = { "stevearc/conform.nvim" }

M.event = { "BufNewfile", "BufReadPre" }
M.cmd = { "ConformInfo" }
function M.config()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettierd" },
    },
    format_on_save = {
      async = false,
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })
end

return M
