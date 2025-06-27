return {
  "saghen/blink.cmp",
  branch = "main",
  build = "cargo build --release",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  lazy = false,
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("blink.cmp").setup({
      snippets = { preset = "luasnip" },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      keymap = {
        preset = "enter",
      },
      ---@type blink.cmp.SignatureConfig
      signature = {
        enabled = true,
        window = {
          scrollbar = false,
          direction_priority = { "n", "s" },
          treesitter_highlighting = false,
          show_documentation = false,
        },
      },
      completion = {
        ghost_text = { enabled = false },
        menu = {
          scrollbar = false,
          draw = {
            padding = { 0, 1 }, -- padding only on right side
            columns = { { "label" }, { "kind_icon", "kind", gap = 1 } },
          },
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        ---@type blink.cmp.CompletionDocumentationConfig
        documentation = {
          treesitter_highlighting = true,
          auto_show = true,
          auto_show_delay_ms = 350,
          window = { scrollbar = false },
        },
      },
    })
  end,
}
