-- execute 'source $CONFIG_DIR/neovide/config.vim'

require("plugins")
if vim.g.neovide then
  vim.cmd([[set guifont=Hack\ Nerd\ Font\ Mono:h12]])  
end

o = vim.o       -- options
bo = vim.bo     -- buffer local settings
wo = vim.wo     -- window local settings
g = vim.g       -- global settings
cmd = vim.cmd   -- execute vim commands

-- Global settings
g.nocompatible = true
g.shell = '/bin/zsh' -- Use zsh as shell
g.mapleader = ','
g.python3_host_prog = "/opt/homebrew/bin/python3"

-- Regular settings
o.background = 'dark'
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.cursorline = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.splitbelow = true
o.splitright = true
o.autoread = true
o.termguicolors = true
o.foldmethod = 'indent'

-- Buffer settings
bo.autoindent = true
bo.smartindent = true
bo.swapfile = false

-- Window settings
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false

cmd([[colorscheme zephyr]])

-- Make line number easier to read
cmd([[hi LineNr guifg=#ffffff]])

-- Autocmd
cmd([[autocmd FileType json syntax match Comment +\/\/.\+$+]])


-- Vim opt settings
vim.opt.path:append '**' -- make find search recursively
vim.opt.mouse = ""       -- Disable mouse mode
vim.opt.clipboard = 'unnamedplus' -- use system clipboard

-- Load custom keybindings
require("key-binding")

-- Load plugin settings to override all other settings
require("plugin-settings")

