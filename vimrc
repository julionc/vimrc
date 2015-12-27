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

" Core-extras
Plug 'cohama/lexima.vim'

" Lint
"Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
Plug 'scrooloose/syntastic'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'

" others
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-xmark', { 'do': 'make' }

if s:darwin
	Plug 'junegunn/vim-xmark'
endif
Plug 'greyblake/vim-preview'

call plug#end()
" the caveat is that you should *never* use plugupgrade
delc PlugUpgrade

color seoul256
"color molokai
"colorscheme Tomorrow-Night-Eighties

" Mappings - Faster scrolling
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

let mapleader=','

" Basic settings
set autoindent
set number

" Syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" filetypes

au BufNewFile,BufRead *.scss.liquid   set ft=scss
au BufNewFile,BufRead *.css.liquid    set ft=css
au BufNewFile,BufRead *.js.liquid     set ft=javascript

au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/sites-*/* set ft=nginx
au BufNewFile,BufRead *.rb,*.rbw,*.gemspec set filetype=ruby

autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec set filetype=ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
			\ formatoptions+=croq softtabstop=4 smartindent
			\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

