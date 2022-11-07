------------------------------- editorconfig -------------------------------
vim.g.EditorConfig_core_mode = 'external_command'
vim.g.EditorConfig_exec_path = '/opt/homebrew/bin/editorconfig'

-------------------------------- Nvim tree ---------------------------------
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup {
  view = {
    adaptive_size = true,
    side = "right",
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  renderer = {
    highlight_opened_files = "all",
    indent_markers = {
      enable = false
    }
  },
  filters = {
    dotfiles = false,
    custom = {
      "^\\.git$"
    }
  }
}
-- We need to override this since it is set to 2 by nvim-tree
vim.o.laststatus = 3

------------------------------- Treesitter ---------------------------------
require'nvim-treesitter.configs'.setup {
highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
		"c_sharp",
		"cmake",
		"dockerfile",
		"gitignore",
		"javascript",
		"hcl",
		"json",
		"lua",
		"make",
		"markdown",
		"python",
		"sql",
		"vim",
		"yaml"
	},
	auto_install = true,
}

--------------------------------  GitSigns ---------------------------------
require('gitsigns').setup()

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--sort-files',
      '--hidden',
      '--line-number',
      '--glob=!{.git,venv,.venv,obj,bin}',
      '--column',
      '--smart-case'
    },
    file_ignore_patterns = {
      '.git/',
      'node_modules/',
      'venv/',
      '.venv/',
      '__pycache__/'
    }
  },
}
vim.g.fzf_buffers_jump = 1

-------------------------------- Diff view ---------------------------------
require("diffview").setup({})

------------------------------- COC server ---------------------------------
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.cmd([[
  let g:coc_global_extensions=[ 'coc-docker', 'coc-powershell', 'coc-markdownlint', 'coc-yaml', 'coc-sh', 'coc-json', 'coc-yank' ]

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  
  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
  if has('unix')
    packloadall
    call ale#linter#Define('bicep', {
    \   'name': 'bicep-ls',
    \   'lsp': 'stdio',
    \   'executable': 'dotnet',
    \   'command': '%e /usr/local/bin/bicep-langserver/Bicep.LangServer.dll',
    \   'project_root': '.'
    \})
  endif
]])

-------------------------------- Formatter ---------------------------------
require("formatter").setup({})
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])

-----.--------------------------- Lualine ----------------------------------
require('lualine').setup {
  options = {
    theme = 'solarized_light'
  }
}

-------------------------------- Tmux vim navigation -----------------------
vim.g.tmux_navigator_no_mappings = 1
