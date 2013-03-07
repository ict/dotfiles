" clear all
autocmd!

if has("win32")
	set rtp^=~/.vim
endif

" set up vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles here
Bundle 'honza/snipmate-snippets'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-easymotion'


filetype plugin indent on

let mapleader = "\\"

" appearance
set nu
set bg=dark
syntax on
set t_Co=256
colorscheme wombat256
set cursorline
set matchtime=1 "show matching brackets for .1 seconds
set scrolloff=5"
set laststatus=2 "always show statusline"

" Statusline
set statusline=%F " Filename and path
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, " File encoding
set statusline+=%{&ff}] " File format
set statusline+=\ %y " Filetype
set statusline+=\ %m " Modified flag
set statusline+=\ %r " Read only flag
set statusline+=%= " Left/right separator
set statusline+=\ %c, " Cursor column
set statusline+=\ %l/%L " Cursor line/total lines
set statusline+=\ %P " Percent through file

" I hate code folds
se nofoldenable

" Mouse Support
set mouse=a

set autoindent
set smartindent
set nocopyindent

set ignorecase
set smartcase

set title
set nohidden " close buffers when window/tab closes"

" format options
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set fileformats=unix,dos
set encoding=utf8

" don't beep, dont blink
set visualbell t_vb=

" select case-insensitive search (but be sensitive when there are uppercase
" words
set smartcase

" highlight results
set hlsearch
"but switch off highlighting with _
nnoremap <silent> _ :nohl<CR>

"set incremental search
set incsearch

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
set wildmenu
set wildmode=longest,full
set wildignore=.svn,.git

if has("unix")
	" setup spelling but dont use it normally
	setlocal spell spelllang=de_20
	se nospell
endif

" What characters are displayed (with <Leader>-w)
"set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set listchars=eol:¬,tab:•·,trail:·
"Highlight special characters in yellow:
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

set switchbuf=usetab,newtab



" Configure Ultisnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" TODO! Doesnt work in console
let g:UltiSnipsListSnippets="<c-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" ==== MAPPINGS ====

" Make Y behave like C and D
nnoremap Y y$

" Make whitespace visible
noremap <leader>w :set list!<CR>

" Make all Buffers into Tabs
noremap <leader>t :tab sball<CR>

" Hotkey for NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" forgot sudo?
nnoremap <leader>W :w !sudo tee >/dev/null %<CR>

" Variable Completion a la Eclipse
imap <Nul> <C-n>

" Toggle Paste
noremap <leader>p :set paste! paste?<CR>

" Tab mappings
nnoremap <C-T> :tabnew<CR>
nnoremap <C-W> :tabclose<CR>

" Window Mappings
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-=> <C-W>=

" Use normal-mode arrow-keys for change- and jumplist
nnoremap <UP> <C-O>
nnoremap <DOWN> <C-I>
nnoremap <LEFT> g;
nnoremap <RIGHT> g,

" Quicker ESC
inoremap jj <ESC>

" ==== AUTOCMDS ====

" Open NERDTree when launched without Arguments
autocmd vimenter * if !argc() | NERDTree | endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") | 
\   exe "normal g`\"" | 
\ endif 

" For vimdiff
if &diff
	nnoremap <SPACE><SPACE> :qa<CR>
endif

" GVIM-stuff

if has("gui_running")

	" no blinking cursor
	se guicursor+=a:blinkon0

	" no flash and beep
	se vb t_vb=

	" no menubar, no toolbar, no scollbars, just a tabbar if neccessary
	se guioptions=e

	if has("win32")
		set guifont=Ubuntu_Mono:h12:cANSI
	else
		set guifont=Ubuntu\ Mono\ 11
	endif

	" initial window size
	set lines=60 columns=200

endif
