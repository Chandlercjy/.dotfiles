" ==============================
" Plug 插件管理
" ==============================
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"通用插件
Plug 'wakatime/vim-wakatime'"
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree',{ 'on':  'NERDTreeToggle' }
Plug 'skywind3000/asyncrun.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'mbbill/undotree',{ 'on':  'UndotreeToggle' }
Plug 'myusuf3/numbers.vim',{ 'on': 'NumbersToggle' }
Plug 'kshenoy/vim-signature'
"Plug 'kassio/neoterm'

" 通用编辑类
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'rhysd/clever-f.vim'
Plug 'gcmt/wildfire.vim'
"Plug 'dhruvasagar/vim-table-mode'

" 代码插件
Plug 'Valloric/YouCompleteMe',{ 'for': 'python,go,cpp,c,typescript,javascript','do': './install.py --clang-completer' }
"Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-python/python-syntax'
Plug 'yggdroot/indentline'
Plug 'bfrg/vim-cpp-modern'
Plug 'leafgarland/typescript-vim'

" Markdown插件
Plug 'iamcco/mathjax-support-for-mkdp',{'for':'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for':'markdown'}
Plug 'mzlogin/vim-markdown-toc',{'for':'markdown'}
"Plug 'rhysd/vim-gfm-syntax',{'for':'markdown'}

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" 主题美化类
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'ayu-theme/ayu-vim'
"Plug 'morhetz/gruvbox'


" 试用
Plug 'xolox/vim-misc'
Plug 'sillybun/vim-autodoc'
Plug 'tweekmonster/startuptime.vim'
Plug 'junegunn/vim-easy-align'

"Plug 'mg979/vim-visual-multi'
"Plug 'Shougo/denite.nvim'
"Plug 'Yggdroot/LeaderF'

"Plug 'mileszs/ack.vim'
"Plug 'terryma/vim-expand-region'
"Plug 'roxma/vim-tmux-clipboard'
"Plug 'KangOl/vim-pudb'
"Plug 'idanarye/vim-vebugger'
"Plug 'Shougo/vimproc.vim'
"Plug 'jaredly/vim-debug'

"Neocomplete 抛弃不用，没ycm好
"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'zchee/deoplete-go', { 'do': 'make','for':'go'}
"Plug 'Shougo/neco-syntax'
"Plug 'zchee/deoplete-jedi',{'for':'python'}
"Plug 'tweekmonster/deoplete-clang2',{'for':'c,cpp'}
"Plug 'Shougo/neoinclude.vim',{'for':'c,cpp'}
call plug#end()


" ==============================
" System Setting 系统设置
" ==============================

"设置24 bit True color
"if has("termguicolors")
set termguicolors
"endif

" For System
"autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc
"set autochdir    "自动切换路径到文件目录
set nocompatible "去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限

" About Files
filetype on  "开启文件类型检测
filetype plugin on "根据检测到的不同类型加载对应的插件
"syntax enable " 开启语法高亮功能
syntax on " 开启语法高亮功能

" Mouse and backspace
"set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Showing line numbers and length
set rnu  " show line numbers
set tw=79   " width of document (used by gd) 超过会自动换行
set nowrap " 禁止折行
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
"set hlsearch
set incsearch "开启实时搜索功能
set ignorecase " 搜索时大小写不敏感
set smartcase

" Disable stupid backup and swap files - they trigger too many events
"set nobackup
"set nowritebackup
set noswapfile

" 设置主题
"colorscheme onedark
"colorscheme neodark
"colorscheme gruvbox
"colorscheme OceanicNext
colorscheme palenight

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu


set cursorline
set undofile " tell it to use an undo file
set undodir=~/.vimundo/ " set a directory to store the undo history
set wildmenu "增强模式中的命令行自动完成操作
set foldmethod=indent " 基于语法进行代码折叠
set nofoldenable " 启动 vim 时关闭折叠代码
set splitright " 每次分屏在右边
set smartindent

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"解决文字编码问题
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" ==============================
" Global 快捷键设置
" ==============================

