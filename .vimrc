" syntax on
set mouse=a
set number relativenumber
set encoding=utf-8
set incsearch
set ignorecase
set smartcase
set showmatch
set autochdir 

let mapleader=" "
let maplocalleader = " "

" 2 space identation
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" gvim
set guioptions-=m  " Remove menu bar
set guioptions-=T  " Remove toolbar
set guioptions-=r  " Remove right-hand scroll bar
set guioptions-=L  " Remove left-hand scroll bar

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <leader>r :NERDTree %<CR>

autocmd FileType markdown setlocal nospell

augroup Python
    autocmd!
    autocmd FileType python setlocal tabstop=4 shiftwidth=4
augroup END

augroup WebDevelopment
    autocmd!
    autocmd FileType javascript,typescript,typescriptreact,json,html,htmldjango,css,scss setlocal tabstop=2 shiftwidth=2
    autocmd FileType vue syntax sync fromstart
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
    autocmd BufRead,BufNewFile *.hubl set filetype=htmldjango
augroup END

set splitbelow
set splitright

call plug#begin('~/.vim/plugged')

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colorscheme
" Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Emmet
Plug 'mattn/emmet-vim'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

" Javacript
Plug 'pangloss/vim-javascript'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Svelte
Plug 'evanleck/vim-svelte'
Plug 'codechips/coc-svelte', {'do': 'npm install'}

Plug 'tikhomirov/vim-glsl'

" Ctrl + P
Plug 'ctrlpvim/ctrlp.vim'

" Markdown
Plug 'gabrielelana/vim-markdown'

" GLSL
Plug 'tikhomirov/vim-glsl'
Plug 'Eric-Song-Nop/vim-glslx'

" Copilot
" Plug 'github/copilot.vim'

call plug#end()

" Colorscheme hybrid
" ==================
" set background=dark
" let g:hybrid_custom_term_colors = 1
" colorscheme hybrid

colorscheme gruvbox
" colorscheme dracula

nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <F3> :set hlsearch!<CR>

map <F12> :NERDTreeToggle<CR>

" Window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:coc_node_path = '~/.nvm/versions/node/v14.17.0/bin/node'
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-jedi'
            \ ]

let b:copilot_enabled = 0

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
    tnoremap <Esc> <C-\><C-n>
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

set runtimepath^=~/.vim/plugged/ctrlp.vim

lua << EOF
require'nvim-treesitter.configs'.setup {
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
EOF

