local mason_call, mason = pcall(require, "mason")
local mason_lspconfig_call, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_null_ls_call, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_call or not mason_lspconfig_call or not mason_null_ls_call then
	return
end

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
