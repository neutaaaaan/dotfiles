#!/bin/sh

mkdir -p "$HOME"/.vim/files/swp
mkdir -p "$HOME"/.vim/files/bak
mkdir -p "$HOME"/.vim/files/undo

echo "filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set lazyredraw
set hidden
set wildmenu
set mouse=

set directory=~/.vim/files/swp
set backup
set backupdir=~/.vim/files/bak
set undofile
set undodir=~/.vim/files/undo
set viminfo+=n~/.vim/viminfo

set hlsearch
map <leader>/ :nohlsearch<CR>
map <leader>p :set paste!<CR>
map <leader>showtrail /\s\+$<CR>
map <leader>deltrail :%s/\s\+$//e<CR>

set t_Co=256
set background=dark
augroup highlight_override
	autocmd!
	autocmd ColorScheme * hi String ctermfg=4
augroup END
colorscheme quiet" > "$HOME"/.vimrc
