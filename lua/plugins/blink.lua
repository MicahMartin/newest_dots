return {
  "saghen/blink.cmp",
  branch = "main",
  build = "cargo build --release",
  dependencies = { "rafamadriz/friendly-snippets" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = { preset = "enter" },
    signature = {
      enabled = true,
      trigger = {
        show_on_accept = true,
        show_on_accept_on_trigger_character = true,
      },
      window = {
        treesitter_highlighting = false,
        show_documentation = false,
      },
    },
    completion = {
      list = { selection = { auto_insert = false } },
      menu = {
        winblend = 15,
        scrollbar = false,
        draw = {
          columns = { { "label" }, { "kind" } },
        },
      },
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
