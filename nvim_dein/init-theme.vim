"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ColorScheme Configurations                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! Custom_Theme_Strengthen() " 加强cursorline对比度
        if g:colors_name == "palenight"
            let g:airline_theme='bubblegum'
            augroup Strengthen
                autocmd InsertLeave * highlight CursorLine guibg=#2f3843
                autocmd InsertEnter * highlight CursorLine guibg=#2b323b
            augroup END
            highlight Folded guifg=lightblue
        endif
        if g:colors_name == "hybrid_material"
            let g:airline_theme='bubblegum'
        endif
    endfunction
    autocmd ColorScheme * call Custom_Theme_Strengthen()

    colorscheme palenight
    " colorscheme OceanicNext
    " colorscheme hybrid_material
    " colorscheme hybrid_reverse
    " colorscheme one
    " colorscheme ayu
    " colorscheme nord
