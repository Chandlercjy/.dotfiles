
" ===================== vim-which-key ======================
set timeoutlen=500
let g:mapleader = ","

nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
nnoremap <silent> <SPACE> :<c-u>WhichKey '<SPACE>'<CR>
nnoremap <silent> [ :<c-u>WhichKey '['<CR>
nnoremap <silent> ] :<c-u>WhichKey ']'<CR>

vnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <SPACE> :<c-u>WhichKey '<SPACE>'<CR>
vnoremap <silent> [ :<c-u>WhichKey '['<CR>
vnoremap <silent> ] :<c-u>WhichKey ']'<CR>

let g:comma_prefix_dict =  {}
let g:space_prefix_dict =  {}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "             Comma-prefix            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 修复无法多行comment
nmap <Leader>cc <Plug>NERDCommenterToggle
omap <Leader>cc <Plug>NERDCommenterToggle
vmap <Leader>cc <Plug>NERDCommenterToggle

let g:comma_prefix_dict['c'] = {
            \ 'name': '+nerd-comenter && cd',
            \ 'A' : ['<Plug>NERDCommenterAppend', 'NERDComment Append'],
            \ 'c' : ['<Plug>NERDCommenterToggle', 'NERDComment Toggle'],
            \ 'd' : [':cd %:p:h | echo "Change Dir successfully!"', 'Back to current directory'] ,
            \}

" 复制达到剪贴板
nmap <leader>y "+y
vmap <leader>y "+y
let g:comma_prefix_dict.y = "yank to clipboard"


let g:comma_prefix_dict.f = [':ALEFix | wa' , 'ALEFix and save']
let g:comma_prefix_dict.g = [':YcmCompleter GoTo' , 'YCM-GoTo']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "             Space-prefix            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:space_prefix_dict['v'] = {
            \ 'name' : '+Neovim_Config',
            \ 's': [':FZF ~/.config/nvim' , 'Search config'] ,
            \ 'k': [':e ~/.config/nvim/init-keybinding.vim' , 'init-keybinding'] ,
            \ 'i': [':e ~/.config/nvim/init.vim' , 'init'] ,
            \ 'r': [':source $MYVIMRC'    , 'Source vimrc']  ,
            \}


let g:space_prefix_dict['f'] = {
            \ 'name' : '+files' ,
            \ 'f': [':FZF'   , 'FZF']              ,
            \ 's': [':wa|echo "Buffers saved!"'   , 'save all buffers'] ,
            \ 'r': [':Ranger'   , 'Ranger'] ,
            \ }

let g:space_prefix_dict['t'] = {
            \ 'name' : '+Tabs_Toggle' ,
            \ 'n': [':tabnew'                   , 'Tab New']                ,
            \ 't': [':tabnew % | normal gTZZgt' , 'Drag buffer to New Tab'] ,
            \ 'g': [':GitGutterToggle'          , 'GitGutterToggle']        ,
            \ 'u': [':MundoToggle'              , 'MundoToggle']            ,
            \ 'U': [':UndotreeToggle'           , 'UndotreeToggle']         ,
            \ 'm': [':SignatureToggleSigns'     , 'Marks Toggle']           ,
            \ 'a': [':ALEToggle'     , 'ALEToggle']           ,
            \ }

let g:space_prefix_dict['g'] = {
      \ 'name' : '+git/version-control' ,
      \ 'b' : ['Gblame'                 , 'fugitive-blame']             ,
      \ 'c' : ['BCommits'               , 'commits-for-current-buffer'] ,
      \ 'C' : ['Gcommit'                , 'fugitive-commit']            ,
      \ 'd' : ['Gdiff'                  , 'fugitive-diff']              ,
      \ 'e' : ['Gedit'                  , 'fugitive-edit']              ,
      \ 'l' : ['Glog'                   , 'fugitive-log']               ,
      \ 'r' : ['Gread'                  , 'fugitive-read']              ,
      \ 's' : ['Gstatus'                , 'fugitive-status']            ,
      \ 'w' : ['Gwrite'                 , 'fugitive-write']             ,
      \ 'p' : ['Git push'               , 'fugitive-push']              ,
      \ }

let g:space_prefix_dict['s'] = {
      \ 'name' : '+swoop-search' ,
      \ 's' : [':call SwoopMultiSelection()' , 'swoop-multi-selection'] ,
      \ 'b' : [':call SwoopMulti()'          , 'swoop-multi-buffer']    ,
      \ }

let g:space_prefix_dict.a = [':Ag' , 'Ag-search']
let g:space_prefix_dict[':'] = [':OverCommandLine', 'Over-CommandLine']
let g:space_prefix_dict.u = [':MundoToggle' , 'MundoToggle']
let g:space_prefix_dict.b = [':Buffers'     , 'Buffer-list']
let g:space_prefix_dict.h = [':set nohls'   , "clear-search-highlight"] " 去除搜索高亮

let g:space_prefix_dict.1 = [':normal 1gt' , 'Tab 1']
let g:space_prefix_dict.2 = [':normal 2gt' , 'Tab 2']
let g:space_prefix_dict.3 = [':normal 3gt' , 'Tab 3']
let g:space_prefix_dict.4 = [':normal 4gt' , 'Tab 4']
let g:space_prefix_dict.5 = [':normal 5gt' , 'Tab 5']
let g:space_prefix_dict.6 = [':normal 6gt' , 'Tab 6']
let g:space_prefix_dict.7 = [':normal 7gt' , 'Tab 7']
let g:space_prefix_dict.8 = [':normal 8gt' , 'Tab 8']
let g:space_prefix_dict.9 = [':normal 9gt' , 'Tab 9']
let g:space_prefix_dict.0 = [':tablast'    , 'Tab Last']


