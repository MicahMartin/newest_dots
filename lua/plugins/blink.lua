local M = { "saghen/blink.cmp" }

M.version = "1.*"
M.lazy = false

function M.config()
  require("blink.cmp").setup({
    fuzzy = { implementation = "rust" },
    keymap = { preset = 'enter' },
    signature = { enabled = true , window = { show_documentation = false } },
    completion = { 
      ghost_text = { enabled = true },
      menu = { scrollbar = false, scrolloff = 1, draw = { treesitter = { 'lsp'  } } },
      list = { selection = { auto_insert = false } },
      documentation = { auto_show = true, window = { scrollbar = false } },

    }
  })
end

return M
