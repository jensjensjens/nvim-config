local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"bicep",
		"dockerls",
		"jsonls",
		"sumneko_lua",
		"omnisharp",
		"powershell_es",
		"pyright",
		"sqlls",
		"yamlls",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"hadolint", -- dockerfile
		"stylua", -- lua formatter
		"gitlint", -- git commit messages
		"jq", --json formatter
		"markdownlint", -- markdown formatter/linter
		"pylint",
		"black", -- python formatter
		"shfmt", -- shell scritps
		"sql_formatter",
		"editorconfig_checker",
		"yamllint",
	},
	automatic_installation = true,
})
