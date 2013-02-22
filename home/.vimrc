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


filetype plugin indent on

" appearance
set nu
se bg=dark
syntax on
set t_Co=256
colorscheme wombat256
set cursorline

let mapleader = "\\"

" I hate code folds
se nofoldenable

" forgot sudo?
cmap w!! w !sudo tee >/dev/null %

" Variable Completion a la Eclipse
imap <Nul> <C-n>
" Mouse Support
set mouse=a

set smartindent
set nocopyindent
set linebreak
set smartcase
set title
set hidden

" format options
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set fileformats=unix,dos
set encoding=utf8

" don't beep, dont blink
set visualbell t_vb=

set nocompatible

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
set wildmode=longest,full

if has("unix")
	" setup spelling but dont use it normally
	setlocal spell spelllang=de_20
	se nospell
endif

" What characters are displayed (with <Leader>-w)
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
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
