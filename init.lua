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

  change_detection = { enabled = true },
})

-- Load the core modules --
require("core.options")
require("core.keymaps")
require("core.statusline")

-- Load the neovide overrides --
require("gui.neovide")

vim.opt.showtabline = 0
