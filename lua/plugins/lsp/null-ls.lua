local null_ls_call, null_ls = pcall(require, "null-ls")
local utils_call, utils = pcall(require, "null-ls.utils")

if not null_ls_call or not utils_call then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions -- to setup code actions

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		diagnostics.hadolint, -- dockerfile
		diagnostics.editorconfig_checker,
		diagnostics.yamllint.with({
			root_dir = utils.root_pattern(".yamllint.yaml", ".git"),
		}),
		diagnostics.markdownlint, -- markdown formatter/linter
		diagnostics.pylint.with({
			prefer_local = "venv/bin",
			root_dir = utils.root_pattern(".pylintrc", "pyproject.toml", "setup.py", "requirements.txt", ".git"),
			extra_args = { "--rcfile", "pyproject.toml" },
			env = function(params)
				return { PYTHONPATH = params.root }
			end,
		}),

		formatting.jq, --json formatter
		formatting.stylua, -- lua formatter
		formatting.shfmt, -- shell scritps
		formatting.black.with({
			prefer_local = "venv/bin",
			root_dir = utils.root_pattern(".pylintrc", "pyproject.toml", "setup.py", "requirements.txt", ".git"),
			env = function(params)
				return { PYTHONPATH = params.root }
			end,
			cwd = function(params)
				return vim.fn.fnamemodify(params.bufname, ":h")
			end,
		}),
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
