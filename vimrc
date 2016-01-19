set nocompatible

let s:darwin = has('mac')
let vim_plug_readme=expand('~/.vim/plugged/vim-plug/README.md')
if !filereadable(vim_plug_readme)
  echo "Installing Vim-plug"
  echo ""
  silent !mkdir -p ~/.vim/{autoload,plugged}
  silent !git clone --depth 1 https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug
  silent !ln -sf ~/.vim/plugged/vim-plug/plug.vim ~/.vim/autoload/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" Core
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'

" Core-extras
Plug 'cohama/lexima.vim'
Plug 'sickill/vim-pasta'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'sickill/vim-monokai'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'

" Ruby
Plug 'tpope/vim-rails', { 'for': 'ruby' }
"Plug 'tpope/vim-endwise', { 'for': 'ruby' } "Seems to be a conflict w/ Lexima
"Plug 'rstacruz/vim-closer' "vim-endwise - Alternative

" Others
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

if s:darwin
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif
Plug 'greyblake/vim-preview'

call plug#end()
" the caveat is that you should *never* use plugupgrade
delc PlugUpgrade

let mapleader=','

" Basic settings
set autoindent
set number
set t_Co=256
"set mouse=a
set ts=2 sts=2 sw=2 expandtab
set laststatus=2

"color seoul256
"colorscheme monokai
colorscheme Tomorrow-Night-Eighties
"colorschem gruvbox

set background=dark

" Mappings - Faster scrolling
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Alias commands
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:NERDTreeWinSize=28
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
map <C-e> :NERDTreeToggle<CR>

"" LightLine
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

"" TagBar
nmap <F8> :TagbarToggle<CR>
map <C-t> :TagbarToggle<CR>
"" autofocus on tagbar open
let g:tagbar_autofocus = 1

"" Filetypes
source ~/.vim/filetypes.vim
