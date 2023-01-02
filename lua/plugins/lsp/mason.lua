local to_install = {
	"bash-language-server",
	"bicep-lsp",
	"dockerfile-language-server",
	"json-lsp",
	"lua-language-server",
	"omnisharp",
	"powershell-editor-services",
	"pyright",
	"yaml-language-server",
	"hadolint",
	"stylua",
	"gitlint",
	"jq",
	"markdownlint",
	"pylint",
	"black",
	"shfmt",
	"editorconfig-checker",
	"yamllint",
}
local lspconfig_ensure_installed = {
	"bashls",
	"bicep",
	"dockerls",
	"jsonls",
	"sumneko_lua",
	"omnisharp",
	"powershell_es",
	"pyright",
	"yamlls",
}

local null_ls_ensure_installed = {
	"hadolint", -- dockerfile
	"stylua", -- lua formatter
	"gitlint", -- git commit messages
	"jq", --json formatter
	"markdownlint", -- markdown formatter/linter
	"pylint",
	"black", -- python formatter
	"shfmt", -- shell scritps
	"editorconfig_checker",
	"yamllint",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	local packages_to_install = table.concat(to_install, " ")
	local command = "MasonInstall " .. packages_to_install
	print(command)
	vim.cmd(command)
	print("MasonInstallAll done")
end, {})

local mason_call, mason = pcall(require, "mason")
local mason_lspconfig_call, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_null_ls_call, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_call or not mason_lspconfig_call or not mason_null_ls_call then
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = lspconfig_ensure_installed,
	automatic_installation = true,
})
mason_null_ls.setup({
	ensure_installed = null_ls_ensure_installed,
	automatic_installation = true,
})
