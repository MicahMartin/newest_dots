return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {},
  keys = {
    {
      "<leader>an",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<leader>ao",
      function()
        require("dap").continue()
      end,
      desc = "step over",
    },
    {
      "<leader>ai",
      function()
        require("dap").continue()
      end,
      desc = "step into",
    },
    {
      "<leader>ab",
      function()
        require("dap").continue()
      end,
      desc = "step back",
    },
    {
      "<leader>ag",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to Cursor",
    },
    {
      "<leader>aF",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate dap",
    },
    {
      "<leader>aR",
      function()
        require("dap").restart()
      end,
      desc = "restart dap",
    },
    {
      "<leader>ak",
      function()
        require("dapui").eval(nil, { enter = true })
      end,
      desc = "Dap symbol view",
    },
  },
}
