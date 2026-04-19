-----------------------------------------
-- Entry point for loading all modules --
-----------------------------------------
-- [[ Leader ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Lazy ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
  },

  change_detection = { enabled = false },
})

-- Load the core modules --
require("filetype")
require("core.options")
require("core.keymaps")
require("core.lsp")
require('vim._core.ui2').enable({})

vim.opt.showtabline = 0
vim.opt.colorcolumn = "80"
vim.cmd("colorscheme vscode")
vim.cmd("highlight LineNr term=bold cterm=bold ctermfg=2 guifg=White")

vim.opt.guicursor = {
  'n-v-c:block-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100',
  'i-ci:ver25-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100',
  'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100'
}
