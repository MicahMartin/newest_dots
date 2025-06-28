---@module "modus-themes"
return {
  "miikanissi/modus-themes.nvim",
  priority = 1000,
  config = function()
    require("modus-themes").setup({
      line_nr_column_background = false,
      sign_column_background = false,
      variant = "default",
      style = "auto",
      on_highlights = function(highlight, color)
        highlight.WinSeparator = { fg = color.white }
      end,
    })

    --     WinSeparator = { fg = "#FFA066" },
    vim.cmd([[colorscheme modus]])
  end,
}
-- return {}
