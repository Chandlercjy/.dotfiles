function! InstallCocPlugin()
    :CocInstall coc-python
                \ coc-tsserver
                \ coc-java
                \ coc-yaml
                \ coc-ultisnips
                \ coc-yank
                \ coc-pairs
                \ coc-emmet
                \ coc-html
                \ coc-css
                \ coc-json
                \ coc-vimlsp
                \ coc-imselect
endf

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> <S-TAB> :call <SID>show_documentation()<CR>

" " Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent cal CocActionAsync('highlight')

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" To make <cr> select the first completion item and confirm completion when no item have selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-Tab>'


" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> <A-y>  :<C-u>CocList -A --normal yank<cr>
" use <tab> for trigger completion and navigate to the next complete item

