let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='bubblegum'
let g:airline#extensions#ale#enabled = 1
" add scroll bar
let g:airline_section_c = airline#section#create(['%{noscrollbar#statusline(9,''■'',''◫'',[''◧''],[''◨''])}', ' %{expand("%:t")}', ' Coc-status: %{coc#status()}']) 