let mapleader = "," " Rebind <Leader> key
noremap  <Space>1 1gt
noremap  <Space>2 2gt
noremap  <Space>3 3gt
noremap  <Space>4 4gt
noremap  <Space>5 5gt
noremap  <Space>6 6gt
noremap  <Space>7 7gt
noremap  <Space>8 8gt
noremap  <Space>9 9gt
noremap  <Space>0 :tablast<CR>

"重命名指令
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))

"去除搜索高亮
nnoremap <silent> <Space>h :nohls<CR>

"快捷键,ctrl+l切换到左边布局,ctrl+h切换到右边布局
"ctrl+k切换到上面布局,ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 行号控制,便于复制
nnoremap <silent> <Space>n :NumbersToggle<CR>:IndentLinesToggle<CR>
let g:enable_numbers = 0

" 删除但是不添加到剪贴板
nnoremap <leader>d "_dd

" 复制达到剪贴板
nmap <leader>yy "+yy
nmap <leader>y "+y
vmap <leader>y "+y

" 切换路径为当前文件路径
nmap <leader>cd :cd %:p:h<CR>

" 保存快捷键
"nmap <Space>s :ALEFix<CR> :wa<CR>
nmap <Space>s :wa<CR>

" 修改全角符号为半角符号
nmap <leader>f: :%s/：/:/g<CR>
nmap <leader>f, :%s/，/, /g<CR>
nmap <leader>f,, :%s/,/, /g<CR> :%s/,  /, /g<CR>
nmap <leader>f( :%s/（/(/g<CR>
nmap <leader>f) :%s/）/)/g<CR>

" Tab操作快捷键
nmap <Space>t :tabnew %<CR>gTZZgt

" 英文检查
map <F8> :setlocal spell! spelllang=en_us<CR>

" 使find指令可用
set path+=**

set whichwrap=b,h,l,<,>,[,]  "list of menu_flags specifying which commands wrap to another line
set showtabline=1  "always show the tabline

" ==============================
" Plugin 快捷键设置
" ==============================
" Default mapping for multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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
"let g:ycm_key_invoke_completion = '<C-a>' " 主动调用补全
"set completeopt=longest,menu "关闭弹出原型窗口的功能
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_show_diagnostics_ui = 0 "关闭静态检查
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
let g:ycm_complete_in_comments = 1 " 在注
let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0


" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1 " 忽略大小写
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
nmap F <Plug>(easymotion-F)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-T)
nmap ? <Plug>(easymotion-Fn)
nmap / <Plug>(easymotion-sn)
nmap <leader>. <Plug>(easymotion-repeat)


" 调用 gundo 树
nnoremap <Space>u :UndotreeToggle<CR>

" Python
let g:python_highlight_all = 1
set re=1 " python语法高亮后会延迟,换用旧款正则表达式引擎即可修复
"set ttyfast
"set lazyredraw

" ale 语法检查
"let g:ale_lint_on_enter = 0 "打开文件时不进行检查
let g:ale_python_mypy_executable = 'mypy'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_javascript_prettier_options = '--config ~/.prettierrc'
let g:ale_fixers = {
            \   'vim': ['remove_trailing_lines','trim_whitespace'],
            \   'python': ['add_blank_lines_for_python_control_statements','autopep8','isort','remove_trailing_lines','trim_whitespace'],
            \   'markdown': ['prettier','remove_trailing_lines','trim_whitespace'],
            \   'cpp': ['clang-format','remove_trailing_lines','trim_whitespace'],
            \   'c': ['clang-format','remove_trailing_lines','trim_whitespace'],
            \   'typescript': ['prettier','remove_trailing_lines','trim_whitespace'],
            \   'javascript': ['prettier','remove_trailing_lines','trim_whitespace'],
            \}


"let g:ale_linters = {
"\}
            "\   'typescript': ['eslint','prettier','tslint','remove_trailing_lines','trim_whitespace','tsserver','typecheck'],

"ale
"保存时自动调整
"let g:ale_fix_on_save = 1


" 控制刷新频率
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1


