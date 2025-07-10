----- GENERAL TEXT CONTROL ------
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("v", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("v", "k", "gk", { noremap = true, silent = true })

-- swap ; and :
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { inoremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("v", ":", ";", { inoremap = true })
-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yy<cmd>normal gcc<CR>p")
-- nnoremap <Leader>c */\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
-- nnoremap <Leader>c #\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
---------- GENERAL FILE CONTROL ----------
-- conform lint
vim.keymap.set("n", "<leader>ff", function()
  local conform = require("conform")
  vim.notify("formatting & linting")
  require("conform").format({ async = true })
end, { desc = "Format & Lint" })
-- copy path
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })
-- copy buffer content
vim.keymap.set("n", "<leader>fc", "<cmd>%y+<CR>", { desc = "general copy buffer" })
-- quit
vim.keymap.set("n", "<leader>X", ":qa<CR>", { noremap = true, silent = true })
-- clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
-- half page down and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
-- half page up and center
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving down half-page" })
-- save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
---------- LSP Keymaps -------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buffOpts = { buffer = args.buf, silent = true, noremap = true }
    -- LSP Code Action
    vim.keymap.set({ "n", "x" }, "<CR>", function()
      vim.lsp.buf.code_action()
    end, buffOpts)
    -- go to source header
    vim.keymap.set("n", "gH", function()
      vim.lsp.buf_request(0, "textDocument/switchSourceHeader", { uri = vim.uri_from_bufnr(0) }, function(e, result)
        if result then
          vim.cmd("edit " .. vim.uri_to_fname(result))
        else
          vim.notify_once("No match or error")
        end
      end)
    end, buffOpts)
    -- unset the default mappings
    -- Copilot accept stuff
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
  end,
})
