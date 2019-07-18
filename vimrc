
syntax on
filetype plugin indent on
filetype plugin on

set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/

" terminal 256
let g:solarized_termcolors=256
set t_Co=256
set bg=dark
if (has("gui_running"))
    "colorscheme desert
    "colorscheme molokai 
    colorscheme solarized
else
    "colorscheme desert256
    "colorscheme molokai 
    colorscheme solarized
endif

""
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"" Regular
set nu
set incsearch
set hlsearch
set vb
set sw=4
set ts=4
set et
set ai
set si
set ic

" status line
set laststatus=2

function! CurDir()
    let curdir = substitute( getcwd(),'/home/bruce.li',"~/","g")
    return curdir
endfunction

set statusline=
set statusline+=%-3.3n\                         " Buffer
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'},    " File type
set statusline+=%{&encoding},                   " Encoding
set statusline+=%{&fileformat}]\ \              " Fileformat
"set statusline+=CWD:\ %r%{CurDir()}%h
set statusline+=%=                              " Right align
set statusline+=0x%-8B\                         " Current char
set statusline+=%-14.(%l,%c%V%)\ %<%P           " offset

" mapping
let mapleader=","

map <leader>ls :ls<cr>

" maybe helpful command
" set formatoptions-=r
" set formatoptions-=o
"

" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"
"set enc=utf-8

"
set diffopt=filler,iwhite

"set nocompatible
"filetype plugin on
"runtime ~/.vim/bundle/vim-matchit/plugin/matchit.vim
