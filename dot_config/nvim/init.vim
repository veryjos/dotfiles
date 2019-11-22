call plug#begin()
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-vinegar'
  Plug 'christoomey/vim-tmux-navigator'

  Plug 'dhruvasagar/vim-zoom'
  Plug 'vim-airline/vim-airline'
  Plug 'chriskempson/base16-vim'

  Plug 'sonph/onehalf', {'rtp': 'vim/'}

  if exists("ide_mode")
    Plug 'natebosch/vim-lsc'

    Plug 'dart-lang/dart-vim-plugin'

    Plug 'tpope/vim-obsession'
  endif
call plug#end()

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

:set number relativenumber
:set nu rnu

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

if exists("ide_mode")
  map <M-Z> <Plug>(zoom-toggle)<CR>
  map <S-q> :LSClientWorkspaceSymbol<CR>
endif

map <M-H> :vsplit<CR>
map <M-V> :split<CR>

map <M-t> :tabnew<CR>
map <M-w> :tabclose<CR>
map <M-q> :tabp<CR>
map <M-e> :tabn<CR>

map <C-d> :LSClientGoToDefinition<CR>
map <C-u> :LSClientFindReferences<CR>
map <C-c> :LSClientFindCodeActions<CR>

set splitbelow
set splitright

let g:netrw_banner = 0
let g:netrw_liststyle = 3

map s <Plug>(easymotion-bd-f)
map S <Plug>(easymotion-overwin-f)

" Use all the defaults (recommended):
let g:lsc_auto_map = v:true

" Apply the defaults with a few overrides:
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" Setting a value to a blank string leaves that command unmapped:
let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" ... or set only the commands you want mapped without defaults.
" Complete default mappings are:
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}

set shell=/usr/bin/fish\ -i

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --files .', 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

map <S-tab> :FZF<CR>
map <S-c> :Commands<CR>
map <S-w> :Windows<CR>

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight VertSplit ctermbg=none ctermfg=green
highlight Split ctermbg=none ctermfg=green
highlight TabLineFill ctermbg=none
highlight TabLine ctermbg=none

