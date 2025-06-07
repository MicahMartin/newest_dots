local utils = require("core.utils")
--
-- let &t_SI = "\e[5 q"
-- let &t_SR = "\e[3 q"
-- let &t_EI = "\e[1 q"
--
-- vim.keymap.set("i", "<C-Space>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
-- })
-- vim.g.copilot_no_tab_map = true

vim.api.nvim_create_user_command("Vr", function()
  utils.prompt_resize("vertical")
end, { nargs = "?" })

vim.api.nvim_create_user_command("Hr", function()
  utils.prompt_resize("horizontal")
end, { nargs = "?" })

vim.keymap.set("n", "<C-q>", "<C-d>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-g>", "<Nop>", { noremap = true, silent = true })
-- Unbind in visual mode too
vim.keymap.set("v", "<C-g>", "<Nop>", { noremap = true, silent = true })

-- unbind s and S, we need those for surround
-- vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true })
-- vim.keymap.set("n", "S", "<Nop>", { noremap = true, silent = true })

-- Window nav
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

-- General controls
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
-- Resizes
-- vim.keymap.set("n", "<leader>w.", "<cmd>Hr<cr>", { desc = "Resize horizontal percent" })
-- vim.keymap.set("n", "<leader>w,", "<cmd>Vr<cr>", { desc = "Resize vert percent" })
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--
-- Dont deselect after indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>wu", "<cmd>vertical resize +6 <cr>", { desc = "Quick horizontal increase" })
-- vim.keymap.set("n", "<leader>wU", "<cmd>vertical resize -6 <cr>", { desc = "Quick horizontal decrease " })
-- vim.keymap.set("n", "<leader>wd", "<cmd> resize +6 <cr>", { desc = "Quick vert increase" })
-- vim.keymap.set("n", "<leader>wD", "<cmd> resize -6 <cr>", { desc = "Quick vert decrease" })

-- vim.keymap.set("n", "t", "'", { desc = "Remap of mark jump prefix" })
-- LEADER COMMANDS
-- Quit vim
vim.keymap.set("n", "<leader>X", ":qa<CR>", { noremap = true, silent = true })
-- close all buffers but not vim
vim.keymap.set("n", "<leader>x", ":%bd!<CR>", { noremap = true, silent = true })
-- window controls prefix
vim.keymap.set("n", "<leader>w", "<C-w>")
-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
-- Code action
vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.code_action()
end, { desc = "{USER}Perform code action" })

-- local isLspDiagnosticsVisible = true
-- vim.keymap.set("n", "<leader>lx", function()
-- 	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
-- 	vim.diagnostic.config({
-- 		virtual_text = isLspDiagnosticsVisible,
-- 		underline = isLspDiagnosticsVisible,
-- 	})
-- end, { desc = "Toggle LSP diagnostics" })
-- vim.keymap.set("n", "<leader>p", ":DapViewOpen<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>p", function()
  require("dapui").toggle()
end, { desc = "dap ui toggle" })

vim.keymap.set("n", "<leader>O", ":OverseerToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", function()
  local overseer = require("overseer")
  overseer.run_template({}, function(task)
    if task then
      overseer.open({ enter = true })
    end
  end)
end, { desc = "Overseer commands" })

vim.keymap.set("n", "<leader>F", function(args)
  local conform = require("conform")
  local lint = require("lint")

  vim.notify("formatting & linting")
  require("conform").format({ async = true })
  require("lint").try_lint()
end, { desc = "Format & Lint" })

vim.keymap.set("n", "<leader>fh", function()
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", { uri = vim.uri_from_bufnr(0) }, function(err, result)
    if result then
      vim.cmd("edit " .. vim.uri_to_fname(result))
    else
      vim.notify_once("No match or error")
    end
  end)
end, { desc = "Go to header" })

-- Minimal: <leader>cm shows member names of the class under cursor

vim.keymap.set("n", "<leader>fr", function()
  vim.lsp.buf.rename()
end, { desc = "Global Rename" })

vim.keymap.set("n", "<C-b>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Signature help" })

-- vim.keymap.set("n", "<leader>gR", { desc = "LSP Rename" }, function()
--   vim.lsp.buf.rename()
-- end)
--
-- vim.keymap.set("n", "<leader>gR", { desc = "LSP Rename" }, function()
--   vim.lsp.buf.signature_help()
-- end, vim.tbl_deep_extend("force"))
