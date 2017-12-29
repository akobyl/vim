set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" use case insensitive search, except when using caps
set ignorecase
set smartcase

" auto reload files
":set autoread

" Allow backspacing over autoindent, linebreaks, start of insert action
set backspace=indent,eol,start

" enable syntax processing
syntax enable

" load filetype specific indent files
filetype indent on

" Make tabs 4 spaces, but can be entered by hitting tab
" http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" auto indent
" set smartindent

" UI changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change color scheme
colorscheme badwolf
" Map F11 to toggle fullscren
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>


" show command in bottom bar
set showcmd

" Display numbers on left side of screen
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Start off with 60 lines, 120 columns
set lines=60 columns=120

" Set column 80 color
set colorcolumn=80

set encoding=utf-8
"set guifont=Consolas
set guifont=Consolas_for_Powerline_FixedD:h9:cANSI
"set guifont=Inconsolata\ for\ Powerline:h11
"set guifont=DejaVu\ for\ Sans\ Mono\ for\ Powerline:h11


" visual autocomplete for command
set wildmenu

" redraw only when necessary (not during macros)
set lazyredraw

" highlight matching {([
set showmatch

" Search changes
set incsearch
set hlsearch

" turn off search highlights with a \<space>
nnoremap <leader><space> :nohlsearch<CR>

" change vim working directory
cd C:\MTD-Dev

" toggle nerdtree
nmap <F2> :NERDTreeToggle<cr>

" map ;; and jk to escape
:imap jk <Esc>

" map oo and OO to insert lines without leaving normal mode
nmap oo o<Esc>k
nmap OO O<Esc>j

" map <C-a> to increment a number, not select all
nunmap <C-a>

" map tab and shift-tab to rotate buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" map <C-k> to delete the current buffer and keeping the window
"map <C-k> bp|bd#<CR>

" Use pathogen
" execute pathogen#infect()


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' " order matching files top->bottom
let g:ctrlp_switch_buffer = 0 " open files in new buffers

let g:ctrlp_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'

" Gundo settings
nnoremap <leader>u :GundoToggle<CR>



" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
set laststatus=2
set t_Co=256
let g:airline_detect_whitespace=0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.branch = ''
let g:airline_symbols.branch = '⭠'
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
  let g:airline_symbols.space = "\ua0"

" create a clock for the status bar
function! AirlineInit()
  let g:airline_section_y = airline#section#create(['%{strftime("%b %d, %Y %H:%M")}'])
  let g:airline_section_z = airline#section#create(['%3p%%', ' %c'])
endfunction
autocmd VimEnter * call AirlineInit()


" vim backup settings
set backupdir=C:\Users\akobyljanec\Documents\vim-backup
set directory=C:\Users\akobyljanec\Documents\vim-backup\swp

" Gvim gui options
set guioptions-=T  " Gvim remove menu toolbar
set guioptions-=r  " gvim remove right scroll
set guioptions-=L  " gvim remove left scroll
set guioptions-=m  " Gvim remove menu bar

" Full screen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
