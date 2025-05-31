-- gotta do this for bob nvim
vim.g.python3_host_prog = vim.fn.expand('~/.config/nvim/venv/bin/python')
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- idk pretty sure we need this
vim.g.have_nerd_font = true
vim.opt.termguicolors = true


-- TEXT STUFF --
-- these 4 options should change <tab> to 2 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
-- make <tab> 2 spaces in insert mode
vim.o.expandtab = true
-- treesitter should pick up the indentexpr, but if not
vim.o.smartindent = true
-- set fold level to 1, keep top level open
vim.o.foldlevel = 1
-- set fold method to expression for plugins
vim.o.foldmethod = 'expr'
-- wrap long lines (nasty)
vim.o.wrap = false
-- not sure what these do yet
vim.opt.fillchars = { eob = " " }

-- searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = 'a'

-- UI --
-- %l is number, %s is sign, %C is fold col
-- `%@SignCb@ ... %T`	Define a clickable region that calls SignCb() when clicked
-- define signColumn in statusColumn
-- should get set by plugin
-- vim.o.signcolumn = 'yes'
-- show line numbers in statusColumn
vim.opt.number = true;
-- always show the status line for every window!
vim.o.laststatus = 3
-- tries to put mode into statusline
vim.o.showmode = false
-- just a default status line for testing
vim.o.statusline = "😃%<%f %h%w%m%r%=%-14.(%l,%c%V%) %P"

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 50

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.o.splitright = true
-- vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
-- vim.o.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
-- vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
