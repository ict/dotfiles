" vim: foldenable foldlevel=0 foldmethod=marker

" {{{ INITIALIZATION

" clear all
autocmd!

" where are we?
let s:is_windows = has('win32') || has('win64')

" windows needs some special considerations
if s:is_windows
	set rtp^=~/.vim
endif

" set up vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Load bundles that work everywhere
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mhinz/vim-startify'
Bundle 'mhinz/vim-signify'
Bundle 'Lokaltog/powerline'
Bundle 'godlygeek/tabular'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'merlinrebrovic/focus.vim'
Bundle 'ict/vim-syntax-casm'
Bundle 'altercation/vim-colors-solarized'

if ! s:is_windows
	" Too much work to get those bundles working in win..
	Bundle 'Shougo/vimproc.vim'
	Bundle 'scrooloose/syntastic'
	Bundle 'Valloric/YouCompleteMe'

	"activate powerline
	set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
endif

" turn filetypes on again
filetype plugin indent on
"}}}

" {{{ APPEARANCE-SETTINGS
set title "set the window title
set number relativenumber "use (relative) line numbers
syntax on
set t_Co=256
set bg=light
colorscheme solarized
set cursorline
set matchtime=1 "show matching brackets for .1 seconds
set scrolloff=5 "keep some lines from the bottom
set laststatus=2 "always show statusline"
set splitright "new splits on the right
set nomore "dont prompt for ENTER on long messages
set novisualbell "don't beep, dont blink
set hlsearch "highlight results
set incsearch "set incremental search
set ruler "show cursor line and column in the status line
set showmatch "show matching brackets
set showmode "display mode INSERT/REPLACE/...

" use right mouse button for context-menu instead of selection
" (useful for spell-corrections)
set mousemodel=popup

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

" I hate code folds, so only fold manually and not by default
set foldmethod=marker
set foldenable
set foldlevel=100

" Mouse Support
set mouse=a
"
" Just some fun ;)
if executable("cowsay") && executable("fortune")
	let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '" ". v:val')
endif
" }}}

" {{{ EDITING-RELATED SETTINGS
set autoindent
set smartindent
set nocopyindent

set ignorecase
set smartcase

set hidden 
set autoread
set modeline

" use persistent undo and set where to create all those tmp-files
set undofile
set directory=~/.vim/tmp
set backupdir=~/.vim/backup
set undodir=~/.vim/undo

" format options
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set fileformats=unix,dos
set encoding=utf8
set formatoptions+=n "numbered lists
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too

" always substitute all matches
set gdefault

" Required to be able to use keypad keys and map missed escape sequences
set esckeys
" Time out faster for keycodes, so ESC works quicker
set ttimeout ttimeoutlen=50

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" dont recognize numbers with leading 0s as octal
set nrformats-=octal
"}}}

" {{{ MISC Editor settings

" Complete longest common string, then each full match with menu
set wildmenu
set wildmode=longest,full
set wildignore=.svn,.git,.hg

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
"}}}

" {{{ PLUGIN CONFIG

" Configure Ultisnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
" TODO! Doesnt work in console
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_skiplist = [ 'COMMIT_EDITMSG' ]

let g:focusmode_width = 100

" unite config:

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
nnoremap <silent> [unite]M :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mru buffer file_mru bookmark<cr>
"}}}

" {{{ MAPPINGS
let mapleader = ","

" For vimdiff
if &diff
	nnoremap <SPACE><SPACE> :qa<CR>
endif

"switch off highlighting with _
nnoremap <silent> _ :nohl<CR>

" Use Tab to jump to matching brackets
nnoremap <TAB> %
vnoremap <TAB> %

" Sane moving in screen-lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Copy whole document to X-clipboard
nnoremap <leader>x mxgg"+yG`x

" Paste from X-clipboard
nnoremap <leader>p "+p

" Paste from X and indent properly
nnoremap <leader>pi "+p`[v`]=

" Paste from X in insert-mode
inoremap <F1> <C-R><C-R>+

" Close Buffer faster
nnoremap <F2> :bd<CR>

" No help, thx
" inoremap <F1> <ESC> "remapped: see above!
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Get rid of Ex mode and map a useful command for reflowing text
nnoremap Q gqap

" Make Y behave like C and D
nnoremap Y y$

" Make all Buffers into Tabs
noremap <silent> <leader>t :tab sball<CR>

" Hotkey for NERDTree
nnoremap <silent> <leader>b :NERDTree %:p:h<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" Quickly switch to current dir in this buffer
nnoremap <leader>cd :lcd %:h<CR>

" forgot sudo?
cnoremap w!! :w !sudo tee >/dev/null %<CR>

" Variable Completion a la Eclipse
imap <Nul> <C-n>

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
noremap <silent> <leader>w :set list!<CR>
nnoremap <silent> <leader>W :%s/\s\+$//e<CR>

" Save on leader-s
nnoremap <leader>s :w<CR>

" Indent according to GNU
nnoremap <leader>gnu :call GnuIndent()<CR>

" break undo on newline (and expand abbrevs beforehand)
inoremap <CR> <C-]><C-G>u<CR>

"}}}

" {{{ AUTOCMDS

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Switch to absolute Line-numbers when in insert-mode
autocmd InsertEnter * setl number norelativenumber
autocmd InsertLeave * setl number relativenumber

" smarter :make for java
autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" Wrap text when writing latex
autocmd Filetype tex set tw=100

" Hotkeys for :make and browsing errors
map <F9> :w<Return>:make<Return>:cw<Return><C-W>p
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
map <F12> :cclose<Return>
"}}}

" {{{ GVIM-specific stuff

if has("gui_running")

	" no blinking cursor
	se guicursor+=a:blinkon0

	" no flash and beep
	se vb t_vb=

	" no menubar, no toolbar, no scollbars, just a tabbar if neccessary
	se guioptions=e

	" font
	if has("win32")
		set guifont=Consolas_for_Powerline_FixedD:h10
	else
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
	endif

	" initial window size
	set lines=60 columns=200

endif
"}}}

" {{{ FUNCTIONS
" R.'s GNU-indent style
function! GnuIndent()
	setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
	setlocal shiftwidth=2
	setlocal tabstop=8
endfunction
"}}}
