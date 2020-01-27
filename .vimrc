set nocompatible
set number
set relativenumber
set smarttab
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch
set incsearch
set ignorecase
set title
set noshowmode
set clipboard=unnamed
set backspace=indent,eol,start
set hidden
set completeopt-=preview
set ttimeoutlen=10
set showcmd
set laststatus=2
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set lazyredraw
set encoding=utf-8
" Set gui font
set guifont=Fira\ Code:h13
let mapleader= "," "set leader to ,

" Clear search by pressing ,/
nmap <silent> ,/ :noh<CR>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree',
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'archseer/colibri.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'othree/html5.vim'

call plug#end()

" Syntax highlighting
syntax on
filetype on
filetype plugin on

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=light
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one

" set transparent background
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE
hi NonText ctermbg=NONE
"
" Recognize javascript filetypes correctly
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx

" --------------------------
" Prettier specific settings
" --------------------------

let g:prettier#quickfix_enabled = 0
let g:prettier#autoFormat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
"autocmd BufWritePre,TextChanged *.js,*.json,*.css,*.scss,*.less,*.qraphql PrettierAsync

" number of spaces per identation level
let g:prettier#config#tab_width = 4

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" ---------------------
" Ale specific settings
" ---------------------

let g:ale_linters = {
\   'javascript': ['eslint'],
\		'typescript': ['tslint']
\}

" --------------------
" Airline settings
" -------------------

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_skip_empty_sections = 1
let g:airline_theme='monochrome'
let g:airline_detect_spell=1
"let g:airline_powerline_fonts = 1

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" -----------------------
" CtrlP specific settings
" -----------------------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'DS_Store\|git'
let g:ctrlp_root_markers = ['package.json', '.gitignore']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Disallow arrow keys for navigation in insert mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Don't jump to next row when navigating wrapped lines
nnoremap j gj
nnoremap k gk

" -------------------------
" Signify specific settings
" -------------------------

let g:signify_realtime = 1


" ------------------------
" Emmet settings
" -----------------------

let g:jsx_ext_required = 1
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript.jsx EmmetInstall
autocmd FileType html,css,javascript.jsx imap <buffer> <expr> <s-tab> emmet#expandAbbrIntelligent("\<s-tab>")

" -----------------------
" Tern_For_Vim settings
" -----------------------

let g:tern_show_loc_after_rename = 0
let g:tern_show_signature_in_pum = 1


" -----------------------
" YCM Setting
" -----------------------

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_use_ultisnips_completer = 0
let g:ycm_key_list_previous_completion=['<Up>']

" Always show the signs column
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

" Vim Markdown Configuration
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['typescript=javascript']
let g:vim_markdown_frontmatter = 1
set conceallevel=2 " conceals __bold__ to bold

" Nerdtree
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-b> :NERDTreeToggle<CR>
"
" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
