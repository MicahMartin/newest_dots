local Plugin = { "saghen/blink.cmp" }

Plugin.version = "1.*"
Plugin.dependencies = { "neovim/nvim-lspconfig" }

local function enabledFn()
  return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
end

local function textFn(ctx)
  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
  return kind_icon
end

local function highlightFn(ctx)
  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
  return hl
end

local function transformFn(_, items)
  return vim.tbl_filter(function(item)
    return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
  end, items)
end

local o = {
  signature = { enabled = true },
  -- enabled = enabledFn,
  cmdline = { enabled = false },
  keymap = { preset = "enter" },
  appearance = {
    nerd_font_variant = "normal",
  },
  completion = {
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        components = {
          kind_icon = { text = textFn, highlight = highlightFn },
          kind = { highlight = highlightFn },
        },
        columns = {
          { "kind_icon" },
          { "label",    "label_description", gap = 1 },
        },
      },
    },
    keyword = { range = "full" },
    accept = { auto_brackets = { enabled = true } },
    list = { selection = { preselect = false, auto_insert = true } },
    documentation = { auto_show = true, auto_show_delay_ms = 400 },
    ghost_text = { enabled = true },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    -- providers = {
    -- 	lsp = {
    -- 		name = "LSP",
    -- 		module = "blink.cmp.sources.lsp",
    -- 		transform_items = transformFn,
    -- 	},
    -- 	path = { opts = {
    -- 		get_cwd = function(_)
    -- 			return vim.fn.getcwd()
    -- 		end,
    -- 	} },
    -- },
  },
  fuzzy = { implementation = "prefer_rust" },
}

local b = {
  keymap = { preset = "enter" },
  completion = { documentation = { auto_show = true } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
}

function Plugin.config()
  require("blink.cmp").setup(o)
end

return Plugin
