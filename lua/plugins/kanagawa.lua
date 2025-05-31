local user = {}

function user.overrideFn(colors)
  local theme = colors.theme
  local makeDiagnosticColor = function(color)
    local c = require("kanagawa.lib.color")
    return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
  end

  return {
    DiagnosticVirtualTextHint = makeDiagnosticColor(colors.theme.diag.hint),
    DiagnosticVirtualTextInfo = makeDiagnosticColor(colors.theme.diag.info),
    DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
    DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

    -- compare highlight groups
    Pmenu = { fg = colors.theme.ui.shade0, bg = colors.theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
    PmenuSel = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
    PmenuSbar = { bg = colors.theme.ui.bg_m1 },
    PmenuThumb = { bg = colors.theme.ui.bg_p2 },
    -- Snacks specific
    SnacksIndent = { fg = theme.ui.bg_p2, nocombine = true },
    SnacksIndentScope = { fg = theme.ui.pmenu.bg, nocombine = true },
    SnacksInputIcon = { fg = theme.ui.pmenu.bg },
    SnacksInputBorder = { fg = theme.syn.identifier },
    SnacksInputTitle = { fg = theme.syn.identifier },

    SnacksPickerInputBorder = { fg = theme.syn.constant },
    SnacksPickerInputTitle = { fg = theme.syn.constant },
    SnacksPickerBoxTitle = { fg = theme.syn.constant },
    SnacksPickerSelected = { fg = theme.syn.number },
    SnacksPickerToggle = { link = "SnacksProfilerBadgeInfo" },
    SnacksPickerPickWinCurrent = { fg = theme.ui.fg, bg = theme.syn.number, bold = true },
    SnacksPickerPickWin = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = true },

    SnacksNotifierBorderError = { link = "DiagnosticError" },
    SnacksNotifierBorderWarn = { link = "DiagnosticWarn" },
    SnacksNotifierBorderInfo = { link = "DiagnosticInfo" },
    SnacksNotifierBorderDebug = { link = "Debug" },
    SnacksNotifierBorderTrace = { link = "Comment" },
    SnacksNotifierIconError = { link = "DiagnosticError" },
    SnacksNotifierIconWarn = { link = "DiagnosticWarn" },
    SnacksNotifierIconInfo = { link = "DiagnosticInfo" },
    SnacksNotifierIconDebug = { link = "Debug" },
    SnacksNotifierIconTrace = { link = "Comment" },
    SnacksNotifierTitleError = { link = "DiagnosticError" },
    SnacksNotifierTitleWarn = { link = "DiagnosticWarn" },
    SnacksNotifierTitleInfo = { link = "DiagnosticInfo" },
    SnacksNotifierTitleDebug = { link = "Debug" },
    SnacksNotifierTitleTrace = { link = "Comment" },
    SnacksNotifierError = { link = "DiagnosticError" },
    SnacksNotifierWarn = { link = "DiagnosticWarn" },
    SnacksNotifierInfo = { link = "DiagnosticInfo" },
    SnacksNotifierDebug = { link = "Debug" },
    SnacksNotifierTrace = { link = "Comment" },
  }
end

local Plugin = { "rebelot/kanagawa.nvim" }

Plugin.lazy = false
Plugin.priority = 1000
Plugin.terminalColors = true

function Plugin.config()
  require("kanagawa").setup({
    compile = true,
    commentStyle = { italic = false },
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = user.overrideFn,
  })

  vim.cmd([[colorscheme kanagawa]])
end

return Plugin
