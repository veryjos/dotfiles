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
    Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

    Plug 'tpope/vim-obsession'
  endif
call plug#end()

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" configure vim-lsc for some langs
let g:lsc_server_commands = {}
let g:lsc_server_commands['rust'] = 'rls'

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
  map <C-d> :LSClientGoToDefinition<CR>
  map <C-u> :LSClientFindReferences<CR>
  map <C-c> :LSClientFindCodeActions<CR>
endif

map <M-H> :vsplit<CR>
map <M-V> :split<CR>

map <M-t> :tabnew<CR>
map <M-w> :tabclose<CR>
map <M-q> :tabp<CR>
map <M-e> :tabn<CR>

set splitbelow
set splitright

let g:netrw_banner = 0
let g:netrw_liststyle = 3

map s <Plug>(easymotion-bd-f)
map S <Plug>(easymotion-overwin-f)

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

nnoremap <silent> <backspace> <C-o>
nnoremap <silent> <F7> <C-i>

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight VertSplit ctermbg=none ctermfg=green
highlight Split ctermbg=none ctermfg=green
highlight TabLineFill ctermbg=none
highlight TabLine ctermbg=none

set hidden

let g:LanguageClient_serverCommands = {
  \ 'rust': ['/usr/bin/rustup', 'run', 'nightly', 'rls'],
  \ }

if exists("ide_mode")
  map <C-c> :call LanguageClient_contextMenu()<CR>
  map <C-s> :call LanguageClient#textDocument_hover()<CR>
  map <C-d> :call LanguageClient#textDocument_definition()<CR>
endif

:nnoremap <BS> <C-o>
:nnoremap <F13> <C-i>

" netrw mapping overrides
" should rebind sort eventually
function! NetrwMapping()
  nunmap <silent> <buffer> s
  nunmap <silent> <buffer> S
endfunction

function! PrintRegister(id)
  echo(@id)
endfunction

set sessionoptions-=buffers

autocmd filetype netrw call NetrwMapping()
