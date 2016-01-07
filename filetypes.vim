
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

