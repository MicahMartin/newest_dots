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
      ["<CR>"] = { "accept", "fallback" },
    },
    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_accept = true,
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
      },
      window = {
        scrollbar = false,
        direction_priority = { "n", "s" },
        treesitter_highlighting = true,
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
          treesitter = { "lsp" },
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      documentation = { auto_show = false, auto_show_delay_ms = 350, window = { scrollbar = false } },
    },
  })
end

return M
