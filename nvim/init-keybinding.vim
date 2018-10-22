
" ===================== vim-which-key ======================
set timeoutlen=500
let g:mapleader = ","
let g:maplocalleader = "\<SPACE>"

nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey  '<SPACE>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKey  '<SPACE>'<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "             Comma-prefix            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:comma_prefix_dict =  {}
let g:comma_prefix_dict['c'] = {
            \ 'name': '+nerd-comenter && cd',
            \ 'd'       : [':cd %:p:h'                 , 'Back to current directory'] ,
            \ 'A'       : ['<Plug>NERDCommenterAppend' , 'NERDComment Append']        ,
            \ '<SPACE>' : ['<Plug>NERDCommenterToggle' , 'NERDComment Toggle']        ,
            \}

" 复制达到剪贴板
nmap <leader>y "+y
vmap <leader>y "+y
let g:comma_prefix_dict.y = "yank to clipboard"
call which_key#register(',', 'g:comma_prefix_dict')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "             Space-prefix            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:space_prefix_dict =  {}
let g:space_prefix_dict['o'] = {
            \ 'name' : '+open',
            \ 'q'    : [ ':copen' , 'open-quickfix']     ,
            \ 'l'    : [ ':lopen' , 'open-locationlist'] ,
            \ }

let g:space_prefix_dict['f'] = {
            \ 'name' : '+files' ,
            \ 'f'    : ['FZF'   , 'FZF']              ,
            \ 's'    : [':wa'   , 'save all buffers'] ,
            \ 'r'    : [':Ranger'   , 'Ranger'] ,
            \ }

let g:space_prefix_dict['t'] = {
            \ 'name' : '+Tabs' ,
            \ 'n'    : [':tabnew'   , 'Tab New'] ,
            \ 't'    : [':tabnew % | normal gTZZgt'   , 'Drag buffer to New Tab'] ,
            \ }

"let g:space_prefix_dict['b'] = {
"            \ 'name' : '+buffers' ,
"            \ 'n'    : [':tabnew'   , 'Tab New'] ,
"            \ 't'    : [':tabnew %<CR>gTZZgt'   , 'Tab New'] ,
"            \ }

let g:space_prefix_dict.1 = [':normal 1gt' , 'Tab 1']
let g:space_prefix_dict.2 = [':normal 2gt' , 'Tab 2']
let g:space_prefix_dict.3 = [':normal 3gt' , 'Tab 3']
let g:space_prefix_dict.4 = [':normal 4gt' , 'Tab 4']
let g:space_prefix_dict.5 = [':normal 5gt' , 'Tab 5']
let g:space_prefix_dict.6 = [':normal 6gt' , 'Tab 6']
let g:space_prefix_dict.7 = [':normal 7gt' , 'Tab 7']
let g:space_prefix_dict.8 = [':normal 8gt' , 'Tab 8']
let g:space_prefix_dict.9 = [':normal 9gt' , 'Tab 9']
let g:space_prefix_dict.0 = [':tablast' , 'Tab Last']



call which_key#register('<SPACE>', 'g:space_prefix_dict')




"去除搜索高亮
nnoremap <silent> <Space>h :nohls<CR>
let g:space_prefix_dict.h = "No highlight"




"===================================================


"重命名指令
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))


" 行号控制,便于复制
nnoremap <silent> <Space>n :NumbersToggle<CR>:IndentLinesToggle<CR>
let g:enable_numbers = 0


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


" 设置YouCompleteMe
" Go to definition else declaration
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <S-Tab> :YcmCompleter GetDoc<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>





" 调用 gundo 树
nnoremap <Space>u :UndotreeToggle<CR>



" Markdown 设置预览,显示隐藏快捷键和加粗快捷键
autocmd FileType markdown nmap <silent> <Space>m <Plug>MarkdownPreview
nmap <Space>c :set conceallevel=0<CR>


" Vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Quickfix & Location list
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" vim-signature 设置mark标记提示
nmap <silent> <F4> :SignatureToggleSigns<CR>


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
nmap <Space>g :GitGutterToggle<CR>
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk<Paste>


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
nmap <Space>v :FZF ~/.config/nvim<CR>
nmap <Space>e :FZF ~/.emacs.d<CR>
nmap <Space>a :Ag<CR>

" FZF搜索文件
nmap <C-p> :FZF ~/Documents/<CR>

" 重置配置文件
nmap <Space>r :source $MYVIMRC<CR>


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
