local null_ls = require("null-ls")

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		diagnostics.hadolint, -- dockerfile
		formatting.stylua, -- lua formatter
		diagnostics.gitlint, -- git commit messages
		formatting.jq, --json formatter
		diagnostics.markdownlint, -- markdown formatter/linter
		diagnostics.pylint.with({
			prefer_local = "venv/bin",
		}),
		formatting.shfmt, -- shell scritps
		formatting.sql_formatter,
		diagnostics.editorconfig_checker,
		diagnostics.yamllint,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
