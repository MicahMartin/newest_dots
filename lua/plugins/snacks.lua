return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.words.Config
  opts = {
    indent = {
      enabled = true,
      char = "▏",
      scope = { enabled = false },
      chunk = { enabled = true, char = { vertial = "▏" } },
    },
    input = { enabled = true, icon = "❯" },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          enabled = true,
          auto_close = true,
          replace_netrw = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<c-x>"] = { "bufdelete", mode = { "i", "n" } },
            ["<c-c>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
  },
  init = function()
    vim.g.snacks_animate = false
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        --- #ff0000 NOTE: MORE SNACKS KEYMAPS FOR TOGGLES ARE HERE
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end,
    })
  end,

  keys = {
    --- TELESCOPE STYLE PICKERS
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep Picker",
    },
    {
      "<leader>n",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Picker",
    },
    {
      "<leader>b",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffer Picker",
    },
    {
      "<leader>m",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks Picker",
    },
    --- LSP PICKERS
    {
      "<leader>as",
      function()
        Snacks.picker.lsp_symbols({
          tree = true,
          filter = {
            default = true,
            markdown = true,
            help = true,
          },
        })
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>aS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    --- GITHUB
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Launch Lazygit",
    },
    --- UTILITY
    {
      "-",
      desc = "File Explorer",
      function()
        local explorer_pickers = Snacks.picker.get({ source = "explorer" })
        if #explorer_pickers == 0 then
          Snacks.picker.explorer()
        elseif explorer_pickers[1]:is_focused() then
          explorer_pickers[1]:close()
        else
          explorer_pickers[1]:focus()
        end
      end,
    },
    {
      "<leader>@",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icon keyboard",
    },
    {
      "<leader>?",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Show hotkeys",
    },
    {
      "<leader>gh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
  },
}

-- {
--   "gd",
--   function()
--     Snacks.picker.lsp_definitions()
--   end,
--   desc = "Goto Definition",
-- },
-- {
--   "gr",
--   function()
--     Snacks.picker.lsp_references()
--   end,
--   nowait = true,
--   desc = "References",
-- },
-- {
--   "gi",
--   function()
--     Snacks.picker.lsp_implementations()
--   end,
--   desc = "Goto Implementation",
-- },
-- {
--   "gt",
--   function()
--     Snacks.picker.lsp_type_definitions()
--   end,
--   desc = "Goto T[y]pe Definition",
-- },
-- {
--   "<leader>df",
--   function()
--     Snacks.picker.qflist()
--   end,
--   desc = "Buffer Quickfix List",
-- },
-- {
--   "<leader>dF",
--   function()
--     Snacks.picker.qflist()
--   end,
--   desc = "Buffer Locationfix List",
-- },
-- {
--   "<leader>dE",
--   function()
--     Snacks.picker.diagnostics()
--   end,
--   desc = "Project Diagnostics",
-- },
-- {
--   "<leader>de",
--   function()
--     Snacks.picker.diagnostics_buffer()
--   end,
--   desc = "Buffer Diagnostics",
-- },
-- {
--   "<leader>dr",
--   function()
--     Snacks.rename.rename_file()
--   end,
--   desc = "Rename File",
-- },
