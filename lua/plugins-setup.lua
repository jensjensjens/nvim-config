-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	use("bluz71/vim-nightfly-guicolors")
	use("Mofiqul/vscode.nvim")
	use("projekt0n/github-nvim-theme")
	use("ajh17/Spacegray.vim")
	use("lourenci/github-colors")
	use("tomasiser/vim-code-dark")
	use("sainnhe/sonokai")

	use({ "phaazon/mind.nvim", branch = "v2.2", requires = { "nvim-lua/plenary.nvim" } })

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	use("numToStr/Comment.nvim") -- commenting with gc

	use("lewis6991/gitsigns.nvim") -- see git sign column
	use("tpope/vim-fugitive")

	use("dominikduda/vim_current_word") -- highlight current word
	use({ "lukas-reineke/indent-blankline.nvim", module = "indent_blankline" }) -- show indent lines

	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim", module = "telescope" })
	use("kdheepak/lazygit.nvim")
	use("ryanoasis/vim-devicons")
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

	use("gpanders/editorconfig.nvim") -- respect editorconfig settings

	use("nvim-lualine/lualine.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("rhysd/vim-github-support")
	use("mtdl9/vim-log-highlighting")

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "debugloop/telescope-undo.nvim", requires = "nvim-telescope/telescope.nvim" })
	use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
