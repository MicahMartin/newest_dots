local M = { "saghen/blink.cmp" }

M.branch = "main"
M.build = "cargo build --release"
M.dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" }
M.lazy = false

function M.config()
  require("blink.cmp").setup({
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "rust" },
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-n>"] = { "show_signature", "hide_signature", "fallback" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
    },
    signature = {
      enabled = true,
      window = {
        show_documentation = false,
      },
      trigger = {
        enabled = true,
        show_on_insert = true,
      },
    },
    completion = {
      ghost_text = { enabled = true },
      menu = {
        scrollbar = false,
        scrolloff = 1,
        draw = {
          padding = { 0, 1 }, -- padding only on right side
          columns = { { "label" }, { "kind_icon", "kind", gap = 1 } },
          treesitter = { "lsp" },
        },
      },
      list = { selection = { auto_insert = false } },
      documentation = { auto_show = true, auto_show_delay_ms = 350, window = { scrollbar = false } },
    },
  })
end

return M
