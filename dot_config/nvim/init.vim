call plug#begin()
  Plug 'christoomey/vim-tmux-navigator'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
call plug#end()

syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

:set relativenumber
:set rnu

nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-h> <c-w>h
nnoremap <A-l> <c-w>l

map <C-S-h> :splith<CR>
map <C-S-v> :split<CR>

set splitbelow
set splitright

map <S-tab> :FZF<CR>

:imap jk <Esc>
:imap kj <Esc>

set shell=/bin/bash\ -i
