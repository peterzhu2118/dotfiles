set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'gryf/wombat256grf'
Plug 'preservim/nerdcommenter'

call plug#end()

filetype on
filetype plugin on
filetype indent on
set nocompatible
let skip_defaults_vim=1
set viminfo=
set synmaxcol=300
set ttyfast
set lazyredraw
set termguicolors
set rnu

syntax on

set autoindent " Auto-indent
set expandtab " Expand tabs to spaces
set tabstop=2
set shiftwidth=2
set number " Line numbers on
set backspace=indent,eol,start " Backspace over everything
set isk+=$,@,%,# " these aren't word dividers
set showcmd " show current command in status bar
set hidden " Allow hidden buffers
set laststatus=2
set ttimeoutlen=0 timeoutlen=1000

set mouse=

set showmode " Show modeline in status

set hlsearch
set ignorecase
set smartcase
set incsearch

set encoding=utf-8
set fileencoding=utf-8

set tags+=.git/tags

augroup CShenanigans
  au!
  autocmd BufRead,BufNewFile *.c,*.h
        \ set filetype=c |
        \ set tabstop=8 shiftwidth=4 smarttab expandtab |
augroup END

" Create dirs on save
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" nerdcommenter
let g:NERDDefaultAlign = "left"

let mapleader="\<Space>"

" Window switching shortcuts
map <C-h> <C-w>h
map <C-l> <C-w>l

nnoremap <CR> :noh<CR><CR>
nnoremap <leader>n <ESC>:NERDTreeToggle<cr>

" Use fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>p :Ag<CR>

" Close buffer
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" ctags
noremap <leader>rt :!ctags --tag-relative=yes --extras=+f -Rf.git/tags --languages=-javascript,sql .<cr><cr>

" remap jumping paragraphs
noremap ; {
noremap ' }

" swap up and down
noremap j k
noremap k j

" nerdcommenter
imap <C-_> <C-o><leader>ci
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <leader>ci

" highlight trailing whitespace as red
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

