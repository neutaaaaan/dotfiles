filetype plugin indent on
syntax on
runtime macros/matchit.vim

set autoindent
set backspace=indent,eol,start
set hidden
set hlsearch
set incsearch
set ruler
set wildmenu
set directory=~/.vim/files/swp
set backup
set backupdir=~/.vim/files/bak
set undofile
set undodir=~/.vim/files/undo
set viminfo+=n~/.vim/viminfo
set guifont=dejavu\ sans\ astero\ 16
" set diffopt+=algorithm:patience
set showcmd
set lazyredraw
set showmatch
set splitright
set splitbelow
set nocuc
set cursorline
set cursorlineopt=number
set completeopt=menuone,preview,noinsert,noselect
set mouse=

nnoremap j gj
nnoremap k gk
nnoremap Y y$
" C-U updates undo list
inoremap <C-U> <C-G>u<C-U>
map <leader>p :set paste!<CR>
map <leader>/ :nohlsearch<CR>
map <leader>showtrail /\s\+$<CR>
map <leader>deltrail :%s/\s\+$//e<CR>

" vim plug
call plug#begin('/usr/local/etc/vim/plugged')

" colorschemes
Plug 'lifepillar/vim-gruvbox8', { 'dir': '/usr/local/etc/vim/plugged/gruvbox8' }
Plug 'romainl/Apprentice'
Plug 'neutaaaaan/iosvkem'
Plug 'neutaaaaan/monosvkem'
Plug 'romainl/vim-malotru', { 'dir': '/usr/local/etc/vim/plugged/malotru' }
Plug 'gerw/vim-HiLinkTrace', { 'dir': '/usr/local/etc/vim/plugged/HiLinkTrace' }
Plug 'lifepillar/vim-colortemplate', { 'dir': '/usr/local/etc/vim/plugged/colortemplate' }

" language support
Plug 'editorconfig/editorconfig-vim'
Plug 'Vimjas/vim-python-pep8-indent'

" linting, snippets
" Plug 'dense-analysis/ale'
" Plug 'SirVer/ultisnips'

" REPL integration
Plug 'jpalardy/vim-slime', { 'dir': '/usr/local/etc/vim/plugged/slime' }

" qol
Plug 'tpope/vim-surround', { 'dir': '/usr/local/etc/vim/plugged/surround' }
Plug 'tpope/vim-commentary', { 'dir': '/usr/local/etc/vim/plugged/commentary' }
Plug 'tpope/vim-repeat', { 'dir': '/usr/local/etc/vim/plugged/repeat' }
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'tommcdo/vim-lion', { 'dir': '/usr/local/etc/vim/plugged/lion' }

call plug#end()

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "~/.vim/files/.slime_paste"

set laststatus=1                                      " always show statusline
set statusline=                                       " clear statusline
set statusline+=%{&buftype!='terminal'?expand('%:p:h:t').'\\'.expand('%:t'):expand('%')}  " dir\filename.ext
set statusline+=\ 
set statusline+=%m                                    " modified flag
set statusline+=%r                                    " read only flag
set statusline+=%=                                    " left/right separator
set statusline+=\ [%{strlen(&ft)?(&ft\ .\ \',\'):''}  " filetype
set statusline+=%{strlen(&fenc)?(&fenc\ .\ \',\'):''} " file encoding
set statusline+=%{&ff}]                               " line endings
set statusline+=%5l                                   " current line number
set statusline+=/%L                                   " total lines
set statusline+=%4c                                   " cursor column
set statusline+=\|%-4{strwidth(getline('.'))}         " line length
set statusline+=%<                                    " start to truncate here

augroup cursor_position
	autocmd!
	autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") |
	  \   exe "normal! g`\"" |
	  \ endif
augroup END

augroup automagic_comments
	autocmd!
	autocmd FileType * setlocal formatoptions-=o
augroup END

augroup highlight_override
	autocmd!
	autocmd ColorScheme * hi String ctermfg=4
augroup END

set t_Co=256
set background=light
colorscheme quiet
