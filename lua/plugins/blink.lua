return {
  "saghen/blink.cmp",
  branch = "main",
  build = "cargo build --release",
  -- dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  -- require("luasnip.loaders.from_vscode").lazy_load()
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = { preset = "enter" },
    signature = {
      enabled = true,
      trigger = {
        show_on_accept = true,
        show_on_accept_on_trigger_character = true,
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
        treesitter_highlighting = true,
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
  },
}

-- window = {
--   treesitter_highlighting = false,
--   show_documentation = false,
-- },
