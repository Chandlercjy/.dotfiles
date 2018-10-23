
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Useful Functions                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 借鉴自SpaceVim，绑定quit到q按键
fu! utils#SmartClose() abort
  "let ignorewin = get(g:,'spacevim_smartcloseignorewin',[])
  "let ignoreft = get(g:, 'spacevim_smartcloseignoreft',[])
  let win_count = winnr('$')
  let num = win_count
  for i in range(1,win_count)
    "if index(ignorewin , bufname(winbufnr(i))) != -1 || index(ignoreft, getbufvar(bufname(winbufnr(i)),'&filetype')) != -1
      "let num = num - 1
    "endif
    if getbufvar(winbufnr(i),'&buftype') ==# 'quickfix'
      let num = num - 1
    endif
  endfor
  if num == 1
  else
    quit
  endif
endf

" 专门显示snip的补全
fu! utils#ulti_complete() abort
    if empty(UltiSnips#SnippetsInCurrentScope(1))
        return ''
    endif
    let word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
    let contain_word = 'stridx(v:val, word_to_complete)>=0'
    let candidates = map(filter(keys(g:current_ulti_dict_info), contain_word),
                   \  "{
                   \      'word': v:val,
                   \      'menu': '[snip] '. g:current_ulti_dict_info[v:val]['description'],
                   \      'dup' : 1,
                   \   }")
    let from_where = col('.') - len(word_to_complete)
    if !empty(candidates)
        call complete(from_where, candidates)
    endif
    return ''
endfu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Toggle Functions                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ComfortableMotionToggle()
    if g:comfortable_motion_is_enabled
        unmap <C-d>
        unmap <C-u>
        unmap <C-f>
        unmap <C-b>
        let g:comfortable_motion_is_enabled = 0
    else
        nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
        nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
        nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
        nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
        let g:comfortable_motion_is_enabled = 1
    endif
endfunction

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        :AsyncRun -raw g++ -x c++ % -o %< && ./%<
    elseif &filetype == 'cpp'
        :AsyncRun -raw g++ -std=c++17 -Wall % -o %< && ./%<
    elseif &filetype == 'typescript'
        :AsyncRun -raw tsc %< && node %:r".js"
    elseif &filetype == 'javascript'
        :AsyncRun -raw node %<
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        :AsyncRun -raw time python %
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "        exec "!go build %<"
        :AsyncRun time go run %
        "exec "!time go run %"
    endif
endfunc


let g:quickfix_is_open = 0
let g:locallist_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

function! LocalListToggle()
    if g:locallist_is_open
        lclose
        let g:locallist_is_open = 0
    else
        lopen
        let g:locallist_is_open = 1
    endif
endfunction
