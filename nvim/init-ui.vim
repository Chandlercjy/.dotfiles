

" indentline 颜色
"let g:indentLine_bgcolor_gui = '#272727'
"let g:indentLine_color_gui = '#4f4f4f'

" Startify 配置
let g:startify_enable_special = 0
let g:startify_session_dir = '~/.vim/session'
let g:startify_commands = [
    \ ['Status of Plugins', 'PlugStatus'],
    \ ['Install Plugins', 'PlugInstall'],
    \ ['Clean Plugins', 'PlugClean'],
    \ ['Check Health', 'checkhealth'],
    \ ['Start Time', 'StartupTime']
    \ ]


"let g:startify_session_persistence = 1
let g:startify_custom_header = [
            \ '     +------------------------------------------+',
            \ '     |                                          |',
            \ '     |    今天又是元气满满的一天!!!             |',
            \ '     |    哇哈哈哈哈哈哈哈哈哈哈哈哈!!!         |',
            \ '     |                                          |',
            \ '     |                           --Chandler     |',
            \ '     |                                          |',
            \ '     +------------------------------------------+',
            \ '                      o                        ',
            \ '                       o   ^__^                ',
            \ '                        o  (oo)\_______        ',
            \ '                           (__)\       )\/\    ',
            \ '                                ||----w |      ',
            \ '                                ||     ||      ',
            \]


" 设置lightline 下面的状态栏
" set laststatus=2
"set noshowmode "不显示额外变更模式的信息
" let g:lightline = {
"             \ 'colorscheme': 'wombat',
"             \ 'active': {
"             \   'left': [ [ 'mode', 'paste' ],
"             \             [ 'readonly', 'filename', 'modified', 'ALEinfo' ] ]
"             \ },
"             \ 'component_function': {
"             \   'ALEinfo': 'ALEGetStatusLine',
"             \ },
"             \ }
"
" 设置主题
"colorscheme onedark
"colorscheme neodark
"colorscheme gruvbox
"colorscheme OceanicNext
colorscheme palenight
let g:palenight_terminal_italics=1


"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

" ====================== Vim-AirLine =======================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_theme='bubblegum'

