--TODO: Open current file git history
local utils = require("core.utils")
----- TEXT CONTROL ------
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
----- UI CONTROL ------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- prev buff
vim.api.nvim_set_keymap("n", "<bs>", "<C-^>zz", { silent = true, noremap = true })
-- reset dap
vim.keymap.set("n", "<leader>a0", function()
  require("dapui").open({ reset = true })
end, { desc = "fuckin dap" })
-- GENERAL FILE CONTROL --
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

vim.keymap.set("n", "<leader>ff", function(args)
  local conform = require("conform")
  vim.notify("formatting & linting")
  require("conform").format({ async = true })
end, { desc = "Format & Lint" })

vim.keymap.set("n", "<leader>fc", "<cmd>%y+<CR>", { desc = "general copy whole file" })
vim.keymap.set("n", "<leader>X", ":qa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
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

vim.keymap.set("n", "<C-d>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Signature help" })
---------- DAP Keymaps -------------
vim.keymap.set("n", "<leader>as", function()
  require("dap").continue()
end, { desc = "Dap resume" })

vim.keymap.set("n", "<C-q>", function()
  require("dap").continue()
end, { desc = "dap continue" })
vim.keymap.set("n", "<leader>aa", function()
  require("dap").step_over()
end, { desc = "Dap step over" })
vim.keymap.set({ "n", "v" }, "<leader>aw", function()
  require("dapui").elements.watches.add(vim.fn.expand("<cword>"))
end)

vim.keymap.set("n", "<C-,>", function()
  require("dap").step_into()
end, { desc = "Dap step into" })

vim.keymap.set("n", "<leader>ab", function()
  require("dap").step_back()
end, { desc = "Dap step back" })

vim.keymap.set("n", "<leader>ag", function()
  require("dap").run_to_cursor()
end, { desc = "Dap go until breakpoint" })

vim.keymap.set("n", "<leader>ar", function()
  require("dap").restart_frame()
end, { desc = "Dap restart" })

vim.keymap.set("n", "<leader>ao", function()
  require("dap").repl.open()
end, { desc = "Dap open repl" })

-- vim.keymap.set("n", "<leader>al", function()
--   require("dap").()
-- end, { desc = "Dap run last" })

vim.keymap.set({ "n", "v" }, "<leader>ah", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<leader>ap", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<leader>aR", function()
  require("dap").restart()
end, { desc = "Dap restart" })

vim.keymap.set("n", "<leader>aQ", function()
  require("dap").terminate()
end, { desc = "Dap quit" })

vim.api.nvim_set_keymap("n", "<leader>faa", ":!./bro.sh all<CR>", { desc = "all config & build" })
vim.api.nvim_set_keymap("n", "<leader>fac", ":!./bro.sh -c all<CR>", { desc = "all config" })
vim.api.nvim_set_keymap("n", "<leader>fab", ":!./bro.sh -b all<CR>", { desc = "all build" })

vim.api.nvim_set_keymap("n", "<leader>fsa", ":!./bro.sh standalone<CR>", { desc = "standalone config & build" })
vim.api.nvim_set_keymap("n", "<leader>fsc", ":!./bro.sh -c standalone<CR>", { desc = "standalone config" })
vim.api.nvim_set_keymap("n", "<leader>fsb", ":!./bro.sh -b standalone<CR>", { desc = "standalone build" })

vim.api.nvim_set_keymap("n", "<leader>fda", ":!./bro.sh test<CR>", { desc = "test config & build" })
vim.api.nvim_set_keymap("n", "<leader>fdc", ":!./bro.sh -c test<CR>", { desc = "test config" })
vim.api.nvim_set_keymap("n", "<leader>fdb", ":!./bro.sh -b test<CR>", { desc = "test build" })
