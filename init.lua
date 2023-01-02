-----------------------------------------
-- Entry point for loading all modules --
-----------------------------------------

-- Load the plugins --
require("plugins-setup")

-- Load the core modules --
require("core.colorscheme")
require("core.options")
require("core.keymaps")

-- Load the neovide overrides --
require("gui.neovide")

require("plugins.comment")
require("plugins.indent-blankline")
require("plugins.editorconfig")
require("plugins.github-copilot")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.mind")
require("plugins.nvim-cmp")
require("plugins.diffview")
require("plugins.diffview")
require("plugins.treesitter")

require("plugins.lsp.lspsaga")
require("plugins.lsp.mason")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
