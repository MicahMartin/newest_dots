return {
  "olimorris/codecompanion.nvim",
  opts = {},
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      branch = "master",
    },
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  config = function()
    require("codecompanion").setup({
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    })
  end,
}
