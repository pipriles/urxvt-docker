set nocompatible

syntax on
set mouse=a
set number
set encoding=utf-8
set incsearch
set ignorecase
set smartcase
set showmatch
set autochdir 
let mapleader=" "

set ttyfast
set lazyredraw

" 2 space identation
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" gvim
set guioptions-=m  " Remove menu bar
set guioptions-=T  " Remove toolbar
set guioptions-=r  " Remove right-hand scroll bar
set guioptions-=L  " Remove left-hand scroll bar

if has('gui_running')
  set guifont=ypn\ envypn\ 11
endif

" Enable True colors
" ==================
" if (has("termguicolors"))
"  set termguicolors
" endif
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <leader>r :NERDTree %<CR>

set splitbelow
set splitright

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'w0ng/vim-hybrid'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Emmet
Plug 'mattn/emmet-vim'

" Status bar
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Async autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete Clang
Plug 'zchee/deoplete-clang'

" Deoplete Python
Plug 'zchee/deoplete-jedi'

" Deoplete Javacript
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'wokalski/autocomplete-flow'

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'jelera/vim-javascript-syntax'

" Better Javascript Autocompletion
Plug '1995eaton/vim-better-javascript-completion'

" Completion
" ?Plug 'sheerun/vim-polyglot' 
Plug 'shawncplus/phpcomplete.vim'

" Misc
Plug 'chrisbra/colorizer'
Plug 'terryma/vim-multiple-cursors'

" Plug 'spolu/dwm.vim'
" Plug 'roman/golden-ratio' Interesante

" Minzinc highlight
Plug 'vale1410/vim-minizinc'

" Ctrl + P
Plug 'ctrlpvim/ctrlp.vim'

" Markdown
Plug 'gabrielelana/vim-markdown'

call plug#end()

" Colorscheme hybrid
" ==================
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <F3> :set hlsearch!<CR>

map <F12> :NERDTreeToggle<CR>
" map <C-S-k><C-b> :NERDTreeToggle<CR>

" Window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search visual selection
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

if has('nvim')
	" Neovim specific commands
	tnoremap <Esc> <C-\><C-n>

    set shell=zsh

	" deoplete
	let g:deoplete#enable_at_startup = 1
	let g:neosnippet#enable_completed_snippet = 1

	let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
	let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"


	" Expand snippets
	imap <C-k> <Plug>(neosnippet_expand_or_jump)
	smap <C-k> <Plug>(neosnippet_expand_or_jump)
	xmap <C-k> <Plug>(neosnippet_expand_target)

endif

set runtimepath^=~/.vim/plugged/ctrlp.vim

