" clear all
autocmd!

" set up vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles here


filetype plugin indent on

" appearance
set nu
se bg=dark
syntax on
set t_Co=256
colorscheme lucius

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

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

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

" setup spelling but dont use it normally
setlocal spell spelllang=de_20
se nospell

" What characters are displayed (with <Leader>-w)
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
"Highlight special characters in yellow:
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

set switchbuf=usetab,newtab


" ==== MAPPINGS ====

" Auto close braces
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" Make whitespace visible
noremap <leader>w :set list!<CR>

" Make all Buffers into Tabs
noremap <leader>T :tab sball<CR>


" Hotkey for NERDTree
" nnoremap <C-n> :NERDTreeToggle<CR>

" ==== AUTOCMDS ====

" Open NERDTree when launched without Arguments
"autocmd vimenter * if !argc() | NERDTree | endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") | 
\   exe "normal g`\"" | 
\ endif 
