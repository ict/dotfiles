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

set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

set visualbell t_vb=

map <F5> :w <Enter> :make <Enter>
map! <F5>  <ESC> :w <Enter> :make <Enter>

set nocompatible

" some useful abbreviations to common mistyped commands
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq

" Auto close braces
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" select case-insenitiv search (not default)
set ignorecase

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


" Only do this part when compiled with support for autocommands. 
if has("autocmd") 
  " When editing a file, always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside an event handler 
  " (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
 
endif " has("autocmd")

setlocal spell spelllang=de_20
se nospell

" For latexsuite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Easier tabbing
noremap <F9> :set list!<CR>
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
"Highlight special characters in yellow:
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
