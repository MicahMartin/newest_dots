local M = { "saghen/blink.cmp" }

M.branch = "main"
M.build = "cargo build --release"
M.dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" }
M.lazy = false

function M.config()
  require("luasnip.loaders.from_vscode").lazy_load()
  -- triggerCharacters = { ".", "<", ">", ":", '"', "/", "*" }
  require("blink.cmp").setup({
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "rust" },
    keymap = {
      preset = "none",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<C-x>"] = { "show_signature", "hide_signature", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_accept = true,
      },
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
        scrolloff = 1,
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
      documentation = { auto_show = true, auto_show_delay_ms = 350, window = { scrollbar = false } },
    },
  })
end

return M
