set nocompatible

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
Plug 'scrooloose/syntastic'

" Lint
Plug 'scrooloose/syntastic'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'

" Others
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()
" The caveat is that you should *never* use PlugUpgrade
delc PlugUpgrade

color seoul256
"color molokai
"colorscheme Tomorrow-Night-Eighties

" Basic
set number
let mapleader=','
