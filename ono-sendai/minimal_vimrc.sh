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
inoremap <C-U> <C-G>u<C-U>
map <leader>/ :nohlsearch<CR>
map <leader>p :set paste!<CR>
map <leader>showtrail /\s\+$<CR>
map <leader>deltrail :%s/\s\+$//e<CR>

set t_Co=256
set background=dark

augroup automagic_comments
	autocmd!
	autocmd FileType * setlocal formatoptions-=o
augroup END
augroup highlight_override
	autocmd!
	\" autocmd ColorScheme quiet hi Special ctermfg=1
	\" autocmd ColorScheme quiet hi String ctermfg=4
	autocmd ColorScheme quiet hi DiffAdded ctermfg=2
	autocmd ColorScheme quiet hi DiffRemoved ctermfg=1
	autocmd ColorScheme quiet hi helpHyperTextJump ctermfg=5 cterm=underline

	autocmd Colorscheme sorbet hi Normal ctermbg=16
	autocmd Colorscheme sorbet hi Folded ctermbg=16
	autocmd Colorscheme sorbet hi WildMenu ctermbg=16
augroup END

colorscheme quiet" > "$HOME"/.vimrc
