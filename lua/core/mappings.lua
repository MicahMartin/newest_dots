local utils = require("core.utils")
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>X", ":qa<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>x", ":%bd!<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>w", "<C-w>")

vim.api.nvim_create_user_command("Vr", function()
  utils.prompt_resize("vertical")
end, { nargs = "?" })

vim.api.nvim_create_user_command("Hr", function()
  utils.prompt_resize("horizontal")
end, { nargs = "?" })

-- GENERAL FILE CONTROL --
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<leader>fc", "<cmd>%y+<CR>", { desc = "general copy whole file" })
vim.keymap.set("n", "<leader>0", function(args)
  local conform = require("conform")
  -- local lint = require("lint")

  vim.notify("formatting & linting")
  require("conform").format({ async = true })
  -- require("lint").try_lint()
end, { desc = "Format & Lint" })

---------- LSP Keymaps -------------

-- TODO: CHANGE THIS FUK
vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.code_action()
end, { desc = "{USER}Perform code action" })

vim.keymap.set("n", "gh", function()
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", { uri = vim.uri_from_bufnr(0) }, function(err, result)
    if result then
      vim.cmd("edit " .. vim.uri_to_fname(result))
    else
      vim.notify_once("No match or error")
    end
  end)
end, { desc = "Go to header" })

vim.keymap.set("n", "gR", function()
  vim.lsp.buf.rename()
end, { desc = "Global Rename" })

vim.keymap.set("n", "<C-b>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Signature help" })

---------- DAP Keymaps -------------

-- dap forward
vim.keymap.set("n", "<leader>as", function()
  -- local widgets = require("dap.ui.widgets")
  -- local my_sidebar = widgets.sidebar(widgets.frames)
  -- my_sidebar.open()
end, { desc = "Signature help" })
