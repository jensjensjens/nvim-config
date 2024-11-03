return {
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
  dependencies = {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  },
  opts = {
    ensure_installed = {
      "hadolint", -- dockerfile
      "stylua", -- lua formatter
      "gitlint", -- git commit messages
      "goimports", -- go formatter
      "markdownlint", -- markdown formatter/linter
      "pylint", -- python linter
      "black", -- python formatter
      "shfmt", -- shell scritps
      "yamllint",
    },
  },
}
