return {
  "Weissle/persistent-breakpoints.nvim",
  event = "VeryLazy",
  ft = { "cpp, c", "cxx", "h", "hpp" },
  config = function()
    require("persistent-breakpoints").setup({
      load_breakpoints_event = { "BufReadPost" },
    })
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    -- Save breakpoints to file automatically.
    keymap(
      "n",
      "<leader>ad",
      "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
      vim.tbl_extend("force", opts, { desc = "Toggle breakpoint on/off" })
    )
    keymap(
      "n",
      "<leader>ac",
      "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
      vim.tbl_extend("force", opts, { desc = "Set Conditional breakpoint" })
    )
    keymap("n", "<leader>aL", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
    keymap(
      "n",
      "<leader>av",
      "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>",
      vim.tbl_extend("force", opts, { desc = "Set Log Point" })
    )
  end,
}
