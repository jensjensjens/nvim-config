local opt = vim.opt
local global = vim.g

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.smartcase = true
opt.ignorecase = true

-- cursorline
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitbelow = true
opt.splitright = true

-- backup and undo
opt.backup = false
opt.undodir = vim.fn.stdpath("config") .. "/undodir"
opt.undofile = true
opt.swapfile = false

-- generic
if vim.loop.os_uname().sysname == "Linux" then
	global.shell = "/usr/bin/zsh"
elseif vim.loop.os_uname().sysname == "Darwin" then
	global.shell = "/bin/zsh"
end
opt.iskeyword:append("-") -- treat dash separated words as a word text object"
opt.autoread = true -- automatically reload files when they change
opt.mouse = "" -- Disable mouse mode
home_dir = os.getenv("HOME")
global.python3_host_prog = home_dir .. "/.config/nvim/nvim-venv/bin/python"

global.loaded_ruby_provider = 0
global.loaded_perl_provider = 0
