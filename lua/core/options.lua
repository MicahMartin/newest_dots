-- Wanted by plugins
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/venv/bin/python")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
-- TEXT STUFF --
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.foldlevel = 2
vim.o.foldmethod = "expr"
vim.o.wrap = true
vim.opt.fillchars = { eob = " " }
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = "a"
vim.o.cursorline = true
-- UI --
vim.o.confirm = true
vim.opt.number = true
vim.o.winborder = "none"
vim.opt.winblend = 15
vim.opt.pumblend = 15
vim.o.signcolumn = "yes"
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.showmode = false
vim.o.statusline = "💾%<%f %h%w%m%r%=%-14.(%l,%c%V%) %P"
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.scrolloff = 10

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
  virtual_text = { current_line = true }, -- Specify Enable virtual text for diagnostics
  underline = true,
  update_in_insert = false, -- Keep diagnostics active in insert mode
})
