local user = {}

local M = { "rebelot/kanagawa.nvim" }

M.lazy = false
M.priority = 1000

function M.config()
	require("kanagawa").setup({
		compile = true,
		commentStyle = { italic = false },
    terminalColors = true, 
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
    theme = "wave",
    -- background = {
    --   dark = "wave",
    --   light = "lotus"
    -- },
		overrides = user.overrideFn,
	})

	vim.cmd([[colorscheme kanagawa]])
end

function user.overrideFn(colors)
	local theme = colors.theme
	local makeDiagnosticColor = function(color)
		local c = require("kanagawa.lib.color")
		return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
	end

	return {
    -- These options, in isolation without blink or snacks or noice is what we want.
		DiagnosticVirtualTextHint = makeDiagnosticColor(colors.theme.diag.hint),
		DiagnosticVirtualTextInfo = makeDiagnosticColor(colors.theme.diag.info),
		DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
		DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

    -- NormalFloat = { bg = "none" },
    -- FloatTitle = { bg = "none" },
    -- FloatBorder = { bg = "none" },

    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    PmenuSbar = { bg = theme.ui.bg_m1 },
    PmenuThumb = { bg = theme.ui.bg_p2 },

		-- BlinkCmpMenu = { fg = colors.theme.ui.shade0, bg = colors.theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
		-- BlinkCmpMenuSelection = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
		-- BlinkCmpScrollBarGutter = { bg = colors.theme.ui.bg_m1 },
		-- BlinkCmpScrollBarThumb = { bg = colors.theme.ui.bg_p2 },

		-- Snacks specific
		SnacksIndent = { fg = theme.ui.bg_p2, nocombine = true },
		SnacksIndentScope = { fg = theme.ui.pmenu.bg, nocombine = true },
		-- SnacksInputIcon = { fg = theme.ui.pmenu.bg },
		-- SnacksInputBorder = { fg = theme.syn.identifier },
		-- SnacksInputTitle = { fg = theme.syn.identifier },

		-- SnacksPickerInputBorder = { fg = theme.syn.constant },
		-- SnacksPickerInputTitle = { fg = theme.syn.constant },
		-- SnacksPickerBoxTitle = { fg = theme.syn.constant },
		-- SnacksPickerSelected = { fg = theme.syn.number },
		-- SnacksPickerToggle = { link = "SnacksProfilerBadgeInfo" },
		-- SnacksPickerPickWinCurrent = { fg = theme.ui.fg, bg = theme.syn.number, bold = true },
		-- SnacksPickerPickWin = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = true },

		-- SnacksNotifierBorderError = { link = "DiagnosticError" },
		-- SnacksNotifierBorderWarn = { link = "DiagnosticWarn" },
		-- SnacksNotifierBorderInfo = { link = "DiagnosticInfo" },
		-- SnacksNotifierBorderDebug = { link = "Debug" },
		-- SnacksNotifierBorderTrace = { link = "Comment" },
		-- SnacksNotifierIconError = { link = "DiagnosticError" },
		-- SnacksNotifierIconWarn = { link = "DiagnosticWarn" },
		-- SnacksNotifierIconInfo = { link = "DiagnosticInfo" },
		-- SnacksNotifierIconDebug = { link = "Debug" },
		-- SnacksNotifierIconTrace = { link = "Comment" },
		-- SnacksNotifierTitleError = { link = "DiagnosticError" },
		-- SnacksNotifierTitleWarn = { link = "DiagnosticWarn" },
		-- SnacksNotifierTitleInfo = { link = "DiagnosticInfo" },
		-- SnacksNotifierTitleDebug = { link = "Debug" },
		-- SnacksNotifierTitleTrace = { link = "Comment" },
		-- SnacksNotifierError = { link = "DiagnosticError" },
		-- SnacksNotifierWarn = { link = "DiagnosticWarn" },
		-- SnacksNotifierInfo = { link = "DiagnosticInfo" },
		-- SnacksNotifierDebug = { link = "Debug" },
		-- SnacksNotifierTrace = { link = "Comment" },
	}
end

return M