"始终开启标志列
"let g:ale_sign_column_always = 2
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pylint_options = '--disable=missing-docstring,too-many-arguments,too-many-ancestors,arguments-differ'
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: LLVM, IndentWidth: 4, BreakBeforeBraces: Attach, AllowShortIfStatementsOnASingleLine: true, IndentCaseLabels: true, ObjCBlockIndentWidth: 4, ObjCSpaceAfterProperty: true, ColumnLimit: 0, AlignTrailingComments: true, SpaceAfterCStyleCast: true, SpacesInParentheses: false, SpacesInSquareBrackets: false}"'
"let g:ale_cpp_gcc_options = '-Wall -std=c++17 -I ~/Documents/CLionProjects/OnePyPlus/include/'
"let g:ale_cpp_clang_options = '-Wall -std=c++17'
"let g:ale_javascript_prettier_options = '--tab-width 4 --prose-wrap always'

"let g:ale_linters = {
"\   'c++': [],
"\   'c': [],
"\   'python': ['pylint'],
"\}
" Only run linters named in ale_linters settings.
"let g:ale_linters_explicit = 1

" 设置lightline 下面的状态栏
set laststatus=2
set noshowmode "不显示额外变更模式的信息
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'ALEinfo' ] ]
            \ },
            \ 'component_function': {
            \   'ALEinfo': 'ALEGetStatusLine',
            \ },
            \ }

"
" ALE 设置快捷键
nmap <Space>] <Plug>(ale_next)
nmap <Space>[ <Plug>(ale_previous)
nmap <F7> :ALEToggle<CR>
nmap <leader>f  :ALEFix<CR>:wa<CR>

" Markdown 设置预览,显示隐藏快捷键和加粗快捷键
autocmd FileType markdown nmap <silent> <Space>m <Plug>MarkdownPreview
nmap <Space>c :set conceallevel=0<CR>


" UltiSnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger= "<C-p>"

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

" vim-gfm-syntax markdown语法高亮
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json','python', 'r']

" Markdown table formatter ,快捷键为 <leader>tm
let g:table_mode_corner='|'


" AsyncRun
let g:asyncrun_open = 10
nmap <leader>s :AsyncStop<CR>
let $PYTHONUNBUFFERED=1
let g:asyncrun_save = 2 "non-zero to save current(1) or all(2) modified buffer(s) before executing


"Quickly Run
map <leader>r :call CompileRunGcc()<CR>
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

map <F5> :w<CR>:!python %<CR>

" Guitter
let g:gitgutter_map_keys = 0
nmap <Space>g :GitGutterToggle<CR>
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk<Paste>

""vim-smooth-scroll
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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

"" neoterm 快捷键
"nmap <Space>i <Plug>(neoterm-repl-send-line)j
"vmap <Space>i <Plug>(neoterm-repl-send)
"nmap <Space><Space>i :T clear<CR>

" 设置Tagbar
nmap <silent> <F3> :TagbarToggle<CR>
"let g:tagbar_width = 30          "设置tagbar的宽度为30列，默认40
let g:tagbar_left = 1

" ==============================
" 还需要配置的地方
" ==============================
if has('nvim')

    " Neovim 设置
    let g:python3_host_prog='/Users/chandler/anaconda/bin/python'
    let g:python_host_prog='/usr/local/bin/python2'
    let g:python_host_skip_check=1
    let g:python3_host_skip_check=1


    " Neovim Terminal变换
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l

endif

let g:ycm_python_binary_path = '/Users/chandler/anaconda/bin/python'


" ==============================
" 通用快捷键
" ==============================
" 打开配置文件
nmap <Space>v :e ~/.config/nvim/init.vim<CR>
nmap <Space>e :FZF ~/.emacs.d<CR>

" FZF搜索文件
nmap <C-p> :FZF ~/Documents/<CR>

" 重置配置文件
nmap <Space>r :source ~/.config/nvim/init.vim<CR>



" ==============================
" 导入自定义配置文件
" ==============================

"在当前目录下新建一个custom.vim的文件加载自己的自定义配置
ru custom.vim
