local cmp_status, cmp = pcall(require, "cmp")

local luasnip_status, luasnip = pcall(require, "luasnip")

local lspkind_status, lspkind = pcall(require, "lspkind")
local vscode_loaders_status, vscode_loaders = pcall(require, "luasnip/loaders/from_vscode")
if not cmp_status or not luasnip_status or not lspkind_status or not vscode_loaders_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
vscode_loaders.lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 70,
			ellipsis_char = "...",
		}),
	},
})
