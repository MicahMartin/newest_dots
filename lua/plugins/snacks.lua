-- a A collection of QoL plugins for Neovim
local Plugin = { "folke/snacks.nvim" }

Plugin.lazy = false
Plugin.priority = 1000

function Plugin.config()
  vim.g.snacks_animate = false
  Plugin.setKeys()
  require("snacks").setup(Plugin.opts)
end

function Plugin.setKeys()
  vim.keymap.set("n", "<C-n>", "<cmd>lua Snacks.explorer()<cr>", { desc = "File explorer" })
  -- Fuzzy finders
  -- docs: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  vim.keymap.set("n", "<C-d>", "<cmd>lua Snacks.picker.smart()<cr>", { desc = "Smart Find Files" })
  vim.keymap.set("n", "<C-f>", "<cmd>lua Snacks.picker.grep()<cr>", { desc = "Project search" })
  vim.keymap.set("n", "<C-e>", '<cmd>lua Snacks.picker("recent")<cr>', { desc = "Search file history" })

  vim.keymap.set(
    { "n", "x" },
    "<leader>/",
    "<cmd>lua Snacks.picker.grep_word()<cr>",
    { desc = "Search selection search" }
  )
  vim.keymap.set("n", "<leader>?", "<cmd>lua Snacks.picker.keymaps()<cr>", { desc = "Search keymaps" })
  vim.keymap.set("n", "<leader>x", "<cmd>lua Snacks.bufdelete()<cr>", { desc = "Close buffer" })
  vim.keymap.set("n", "<leader>X", "<cmd>lua Snacks.bufdelete.all()<cr>", { desc = "Close all buffers" })

  vim.keymap.set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", { desc = "LSP Definitions" })
  vim.keymap.set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>", { desc = "LSP Declaration" })
  vim.keymap.set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<cr>", { desc = "LSP References" })
  vim.keymap.set("n", "gI", "<cmd>lua Snacks.picker.lsp_implementations()<cr>", { desc = "LSP Implementation" })
  vim.keymap.set("n", "gy", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", { desc = "LSP Type def" })
  vim.keymap.set("n", "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", { desc = "LSP Symbols" })
  vim.keymap.set(
    "n",
    "<leader>sS",
    "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>",
    { desc = "LSP Workspace Symbols" }
  )

  vim.keymap.set("n", "<C-g>", "<cmd>lua Snacks.lazygit()<cr>", { desc = "Lazygit" })
  vim.keymap.set("n", "<leader>gl", "<cmd>lua Snacks.lazygit.log()<cr>", { desc = "Lazygit log" })
end

Plugin.inputConf = {
  enabled = true,
  icon = "❯",
}

Plugin.indentConf = {
  enabled = true,
  char = "▏",
  scope = { enabled = false },
  -- only_scope = true,
  chunk = { enabled = true, char = { vertial = "▏" } },
}

Plugin.explorerConf = {
  enabled = true,
  replace_netrw = true,
}

Plugin.teleLayout = {
  reverse = true, -- set to false for search bar to be on top
  layout = {
    box = "horizontal",
    backdrop = false,
    width = 0.8,
    height = 0.9,
    border = "none",
    {
      box = "vertical",
      { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
      {
        win = "input",
        height = 1,
        border = "rounded",
        title = "{title} {live} {flags}",
        title_pos = "center",
      },
    },
    {
      win = "preview",
      title = "{preview:Preview}",
      width = 0.50,
      border = "rounded",
      title_pos = "center",
    },
  },
}

Plugin.pickerConf = {
  enabled = true,
  matchers = { frecency = true, cwd_bonus = false },
  formatters = {
    file = {
      filename_first = false,
      filename_only = false,
      icon_width = 2,
    },
  },
  layout = {
    -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
    preset = "telescope", -- defaults to this layout unless overidden
    cycle = false,
  },

  layouts = {
    select = {
      preview = false,
      layout = {
        backdrop = false,
        width = 0.6,
        min_width = 80,
        height = 0.4,
        min_height = 10,
        box = "vertical",
        border = "rounded",
        title = "{title}",
        title_pos = "center",
        { win = "input",   height = 1,          border = "bottom" },
        { win = "list",    border = "none" },
        { win = "preview", title = "{preview}", width = 0.6,      height = 0.4, border = "top" },
      },
    },
    telescope = {
      reverse = false, -- set to false for search bar to be on top
      layout = {
        box = "horizontal",
        backdrop = false,
        width = 0.8,
        height = 0.9,
        border = "none",
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
          },
          { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
        },
        {
          win = "preview",
          title = "{preview:Preview}",
          width = 0.50,
          border = "rounded",
          title_pos = "center",
        },
      },
    },
    ivy = {
      layout = {
        box = "vertical",
        backdrop = false,
        width = 0,
        height = 0.4,
        position = "bottom",
        border = "top",
        title = " {title} {live} {flags}",
        title_pos = "left",
        { win = "input", height = 1, border = "bottom" },
        {
          box = "horizontal",
          { win = "list",    border = "none" },
          { win = "preview", title = "{preview}", width = 0.5, border = "left" },
        },
      },
    },
  },
}

Plugin.opts = {
  indent = Plugin.indentConf,
  input = Plugin.inputConf,
  explorer = Plugin.explorerConf,
  picker = Plugin.pickerConf,
  notifier = { enabled = true },
  statuscolumn = { enabled = true },
}

return Plugin
