require("core.options")
require("core.mappings")
require("core.autocmds")
require("core.lazy")

local def_capabilites = vim.lsp.protocol.make_client_capabilities()
local base_lsp_conf = {
  textDocument = {
    completion = {
      dynamicRegistration = false,
      completionItem = {
        snippetSupport = true,
        commitCharactersSupport = true,
        deprecatedSupport = true,
        preselectSupport = true,
        tagSupport = {
          valueSet = {
            1, -- Deprecated
          },
        },
        insertReplaceSupport = true,
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
            "sortText",
            "filterText",
            "insertText",
            "textEdit",
            "insertTextFormat",
            "insertTextMode",
          },
        },
        insertTextModeSupport = {
          valueSet = {
            1, -- asIs
            2, -- adjustIndentation
          },
        },
        labelDetailsSupport = true,
      },
      contextSupport = true,
      insertTextMode = 1,
      completionList = {
        itemDefaults = {
          "commitCharacters",
          "editRange",
          "insertTextFormat",
          "insertTextMode",
          "data",
        },
      },
    },
  },
}

local c = vim.tbl_deep_extend("force", def_capabilites, base_lsp_conf)
vim.lsp.config("*", {
  capabiliteies = c,
})

vim.lsp.enable({ "clangd", "lua_ls", "vtsls", "gopls", "tailwindcss", "marksman" })
