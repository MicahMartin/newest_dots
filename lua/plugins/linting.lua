return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },

  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = { "selene" },
      cpp = { "cpplint" },
      python = { "ruff" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      -- html = { "eslint_d" },
      -- json = { "eslint_d" },
      -- yaml = { "eslint_d" },
      -- markdown = { "eslint_d" },
      -- graphql = { "eslint_d" },
    }
  end,
}
