local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Language server plugins
	use 'williamboman/nvim-lsp-installer'
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'neoclide/coc.nvim',
    branch = 'release'
  }

  --  Git plugins
  use 'f-person/git-blame.nvim'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use { 'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  --  Airline plugins
  use 'nvim-lualine/lualine.nvim'

  -- Editor layout
  use 'christoomey/vim-tmux-navigator'
  use 'dominikduda/vim_current_word'
  use { 'junegunn/fzf',
    run = ":call fzf#install()"
  }
  use 'junegunn/fzf.vim'
  use { 'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use 'ryanoasis/vim-devicons'
  use { 'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  use 'xolox/vim-misc'

  -- Colorschemes
  use 'NLKNguyen/papercolor-theme'
  use 'ajh17/Spacegray.vim'
  use 'jnurmine/Zenburn'
  use 'morhetz/gruvbox'
  use 'projekt0n/github-nvim-theme'
  use 'Mofiqul/vscode.nvim'
  use 'dikiaap/minimalist'
  use 'Mofiqul/dracula.nvim'
  use 'titanzero/zephyrium'
  use 'glepnir/zephyr-nvim'
  use 'rebelot/kanagawa.nvim'
  use 'savq/melange'
  use { 'rmehri01/onenord.nvim',
    branch = 'main'
  }

  -- Syntax highlighting
  use 'dense-analysis/ale'
  use 'tbastos/vim-lua'
  use 'neoclide/jsonc.vim'
  use 'elzr/vim-json'
  use 'SirJson/fzf-gitignore'
  use 'tpope/vim-git'
  use 'ekalinin/Dockerfile.vim'
  use 'chrisbra/csv.vim'
  use 'pboettch/vim-cmake-syntax'
  use 'godlygeek/tabular' -- must be before markdown
  use 'preservim/vim-markdown'
  use 'rhysd/vim-github-support'
  use 'hashivim/vim-terraform'
  use 'neovim/nvim-lspconfig'
  use 'carlsmedstad/vim-bicep'

  -- Formatters
  use 'gpanders/editorconfig.nvim'
  use 'forevernull/vim-json-format'
  use 'mhartington/formatter.nvim'
  -- use 'sbdchd/neoformat'

  -- Others
  use 'Yggdroot/indentLine' -- Show indent lines to keep track of indentation
  use 'pedrohdz/vim-yaml-folds'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-repeat'
  -- use 'github/copilot.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
