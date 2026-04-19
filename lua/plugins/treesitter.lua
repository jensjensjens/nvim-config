return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- new main branch does not support lazy loading
  build = ":TSUpdate",
  config = function()
    -- Register custom powershell parser
    local parsers = require("nvim-treesitter.parsers")
    parsers.powershell = {
      install_info = {
        url = "~/code/other/tree-sitter-powershell",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "ps1",
    }

    -- Enable treesitter highlighting + folds + auto-install on FileType
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match

        -- Auto-install missing parsers
        local installed = require("nvim-treesitter.config").get_installed()
        if lang and not vim.list_contains(installed, lang) then
          require("nvim-treesitter.install").install({ lang })
        end

        -- Enable highlighting (pcall in case parser isn't available yet)
        pcall(vim.treesitter.start)

        -- Enable treesitter-based folding per buffer
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt_local.foldlevel = 3
      end,
    })
  end,
}
