" clear all
autocmd!

let s:is_windows = has('win32') || has('win64')

if s:is_windows
	set rtp^=~/.vim
endif

" set up vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles here
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'mhinz/vim-startify'
Bundle 'Lokaltog/powerline'
Bundle 'godlygeek/tabular'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
"activate powerline
if has("unix")
	set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
endif

filetype plugin indent on

let mapleader = "\\"

" appearance
set relativenumber
set bg=dark
syntax on
set t_Co=256
colorscheme wombat256
set cursorline
set matchtime=1 "show matching brackets for .1 seconds
set scrolloff=5"
set laststatus=2 "always show statusline"
set splitright

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
se foldmethod=marker
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
set autoread

" use persistent undo and set where to create all those tmp-files
set undofile
set directory=~/.vim/tmp
set backupdir=~/.vim/backup
set undodir=~/.vim/undo

" format options
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set fileformats=unix,dos
set encoding=utf8

" don't beep, dont blink
set novisualbell

" always substitute all matches
set gdefault

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
" Time out faster for keycodes, so ESC works quicker
set ttimeout ttimeoutlen=50

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

set switchbuf=usetab
"set switchbuf=usetab,newtab



" Configure Ultisnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" TODO! Doesnt work in console
let g:UltiSnipsListSnippets="<c-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" ==== MAPPINGS ====

" Use Tab to jump to matching brackets
nnoremap <TAB> %
vnoremap <TAB> %

" Sane moving in screen-lines
nnoremap j gj
nnoremap k gk

" No help, thx
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Make Y behave like C and D
nnoremap Y y$

" Make all Buffers into Tabs
noremap <leader>t :tab sball<CR>

" Hotkey for NERDTree
nnoremap <leader>b :NERDTree %:p:h
nnoremap <leader>n :NERDTreeToggle<CR>

" forgot sudo?
cnoremap w!! :w !sudo tee >/dev/null %<CR>

" Variable Completion a la Eclipse
imap <Nul> <C-n>

" Toggle Paste
noremap <leader>p :set paste! paste?<CR>

" Tab mappings
nnoremap <C-T> :tabnew<CR>

" Window Mappings
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-=> <C-W>=
nnoremap <leader>o :only<CR>

" Use normal-mode arrow-keys for change- and jumplist
nnoremap <UP> <C-O>
nnoremap <DOWN> <C-I>
nnoremap <LEFT> g;
nnoremap <RIGHT> g,

" Quicker ESC
inoremap jj <ESC>

" Make whitespace visible and easily deleteable
noremap <leader>w :set list!<CR>
nnoremap <leader>W :%s/\s\+$//e<CR>

" Indent pastes properly
nnoremap <leader>pi p`[v`]=

" Save on leader-s
nnoremap <leader>s :w<CR>

" ==== UNITE-Stuff ====

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
" call unite#custom#source('line','matchers','matcher_fuzzy')
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_rec_max_cache_files=5000
let g:unite_prompt='» '
if executable('ag')
	let g:unite_source_grep_command='ag'
	let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
	let g:unite_source_grep_recursive_opt=''
endif
nmap <space> [unite]
nnoremap [unite] <nop>
if s:is_windows
	nnoremap <silent> [unite]<space> :<C-u>Unite -resume -auto-resize -buffer-name=mixed file_rec buffer file_mru bookmark<cr><c-u>
	nnoremap <silent> [unite]f :<C-u>Unite -resume -auto-resize -buffer-name=files file_rec<cr><c-u>
else
	nnoremap <silent> [unite]<space> :<C-u>Unite -resume -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
	nnoremap <silent> [unite]f :<C-u>Unite -resume -auto-resize -buffer-name=files file_rec/async<cr><c-u>
endif
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

" ==== AUTOCMDS ====

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Switch to absolute Line-numbers when in insert-mode
autocmd InsertEnter * setl number norelativenumber
autocmd InsertLeave * setl nonumber relativenumber

autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

map <F9> :w<Return>:make<Return>:copen<Return><C-W>p
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
map <F12> :cclose<Return>

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
		set guifont=Consolas_for_Powerline_FixedD:h10
	else
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
	endif

	" initial window size
	set lines=60 columns=200

endif
