syntax on
filetype on
set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set nocompatible
set encoding=utf-8
set incsearch
set hlsearch
set history=700
set relativenumber
set laststatus=2
set cursorline
set cursorcolumn

set hidden

" save on close
set autowrite

set ruler

set confirm

set visualbell

set background=light
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
let g:airline_theme = 'molokai'

let mapleader = "ç"

" Nerd tree
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapOpenInTab="h"
let g:NERDTreeMapOpenInTabSilent="H"
let g:NERDTreeMapOpenVSplit="k"
let g:NERDTreeMapJumpFirstChild="S"
let g:NERDTreeMapJumpLastChild="T"
let g:NERDTreeMapJumpNextSibling="<C-T>"
let g:NERDTreeMapJumpPrevSibling="<C-S>"
let g:NERDTreeMapChangeRoot="L"
let g:NERDTreeMapRefresh="j"
let g:NERDTreeMapRefreshRoot="J"
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"


" fzf
map <C-p> :Files<CR>
let g:fzf_action = {
                        \ 'ctrl-j': 'tab split',
                        \ 'ctrl-x': 'split',
                        \ 'ctrl-v': 'vsplit' }

