return {
  "nvim-lualine/lualine.nvim",
  ---@type
  opts = {
    options = {
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
      lualine_c = { { "filename", path = 4, shorting_target = 20 } },
      lualine_x = { { "lsp_status", icon = "", ignore_lsp = { "GitHub Copilot" } } },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