let g:space_prefix_dict['y'] = {
      \ 'name' : '+YouCompleteMe' ,
      \ 'f' : [':YcmCompleter FixIt'   , 'YCM-FixIt']   ,
      \ 'd' : [':YcmCompleter GetDoc'  , 'YCM-GetDoc']  ,
      \ 't' : [':YcmCompleter GetType' , 'YCM-GetType'] ,
      \ }

let g:space_prefix_dict['p'] = {'name' : '+projects'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "          Parentheses-prefex         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:left_parentheses_prefix_dict = {}
let g:right_parentheses_prefix_dict = {}

let g:left_parentheses_prefix_dict.g  = ['<Plug>GitGutterNextHunk', "GitGutterNextHunk"]
let g:right_parentheses_prefix_dict.g = ['<Plug>GitGutterPrevHunk', "GitGutterPrevHunk"]

" ALE 设置快捷键
let g:left_parentheses_prefix_dict.a  = ['<Plug>(ale_previous)' , "ALE_previous"]
let g:right_parentheses_prefix_dict.a = ['<Plug>(ale_next)'     , "ALE_NEXT"]


" ======================= Which-END ========================
call which_key#register(',', 'g:comma_prefix_dict')
call which_key#register('<SPACE>', 'g:space_prefix_dict')
call which_key#register('[', 'g:left_parentheses_prefix_dict')
call which_key#register(']', 'g:right_parentheses_prefix_dict')


"重命名指令
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))


" 修改全角符号为半角符号
" nmap <leader>f: :%s/：/:/g<CR>
" nmap <leader>f, :%s/，/, /g<CR>
" nmap <leader>f,, :%s/,/, /g<CR> :%s/,  /, /g<CR>
" nmap <leader>f( :%s/（/(/g<CR>
" nmap <leader>f) :%s/）/)/g<CR>
"

" ==============================
" Plugin 快捷键设置
" ==============================
"
" ================== vim-multiple-cursors ===================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" 设置 NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinPos="left"
let NERDTreeIgnore=['\.pyc','\~$','\.swp'] " 忽略一下文件的显示


" Markdown 设置预览,显示隐藏快捷键和加粗快捷键
autocmd FileType markdown nmap <silent> <Space>m <Plug>MarkdownPreview
nmap <Space>c :set conceallevel=0<CR>


" Vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Quickfix & Location list
nnoremap <leader>q :call QuickfixToggle()<cr>
nnoremap <leader>l :call LocalfixToggle()<cr>

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

function! LocalfixToggle()
    if g:locallist_is_open
        lclose
        let g:locallist_is_open = 0
    else
        lopen
        let g:locallist_is_open = 1
    endif
endfunction



" AsyncRun
let g:asyncrun_open = 10
nmap <leader>s :AsyncStop<CR>
let $PYTHONUNBUFFERED=1
let g:asyncrun_save = 2 "non-zero to save current(1) or all(2) modified buffer(s) before executing


"Quickly Run
map <leader>r :call CompileRunGcc()<CR>
map <F5> :w<CR>:!python %<CR>

" Guitter
let g:gitgutter_map_keys = 0




" ======================= UltiSnips ========================
let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger= "<C-p>"

"显示snippets的补全
ino <silent> <c-x><c-a> <c-r>=<sid>utils#ulti_complete()<cr>


"" gutentags 设置
"" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"" 所生成的数据文件的名称
""let g:gutentags_ctags_tagfile = '.tags'

"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

"" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"" 检测 ~/.cache/tags 不存在就新建
"if !isdirectory(s:vim_tags)
   "silent! call mkdir(s:vim_tags, 'p')
"endif


"" 设置Tagbar
"nmap <silent> <F3> :TagbarToggle<CR>
""let g:tagbar_width = 30          "设置tagbar的宽度为30列，默认40
"let g:tagbar_left = 1

" ==============================
" 通用快捷键
" ==============================
" 打开配置文件
nmap <Space>e :FZF ~/.emacs.d<CR>

" FZF搜索文件
nmap <C-p> :FZF ~/Documents/<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "              跳转操作类             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ===================== vim-easymotion =====================
nmap f <Plug>(easymotion-overwin-f)
nmap ? <Plug>(easymotion-Fn)
"nmap <leader>. <Plug>(easymotion-repeat)


"设置smart close，并将宏录制放到Q
nnoremap Q q
nnoremap <silent> q :call utils#SmartClose()<cr>


" ===================== vim-easy-align =====================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <F8> :SSave! default<CR>
nmap <F9> :SLoad default<CR>

" 英文检查
"map <F8> :setlocal spell! spelllang=en_us<CR>
"

" ======================== Vim-move ========================
nmap <A-j> <Plug>MoveLineDown
nmap <A-k> <Plug>MoveLineUp

" ======================== YankRing ========================
nmap <A-y> :YRShow<CR>


" ======================== Neo-term ========================
nmap <A-f> :TREPLSendFile<CR>
nmap <A-r> <Plug>(neoterm-repl-send)
nmap <A-l> <Plug>(neoterm-repl-send-line)

vmap <A-f> :TREPLSendFile<CR>
vmap <A-r> <Plug>(neoterm-repl-send)
vmap <A-l> <Plug>(neoterm-repl-send-line)
