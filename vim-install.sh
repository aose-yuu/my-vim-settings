#!/bin/bash

cat <<EOF > .vimrc
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/fern.vim'
Plug 'Yggdroot/indentLine'
Plug 'cohama/lexima.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

" set termguicolors
set encoding=utf-8
set number
set laststatus=2
syntax on
colorscheme onedark

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

set tabstop=4
set expandtab
set shiftwidth=4
set smartindent

if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif

" Leader
let mapleader = "\<Space>"

" ESC
inoremap <silent> jj <ESC>

" Save
nnoremap <Leader>w :w<CR>

" End
nnoremap <Leader>q :q<CR>

"PageDown
nnoremap <Leader>j <PageDown>

"PageUp
nnoremap <Leader>k <PageUp>

nnoremap <nowait> <Leader>h ^
nnoremap <nowait> <Leader>l $

" change window
noremap <Leader><Leader> <C-w>w

" split window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

" Fern SETTINGS
nnoremap <silent><C-n> :Fern . -reveal=%<CR>
let g:fern#default_hidden=1

" colorscheme onedark SETTINGS"
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" lightline SETTINGS
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }
EOF

mv .vimrc ~/.vimrc
