local function overrideFn(colors)
  -- local theme = colors.theme
  -- local makeDiagnosticColor = function(color)
  --   local c = require("kanagawa.lib.color")
  --   return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
  -- end

  return {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    FloatTitle = { bg = "none" },

    -- Save an hlgroup with dark background and dimmed foreground
    -- so that you can use it where your still want darker windows.
    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    NormalDark = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m3 },

    -- Popular plugins that open floats will link to NormalFloat by default;
    -- set their background accordingly if you wish to keep them dark and borderless
    LazyNormal = { bg = colors.theme.ui.bg_m3, fg = colors.theme.ui.fg_dim },
    MasonNormal = { bg = colors.theme.ui.bg_m3, fg = colors.theme.ui.fg_dim },

    TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
    TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
    TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
    TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
    TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
    TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
    TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
    Pmenu = { fg = colors.theme.ui.shade0, bg = colors.theme.ui.bg_p1, blend = vim.o.pumblend },  -- add `blend = vim.o.pumblend` to enable transparency
    PmenuSel = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
    PmenuSbar = { bg = colors.theme.ui.bg_m1 },
    PmenuThumb = { bg = colors.theme.ui.bg_p2 },
    -- DiagnosticVirtualTextHint  = makeDiagnosticColor(colors.theme.diag.hint),
    -- DiagnosticVirtualTextInfo  = makeDiagnosticColor(colors.theme.diag.info),
    -- DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
    -- DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
  }
end

local Plugins = { 
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('kanagawa').setup({
        compile = true,
        commentStyle = { italic = false },
        -- overrides = overrideFn(colors)
      })

      vim.cmd[[colorscheme kanagawa]]
    end,
  }
}

return Plugins
