set nocompatible
set viminfo+=!

syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
set encoding=utf-8
set nobomb
set fileformat=unix

set cmdheight=2
set number
set ruler
set showmode
set title

set incsearch
set noignorecase
set smartcase
set hlsearch

"()
set showmatch
set matchpairs=(:),{:},[:],<:>

set wrap

set wildmenu

set backupdir=~/.vim/vimbackup

:noremap <F6> :r!date/T<CR>

set tabstop=2
set shiftwidth=2

function! JISX0208SpaceHilight()
    syntax match JISX0208Space "@" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf

if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<


