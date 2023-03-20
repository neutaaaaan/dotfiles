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
map <leader>u :UndotreeToggle<CR>
" map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" vim plug
call plug#begin('/usr/local/etc/vim/plugged')

" colorschemes
Plug 'romainl/vim-dichromatic', { 'dir': '/usr/local/etc/vim/plugged/dichromatic' }
Plug 'neutaaaaan/iosvkem'
Plug 'romainl/vim-malotru', { 'dir': '/usr/local/etc/vim/plugged/malotru' }
Plug 'gerw/vim-HiLinkTrace', { 'dir': '/usr/local/etc/vim/plugged/HiLinkTrace' }
Plug 'lifepillar/vim-colortemplate', { 'dir': '/usr/local/etc/vim/plugged/colortemplate' }
Plug 'vim/colorschemes'

" language support
Plug 'editorconfig/editorconfig-vim'
Plug 'Vimjas/vim-python-pep8-indent'

" linting, snippets
" Plug 'dense-analysis/ale'
" Plug 'SirVer/ultisnips'

" REPL integration
Plug 'jpalardy/vim-slime', { 'dir': '/usr/local/etc/vim/plugged/slime' }

" qol
Plug 'tpope/vim-commentary', { 'dir': '/usr/local/etc/vim/plugged/commentary' }
Plug 'tpope/vim-repeat', { 'dir': '/usr/local/etc/vim/plugged/repeat' }
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'tommcdo/vim-lion', { 'dir': '/usr/local/etc/vim/plugged/lion' }

call plug#end()

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "~/.vim/files/.slime_paste"

" undotree
let g:undotree_SplitWidth = 31
let g:undotree_WindowLayout = 2

set laststatus=1                                      " always show statusline
set statusline=                                       " clear statusline
set statusline+=%{&buftype!='terminal'?expand('%:p:h:t').'\/'.expand('%:t'):expand('%')}  " dir\filename.ext
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
	" autocmd ColorScheme quiet hi String ctermfg=4
	" autocmd ColorScheme quiet hi Special ctermfg=1
	autocmd ColorScheme quiet hi DiffAdded ctermfg=2
	autocmd ColorScheme quiet hi DiffRemoved ctermfg=1
	autocmd ColorScheme quiet hi helpHyperTextJump ctermfg=5 cterm=underline

	autocmd Colorscheme sorbet hi Normal ctermbg=16
	autocmd Colorscheme sorbet hi Folded ctermbg=16
	autocmd Colorscheme sorbet hi WildMenu ctermbg=16
augroup END

set background=dark
colorscheme sorbet
