-- Note: mini.nvim is a collection of lua modules.
-- each module is basically a standalone plugin.
-- you can read their documentation on github:
-- https://github.com/echasnovski/mini.nvim

local M = { "echasnovski/mini.nvim" }

M.lazy = false

-- M.dependencies = {
--   {'rafamadriz/friendly-snippets'},
--   {
--     'JoosepAlviste/nvim-ts-context-commentstring',
--     opts = {
--       enable_autocmd = false,
--     },
--     init = function()
--       vim.g.skip_ts_context_commentstring_module = true
--     end,
--   }
-- }

function M.config()
  require("mini.surround").setup({})
  require("mini.pairs").setup({})

  -- require("mini.ai").setup({ n_lines = 500 })
  -- require("mini.statusline").setup({})
  -- require("mini.move").setup({})
  -- require("mini.operators").setup({})
  -- require("mini.splitjoin").setup({})
  -- require("mini.icons").setup({ style = "glyph" })
end

return M
-- return {}
