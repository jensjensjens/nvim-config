return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function(opts)
    local treesitterConfigs = require("nvim-treesitter.configs")
    local vim = vim
    local opt = vim.opt

    opt.foldmethod = "expr"
    opt.foldlevel = 3
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    treesitterConfigs.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      sync_install = true,
      auto_install = true,
    })
    local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    treesitter_parser_config.powershell = {
      install_info = {
        url = "~/.config/nvim/tsparsers/tree-sitter-powershell",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "ps1",
    }
  end,
}
