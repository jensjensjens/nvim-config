local opt = vim.opt
local global = vim.g

global.editorconfig = true

-- improve find
opt.path:append("**")
opt.wildmenu = true

-- netrw configuration
global.netrw_banner = 0
global.netrw_winsize = 30
global.netrw_localcopydircmd = "cp -r"
global.netrw_localrmdir = "rm -r"
vim.cmd("hi! link netrwMarkFile Search")

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.list = false
opt.listchars = {
  lead = "·",
  tab = "⇾ ",
  trail = "·",
}

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
opt.scrolloff = 15

-- spellcheck
opt.spelllang = "en_us"
opt.spell = true

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

--split windows
opt.splitbelow = true
opt.splitright = true

-- backup and undo
opt.backup = false
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true
opt.swapfile = false

-- generic
if vim.loop.os_uname().sysname == "Linux" then
  global.shell = "/usr/bin/zsh"
elseif vim.loop.os_uname().sysname == "Darwin" then
  global.shell = "/bin/zsh"
end

opt.autoread = true -- automatically reload files when they change
opt.mouse = "" -- Disable mouse mode
HOME_DIR = os.getenv("HOME")
global.python3_host_prog = HOME_DIR .. "/.config/nvim/nvim-venv/bin/python"

global.loaded_ruby_provider = 0
global.loaded_perl_provider = 0
