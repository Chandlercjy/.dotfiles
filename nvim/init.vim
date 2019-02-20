
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. System Better Default                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 系统类
    " set mouse=a                              " on OSX press ALT and click
    set nocompatible                         " 去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限
    filetype on                              " 开启文件类型检测
    filetype plugin on                       " 根据检测到的不同类型加载对应的插件
    filetype plugin indent on                " 为特定文件类型载入相关缩进文件
    syntax on                                " 开启语法高亮功能
    set wildmenu                             " 增强模式中的命令行自动完成操作
    set showcmd                              " 输入的命令显示出来，看的清楚些
    set splitright                           " 每次分屏在右边
    set noerrorbells                         " 不让vim发出的滴滴声
    set report=0                             " 通过使用: commands命令，告诉我们文件的哪一行被改变过
    set path+=**                             " 可以用:find命令递归打开文件
    set autoread                             " 文件自动重载
    set confirm                              " 在处理未保存或只读文件的时候，弹出确认
    set nobackup                             " 不要备份文件
    set noswapfile                           " 不产生临时备份文件
    set undofile                             " tell it to use an undo file
    set undodir=~/.vimundo/                  " set a directory to store the undo history
    set undolevels=1000                      " max number of undos
    set undoreload=10000                     " max lines to to save for undo
    set hidden                               " vim切换buffer(文件/tab)后仍然保留undo

    " 编辑类
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
    set fo-=t                                " don't automatically wrap text when typing
    set iskeyword+=_,$,@,%,#,-               " 带有如下符号的单词不要被换行分割
    set fo+=mB                               " 对亚洲语言断行支持
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip " 这些后缀的文件不做补全成员
    set whichwrap=b,h,l,<,>,[,]              " 允许backspace和光标键跨越行边界
    set tw=79                                " width of document (used by gd) 超过会自动换行
    set nowrap                               " 禁止折行
    set fenc=utf-8                           " 设定默认解码
    " set list listchars=trail:๏              " 方便显示tab 和 空格
    " set listchars=tab:>-
    set smarttab                             " 在行和段开始处使用制表符
    set expandtab                            " 用空格代替制表符
    set showtabline=1                        " always show the tabline
    set tabstop=4                            " 制表符为4
    set softtabstop=4                        " 统一缩进为4
    set cindent shiftwidth=4                 " 自动缩进4空格
    set shiftwidth=4                         " 统一缩进为4
    set backspace=2                          " 使回格键（backspace）正常处理indent, eol, start等
    set shiftround
    set autoindent                           " 自动缩进, 继承前一行的缩进方式
    set smartindent                          " 智能自动缩进
    set incsearch                            " 开启实时搜索功能
    set hlsearch                             " 搜索逐字符高亮
    set ignorecase                           " 搜索时大小写不敏感
    set smartcase

    " UI
    set termguicolors
    set colorcolumn=80
    set rnu                                  " show relative line numbers
    set nu                                   " show line numbers
    set cmdheight=1                          " 命令行（在状态行下）的高度，默认为1，这里是2
    set laststatus=2                         " 总是显示状态行
    set scrolloff=3                          " 光标移动到buffer的顶部和底部时保持3行距离
    set novisualbell                         " 不要闪烁
    set showmatch                            " 高亮显示匹配的括号
    set matchtime=2                          " 匹配括号高亮的时间（单位是十分之一秒）
    set cursorline
    set cursorcolumn

    " 不知道啥的
    set magic                                " 设置魔术
    set nowb
    set bufhidden=hide
    set linespace=0                          " 字符间插入的像素行数目
    set viminfo+=!                           " 保存全局变量
    set history=1000                         " history文件中需要记录的行数
    set fillchars+=stl:\ ,stlnc:\

                                             " 折叠
    set foldmethod=indent                    " 基于语法进行代码折叠
    set nofoldenable                         " 启动 vim 时不折叠代码
    " set foldenable
    " set foldlevel=3
    " set foldcolumn=0

    " 不需要的
    " set autochdir                                         " 自动切换路径到文件目录
    " set autowrite                                         " 文件自动保存
    " set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h18 " 设置字体
    " set clipboard=unnamed                                 " Mac 下共享剪切板

" =================================================== System Better Default End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. Awesome CMD                                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ========== Autoload when changed in other place ==========
    autocmd WinEnter,BufWinEnter,FocusGained * checktime

" ============ Remember the last edit position =============
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                        \ exe "normal! g`\"" |
                        \ endif

" ======================= Auto-Save ========================
    autocmd FocusLost * :wa|echo "Autosaved!"
    set autowriteall

" ============================================================= Awesome CMD End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Vim-Plug                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    call plug#begin('~/.vim/plugged')

" ======================= 主题美化类 ========================
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'drewtempelmeyer/palenight.vim'    " Load by Default
    Plug 'morhetz/gruvbox'                          , {'on':['Colors']}
    Plug 'ayu-theme/ayu-vim'                        , {'on':['Colors']}
    Plug 'arcticicestudio/nord-vim'                 , {'on':['Colors']}
    Plug 'rakr/vim-one'                             , {'on':['Colors']}
    Plug 'mhartington/oceanic-next'                 , {'on':['Colors']}
    Plug 'ryanoasis/vim-devicons'                    "需要安装 https://github.com/ryanoasis/nerd-fonts#option-3-install-script


    Plug 'gcavallanti/vim-noscrollbar'

" ========================== 代码类 ===========================
    " 强大的各种语言支持
    Plug 'sheerun/vim-polyglot'

    " 代码检查和补全
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'w0rp/ale'
    Plug 'Valloric/YouCompleteMe'                   , { 'do': './install.py --clang-completer' }
    Plug 'rdnetto/YCM-Generator'                    , {'on':'YcmGenerateConfig', 'branch': 'stable'}

    " 异步运行
    Plug 'skywind3000/asyncrun.vim'                 , { 'on': ['AsyncRun','AsyncStop']}

    " REPL
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'Chandlercjy/neoterm'                      , {'on':[ 'TREPLSendFile', '<Plug>(neoterm-repl-send)', '<Plug>(neoterm-repl-send-line)' ]}

    " Git
    Plug 'tpope/vim-fugitive'                       , {'on': ['Gblame', 'Gcommit', 'Gdiff', 'Gedit', 'Glog', 'Gread', 'Gstatus', 'Gwrite', 'Git push','GV','GV!']}
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'Chandlercjy/git-blame.vim'                , { 'on': ['GitBlame']}


    " 自动生成ctags和查看
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'
    Plug 'majutsushi/tagbar'                        , {'on':['TagbarToggle']}


    " 语言相关
    Plug 'vhdirk/vim-cmake'                         , { 'for' : ['c','cpp','hpp','h']}
    Plug 'leafgarland/typescript-vim'               , { 'for' : ['typescript']}
    Plug 'fatih/vim-go'                             , { 'for' : ['go'], 'do': ':GoUpdateBinaries'}


" ========================== 实用类 ===========================
    " 快捷键帮助视图
    Plug 'liuchengxu/vim-which-key'

    " 缩进提示
    Plug 'yggdroot/indentline'

    " 快速选择
    Plug 'gcmt/wildfire.vim'

    " 通用编辑
    Plug 'terryma/vim-multiple-cursors'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'                 , { 'on': ['<Plug>NERDCommenterToggle', '<Plug>NERDCommenterAppend'] }
    Plug 'tpope/vim-surround'                       , { 'on': []}
    Plug 'mbbill/undotree'                          , { 'on':  'UndotreeToggle' }
    Plug 'simnalamburt/vim-mundo'                   , { 'on':  'MundoToggle' }

    " 左边栏显示mark
    Plug 'kshenoy/vim-signature'

    " Docker管理
    Plug 'kevinhui/vim-docker-tools'                , { 'on':  'DockerToolsToggle' }

    " 文件管理
    Plug 'scrooloose/nerdtree'                      , { 'on':  'NERDTreeToggle' }
    Plug 'francoiscabrol/ranger.vim'                , { 'on':'Ranger'}
    Plug 'rbgrouleff/bclose.vim'

    " 搜索
    Plug 'junegunn/fzf'                             , {  'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'pelodelfuego/vim-swoop'
    Plug 'dyng/ctrlsf.vim'                          , { 'on':'CtrlSF'}

    " 复制粘贴记录
    Plug 'Shougo/neoyank.vim'                       , {'on': 'FZFNeoyank'}
    Plug 'justinhoward/fzf-neoyank'                 , {'on': 'FZFNeoyank'}

    " 实时显示正则替换
    Plug 'osyo-manga/vim-over'                      , { 'on':'OverCommandLine'}

    " 给同样的单词加下划线
    Plug 'itchyny/vim-cursorword'

    " 高亮html/xml tags
    Plug 'Valloric/MatchTagAlways'                  , { 'for':['html','tags']}

    " 快速跳转
    Plug 'easymotion/vim-easymotion'                , {'on': ['<Plug>(easymotion-overwin-f','<Plug>(easymotion-Fn']}
    Plug 'rhysd/clever-f.vim'

    " 对齐格式
    Plug 'junegunn/vim-easy-align'                  , { 'on': ['<Plug>(EasyAlign)']}

    " 方便地移动上下行
    Plug 'matze/vim-move'                           , { 'on': [ '<Plug>MoveLineDown', '<Plug>MoveLineUp' ]}

    " 强大的表格模式
    Plug 'dhruvasagar/vim-table-mode'               , { 'on': [ 'TableModeToggle', '<Plug>(table-mode-tableize)' ]}

    " 方便的调用终端
    Plug 'wvffle/vimterm'

    " 各种实用命令
    Plug 'tpope/vim-eunuch'

" ======================== 系统增强类 =========================
    Plug 'pseewald/vim-anyfold'                      " 加强缩进折叠
    Plug 'tpope/vim-repeat'                          " 系统.命令的加强
    Plug 'pbrisbin/vim-mkdir'                        " 可以自动创建文件夹不报错
    Plug 'christoomey/vim-tmux-navigator'            " Tmux加强
    Plug 'tmux-plugins/vim-tmux-focus-events'


" ========================== 趣味类 ===========================
    Plug 'yuttie/comfortable-motion.vim'                                      " 舒服的滚动
    Plug 'tweekmonster/startuptime.vim'             , {'on': ['StartupTime']} " 检查启动时间
    " Plug 'wakatime/vim-wakatime'
    Plug 'junegunn/goyo.vim'                        , {'on':'Goyo'}           " 无打扰模式

    Plug 'prabirshrestha/async.vim'
    Plug 'christianrondeau/vim-base64'
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'vim-pandoc/vim-pandoc-after'
    Plug 'tex/vimpreviewpandoc'
    Plug 'Chandlercjy/vim-markdown-folding'         , { 'for':'markdown'}     " Markdown插件
    Plug 'Chandlercjy/vim-markdown-edit-code-block' , { 'for':'markdown'}
    Plug 'iamcco/markdown-preview.vim'              , { 'for':'markdown'}     " Markdown插件
    Plug 'iamcco/mathjax-support-for-mkdp'          , { 'for':'markdown'}     " Markdown插件
    Plug 'tyru/open-browser.vim'
    Plug 'mzlogin/vim-markdown-toc'                 , { 'for':'markdown'}
    Plug 'plasticboy/vim-markdown'                  , { 'for':'markdown'}

    Plug 'lvht/tagbar-markdown'                     , { 'for':'markdown'}

    Plug 'pangloss/vim-javascript'                  , { 'for' : ['javascript']} " 需要测试

    " 方便地控制窗口
    Plug 'romgrk/winteract.vim'                     , {'on': 'InteractiveWindow'}
    Plug 't9md/vim-choosewin'                       , {'on': ['<Plug>(choosewin)']}
    Plug 'wellle/visual-split.vim'                  , {'on':['<Plug>(Visual-Split-VSSplitAbove)', '<Plug>(Visual-Split-VSSplitBelow)']}

    " PlantUML
    " Plug 'scrooloose/vim-slumlord'                , { 'for':'plantuml'}
    Plug 'tyru/open-browser.vim'                    , { 'for':'plantuml'}
    Plug 'weirongxu/plantuml-previewer.vim'         , { 'for':'plantuml'}  " 还需要安装 Graphviz 依赖


    call plug#end()
" ================================================================ Vim-Plug End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. Initialize Chandler's Config                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    source ~/.config/nvim/utils.vim

    " 在当前目录下新建一个custom.vim的文件加载自己的自定义配置, 文件不存在时不报错
    ru init-custom.vim

" ========================= 延迟加载配置 =========================
    augroup lazy_load
        autocmd!
        autocmd InsertEnter * call plug#load('vim-surround') | autocmd! lazy_load
    augroup END
" ============================================================== Initialize End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5. Initialize Neovim                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1

        " Neovim 设置
        let g:python_host_skip_check=1
        let g:python3_host_skip_check=1
        let g:python3_host_prog='python3'
        let g:python_host_prog=''

        "Neovim Terminal变换
        tnoremap <C-h> <C-\><C-N><C-w>h
        tnoremap <C-j> <C-\><C-N><C-w>j
        tnoremap <C-k> <C-\><C-N><C-w>k
        tnoremap <C-l> <C-\><C-N><C-w>l
    endif

    let g:ycm_python_binary_path = 'python3'

" ============================================================== Initialize End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6. UI                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ========================= Theme ==========================

    colorscheme palenight
    let g:palenight_terminal_italics=1

    let g:gruvbox_italic=1

    let g:nord_italic = 1
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
    let g:nord_comment_brightness = 12

    let g:one_allow_italics = 1 " I love italic for comments


" ====================== Custom Theme ======================
    function! Custom_Theme_Strengthen() " 加强cursorline对比度
        if g:colors_name == 'palenight'
            augroup Strengthen
                autocmd InsertLeave * highlight CursorLine guibg=#2f3843
                autocmd InsertEnter * highlight CursorLine guibg=#2b323b
            augroup END
        else
            autocmd! Strengthen
        endif

        highlight Folded guifg=lightblue
    endfunction

    call Custom_Theme_Strengthen()

    autocmd ColorScheme * call Custom_Theme_Strengthen()

" ======================== Startify ========================
    let g:startify_enable_special = 0 " don't show empty buffer
    let g:startify_session_dir = '~/.vim/session'
    let g:startify_commands = [
        \ ['Status of Plugins' , 'PlugStatus'],
        \ ['Install Plugins'   , 'PlugInstall'],
        \ ['Clean Plugins'     , 'PlugClean'],
        \ ['Check Health'      , 'checkhealth'],
        \ ['Start Time'        , 'StartupTime']
        \ ]

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

" ====================== Vim-AirLine =======================
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline_theme='bubblegum'
    let g:airline#extensions#ale#enabled = 1
    " add scroll bar
    let g:airline_section_c = airline#section#create(['%{noscrollbar#statusline(9,''■'',''◫'',[''◧''],[''◨''])}', ' %{expand("%:t")}'])

" ====================== indent line =======================
    "let g:indentLine_bgcolor_gui = '#272727'
    "let g:indentLine_color_gui = '#4f4f4f'

" ================= DIY Highlight >80 code =================
    hi Over80 guifg=fg  guibg=red
    au BufNewFile,BufRead *.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.py, match Over80 '\%>80v.*'

" ====================================================================== UI End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7. Plugin Config                                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =================== Comfortable-motion ===================
    let g:comfortable_motion_no_default_key_mappings = 1
    let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
    let g:comfortable_motion_is_enabled = 0
    call ComfortableMotionToggle()



" ========================== FZF ===========================
    let g:fzf_layout = { 'down': '~20%' }
    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
                \ { 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1


" ====================== vim-anyfold =======================
    autocmd Filetype python,vim AnyFoldActivate
    let g:anyfold_fold_comments=1

" ======================== neoterm =========================
    let g:neoterm_open_in_all_tabs = 0
    let g:neoterm_position = 'vertical'
    let g:neoterm_autoscroll = 1
    let g:neoterm_fixedsize = 1
    let g:neoterm_size = '80'

" ========================== ALE ===========================
    let g:ale_python_mypy_executable = 'mypy'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    let g:ale_javascript_prettier_options = '--config ~/.prettierrc'
    let g:ale_javascript_prettier_options = '--config ~/.prettierrc'
    let g:ale_fixers = {
                \   'vim': ['remove_trailing_lines','trim_whitespace'],
                \   'uml': ['remove_trailing_lines','trim_whitespace'],
                \   'python': ['black','yapf','isort','remove_trailing_lines','trim_whitespace'],
                \   'markdown': ['prettier','remove_trailing_lines','trim_whitespace'],
                \   'cpp': ['clang-format','remove_trailing_lines','trim_whitespace'],
                \   'c': ['clang-format','remove_trailing_lines','trim_whitespace'],
                \   'typescript': ['prettier','remove_trailing_lines','trim_whitespace'],
                \   'javascript': ['prettier','importjs', 'remove_trailing_lines', 'trim_whitespace' ],
                \   'html': ['tidy','remove_trailing_lines','trim_whitespace'],
                \   'sh': ['shfmt','remove_trailing_lines','trim_whitespace'],
                \   'go': ['gofmt','goimports','remove_trailing_lines','trim_whitespace'],
                \}


    " 保存时自动调整
    " let g:ale_fix_on_save = 1

    " 控制刷新频率
    let g:ale_lint_on_enter = 0 "打开文件时不进行检查
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1


    " 始终开启标志列
    let g:ale_set_highlights = 1
    " 自定义error和warning图标
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚡'
    " 在vim自带的状态栏中整合ale
    let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
    " 显示Linter名称,出错或警告等相关信息
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    " 对ALE的特别配置
    let g:ale_python_mypy_options = '--ignore-missing-imports'
    let g:ale_python_pylint_options = '--disable=missing-docstring,too-many-arguments,too-many-ancestors,arguments-differ'
    let g:ale_c_clangformat_options = '-style="{BasedOnStyle: LLVM, IndentWidth: 4, BreakBeforeBraces: Attach, AllowShortIfStatementsOnASingleLine: true, IndentCaseLabels: true, ObjCBlockIndentWidth: 4, ObjCSpaceAfterProperty: true, ColumnLimit: 0, AlignTrailingComments: true, SpaceAfterCStyleCast: true, SpacesInParentheses: false, SpacesInSquareBrackets: false}"'
    "let g:ale_cpp_gcc_options = '-Wall -std=c++17 -I ~/Documents/CLionProjects/OnePyPlus/include/'
    "let g:ale_cpp_clang_options = '-Wall -std=c++17'
    "let g:ale_javascript_prettier_options = '--tab-width 4 --prose-wrap always'
    let g:ale_c_parse_compile_commands = 1 " 在CMAKE中添加 SET(CMAKE_EXPORT_COMPILE_COMMANDS ON) 就可以找到头文件

" ======================= UltiSnips ========================
    " let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

" ===================== YouCompleteMe ======================
    "set completeopt=longest,menu "关闭弹出原型窗口的功能
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_show_diagnostics_ui = 0 "关闭静态检查
    let g:ycm_min_num_of_chars_for_completion=1 " 从第1个键入字符就开始罗列匹配项
    let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
    let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
    let g:ycm_complete_in_comments = 1 " 在注
    let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py' " 如果找不到conf就用这个
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}
    let g:ycm_key_detailed_diagnostics = ''


" ===================== vim-easymotion =====================
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1 " 忽略大小写
    let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" ====================== vim-markdown ======================
    let g:vim_markdown_fenced_languages = ['javascript=cpp',
          \ 'python=python'
          \ ]

" ===================== vim-table-mode =====================
    let g:table_mode_corner='|'
    let g:table_mode_corner_corner='|'
    let g:table_mode_header_fillchar='-'
    let g:table_mode_sort_map = '<Leader>ts'

" ===================== Nerd Commenter =====================
    let g:NERDSpaceDelims = 1
    let g:NERDCreateDefaultMappings = 0

" ========================= Ranger =========================
    let g:NERDTreeHijackNetrw = 0
    " open ranger when vim open a directory
    let g:ranger_replace_netrw = 1
    let g:ranger_map_keys = 0
    let g:bclose_no_plugin_maps = 0 " Bclose为在Neovim下Ranger的依赖

" ======================== AsyncRun ========================
    let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

    let g:asyncrun_open = 10
    let $PYTHONUNBUFFERED=1
    let g:asyncrun_save = 2 " non-zero to save current(1) or all(2) modified buffer(s) before executing

" ======================== Tagbar ==========================
    let g:tagbar_width = 40          " 设置tagbar的宽度为30列，默认40
    let g:tagbar_left = 1
    let g:tagbar_map_closefold = "h"
    let g:tagbar_map_openfold = "l"


" ======================= vim-repeat =======================
    silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ======================= vim-swoop ========================
    let g:swoopUseDefaultKeyMap = 0

" ===================== vim-javascript =====================
    let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_ngdoc = 1
    let g:javascript_plugin_flow = 1


" ====================== vim-polyglot ======================
    " Python
    let g:python_highlight_all = 1
    set re=1 " python语法高亮后会延迟,换用旧款正则表达式引擎即可修复
    " set lazyredraw

    " Cpp
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_experimental_simple_template_highlight = 1

" ===================== vim-choosewin ======================
    " use overlay feature
    let g:choosewin_overlay_enable = 1

    " workaround for the overlay font being broken on mutibyte buffer.
    let g:choosewin_overlay_clear_multibyte = 1

    " tmux-like overlay color
    let g:choosewin_color_overlay = {
                \ 'gui': ['DodgerBlue3', 'DodgerBlue3'],
                \ 'cterm': [25, 25]
                \ }
    let g:choosewin_color_overlay_current = {
                \ 'gui': ['firebrick1', 'firebrick1'],
                \ 'cterm': [124, 124]
                \ }

    let g:choosewin_blink_on_land      = 0 " don't blink at land
    let g:choosewin_statusline_replace = 0 " don't replace statusline
    let g:choosewin_tabline_replace    = 0 " don't replace tabline



" ===================== vim-gutentags ======================
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    " 检测 ~/.cache/tags 不存在就新建
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif

" ==================== gententags_plus =====================
    " enable gtags module
    let g:gutentags_modules = ['ctags', 'gtags_cscope']

    " config project root markers.
    let g:gutentags_project_root = ['.root']

    " generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " forbid gutentags adding gtags databases
    let g:gutentags_auto_add_gtags_cscope = 0
    let g:gutentags_plus_nomap = 1
    " let g:gutentags_trace = 1


" ======================== clever-f ========================
    let g:clever_f_smart_case = 1
    let g:clever_f_chars_match_any_signs = ";"
    let g:clever_f_not_overwrites_standard_mappings = 0
    map f <Plug>(clever-f-f)
    map F <Plug>(clever-f-F)

" ====================== For-Markdown ======================
    let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
    let g:mkdp_refresh_slow = 0

    augroup PrevimSettings
        autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    augroup END

    autocmd FileType markdown set shiftwidth=2
    autocmd FileType markdown nmap <buffer> <silent> o A<CR>
    autocmd FileType markdown nmap <buffer> <silent> <leader>m :MarkdownPreview<CR>
    autocmd FileType markdown nmap <buffer> <silent> <leader>s :MarkdownPreviewStop<CR>
    autocmd FileType markdown nmap <buffer> <silent> <leader>e :MarkdownEditBlock<CR>

" ======================== wildfire ========================
  let g:wildfire_objects = ["iw","i'", 'i"', "i)", "i]", "i}", "ip", "it", "i`"]

" =========================================================== Plugin Config End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8. Keybinding by Which-key                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ================== Initialize Which-key ==================
    set timeoutlen=500
    " let g:mapleader = ","

    " 高亮prefix
    autocmd! FileType which_key
    autocmd FileType which_key highlight WhichKeyGroup guifg=PaleGoldenrod
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    map <silent> , :<c-u>WhichKey ','<CR>
    map <silent> <SPACE> :<c-u>WhichKey '<SPACE>'<CR>
    map <silent> [ :<c-u>WhichKey '['<CR>
    map <silent> ] :<c-u>WhichKey ']'<CR>


    let g:comma_prefix_dict =  {}
    let g:space_prefix_dict =  {}
    let g:left_parentheses_prefix_dict = {}
    let g:right_parentheses_prefix_dict = {}


" ====================== Comma-prefix ======================
    map ,cc <Plug>NERDCommenterToggle
    map ; <Plug>NERDCommenterToggle
    let g:comma_prefix_dict.c = {
                \ 'name': '+nerd-comenter && cd',
                \ 'A' : ['<Plug>NERDCommenterAppend'                   , 'NERDComment Append']        ,
                \ 'c' : ['<Plug>NERDCommenterToggle'                   , 'NERDComment Toggle']        ,
                \ 'd' : [':cd %:p:h | echo "Change Dir successfully!"' , 'Back to current directory'] ,
                \}


    let g:comma_prefix_dict.p = {
                \ 'name' : '+Plugin',
                \ 'd': [':PlugDiff'    , 'PlugDiff']    ,
                \ 'c': [':PlugClean'   , 'PlugClean']   ,
                \ 's': [':PlugStatus'  , 'PlugStatus']  ,
                \ 'u': [':PlugUpdate'  , 'PlugUpdate']  ,
                \ 'i': [':PlugInstall' , 'PlugInstall'] ,
                \ 'U': [':PlugUpgrade' , 'PlugUpgrade'] ,
                \}

    noremap <silent> ,ds :GscopeFind s <C-R><C-W><cr>
    noremap <silent> ,dg :GscopeFind g <C-R><C-W><cr>
    noremap <silent> ,dc :GscopeFind c <C-R><C-W><cr>
    noremap <silent> ,dt :GscopeFind t <C-R><C-W><cr>
    noremap <silent> ,de :GscopeFind e <C-R><C-W><cr>
    noremap <silent> ,df :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> ,di :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> ,dd :GscopeFind d <C-R><C-W><cr>
    noremap <silent> ,da :GscopeFind a <C-R><C-W><cr>
    let g:comma_prefix_dict.d = {
                \ 'name' : '+Gtags',
                \   's':'Find symbol (reference) under cursor'             ,
                \   'g':'Find symbol definition under cursor'              ,
                \   'c':'Functions called by this function'                ,
                \   't':'Functions calling this function'                  ,
                \   'e':'Find text string under cursor'                    ,
                \   'f':'Find egrep pattern under cursor'                  ,
                \   'i':'Find file name under cursor'                      ,
                \   'd':'Find files #including the file name under cursor' ,
                \   'a':'Find places where current symbol is assigned'     ,
                \}

    let g:comma_prefix_dict.t = {
                \ 'name' : '+Toggle'                       ,
                \ 'd': [':DockerToolsToggle'               , ':DockerTools-Toggle']       ,
                \ 'G': [':GitGutterToggle'                 , 'GitGutter-Toggle']          ,
                \ 'a': [':ALEToggle'                       , 'ALE-Toggle']                ,
                \ 'u': [':MundoToggle'                     , 'Mundo-Toggle']              ,
                \ 'g': [':Goyo'                            , 'Goyo-Toggle']               ,
                \ 'U': [':UndotreeToggle'                  , 'UndotreeToggle']            ,
                \ 'm': [':SignatureToggleSigns'            , 'Marks-Toggle']              ,
                \ 's': [':setlocal spell! spelllang=en_us' , 'Spell-Toggle']              ,
                \ 'S': [':AutoSaveToggle'                  , 'AutoSaveToggle']            ,
                \ 'c': [':call ComfortableMotionToggle()'  , 'Comfortable-Motion-Toggle'] ,
                \ 'b': [':call BackgroundColorToggle()'    , 'BackgroundColorToggle']     ,
                \ 'o': [':call HighlightOver80Toggle()'    , 'HighlightOver80Toggle!']    ,
                \ 't': [':TableModeToggle'                 , 'table-mode-Toggle']         ,
                \ }


    " 复制达到剪贴板
    map ,y "+y
    let g:comma_prefix_dict.y = "yank to clipboard"
    let g:comma_prefix_dict.f = [':ALEFix | wa'               , 'ALEFix and save']
    let g:comma_prefix_dict.q = [':call QuickfixToggle()'     , 'QuickfixToggle']
    let g:comma_prefix_dict.l = [':call LocationListToggle()' , 'LocationListToggle']
    let g:comma_prefix_dict.r = [':call AsyncRun_Code()'      , 'AsyncRun Code!']
    let g:comma_prefix_dict.s = [':AsyncStop'                 , 'AsyncStop']
    let g:comma_prefix_dict.g = [':YcmCompleter GoTo'         , 'YCM-GoTo']




" ====================== Space-prefix ======================
    let g:space_prefix_dict.v = {
                \ 'name' : '+Neovim_Config',
                \ 's': [':FZF ~/.config/nvim'               , 'Search config']   ,
                \ 'p': [':FZF ~/.vim/plugged'               , 'Search plugged']  ,
                \ 'u': [':e ~/.config/nvim/utils.vim'       , 'utils.vim']       ,
                \ 'i': [':e ~/.config/nvim/init.vim'        , 'init.vim']        ,
                \ 'c': [':e ~/.config/nvim/init-custom.vim' , 'init-custom.vim'] ,
                \ 'r': [':source $MYVIMRC'                  , 'Source vimrc']    ,
                \}

    let g:space_prefix_dict.f = {
                \ 'name' : '+files' ,
                \ 'f': [':FZF'                          , 'FZF-Search-File']     ,
                \ 'h' : [':History'                     , 'History-File-Search'] ,
                \ 'r': [':Ranger'                       , 'Ranger']              ,
                \ }

    let g:space_prefix_dict.t = {
                \ 'name' : '+Tabs'                  ,
                \ 'n': [':tabnew'                   , 'New-Tab']                ,
                \ 'd': [':tabnew % | normal gTZZgt' , 'Drag-buffer-to-New-Tab'] ,
                \ }

    let g:space_prefix_dict.g = {
                \ 'name' : '+git/version-control' ,
                \ 'b' : [':GitBlame' , 'git-blame']                            ,
                \ 'v' : [':GV'       , 'Visualize Commits']                    ,
                \ 'vc': [':GV!'     , 'Visualize Commits for current buffer'] ,
                \ 'c' : [':Gcommit'  , 'fugitive-commit']                      ,
                \ 'd' : [':Gdiff'    , 'fugitive-diff']                        ,
                \ 'e' : [':Gedit'    , 'fugitive-edit']                        ,
                \ 'l' : [':Glog'     , 'fugitive-log']                         ,
                \ 'r' : [':Gread'    , 'fugitive-read']                        ,
                \ 's' : [':Gstatus'  , 'fugitive-status']                      ,
                \ 'w' : [':Gwrite'   , 'fugitive-write']                       ,
                \ 'p' : [':Git push' , 'fugitive-push']                        ,
                \ }

    map <C-S> :call SwoopMulti()<CR>
    let g:space_prefix_dict.s = {
                \ 'name' : '+Swoop/Search' ,
                \ 's' : [':call SwoopMultiSelection()' , 'swoop-multi-selection'] ,
                \ 'w' : [':Windows'                    , 'Windows-search']        ,
                \ 'hc' : [':History:'                  , 'History-Commands']      ,
                \ 'hs' : [':History/'                  , 'History-Search']        ,
                \ 'c' : [':Colors'                     , 'Colors-Search']         ,
                \ }

    let g:space_prefix_dict.y = {
                \ 'name' : '+YouCompleteMe' ,
                \ 'f' : [':YcmCompleter FixIt'               , 'YCM-FixIt']                 ,
                \ 'd' : [':YcmCompleter GetDoc'              , 'YCM-GetDoc']                ,
                \ 't' : [':YcmCompleter GetType'             , 'YCM-GetType']               ,
                \ 'gf' : [':cd %:p:h | YcmGenerateConfig -f' , 'YCM-Generate-Config-force'] ,
                \ 'gg' : [':cd %:p:h | YcmGenerateConfig'    , 'YCM-Generate-Config']       ,
                \ }

    let g:space_prefix_dict.p = {'name' : '+projects'}

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

    let g:space_prefix_dict.a = [':Ag'                           , 'Ag-search']
    let g:space_prefix_dict.b = [':Buffers'                      , 'Buffer-list']
    let g:space_prefix_dict.c = [':call ConcealLevelToggle()'     , 'ConcealLevelToggle']
    let g:space_prefix_dict.h = [':call HighlightSearchToggle()' , 'HighlightSearchToggle']
    let g:space_prefix_dict.u = [':MundoToggle'                  , 'MundoToggle']
    let g:space_prefix_dict[':'] = [":OverCommandLine '<,'>s/"   , 'Over-CommandLine']
    let g:space_prefix_dict['[']  = ['<Plug>(ale_previous)'      , "ALE_previous"]
    let g:space_prefix_dict[']'] = ['<Plug>(ale_next)'           , "ALE_NEXT"]


    let g:space_prefix_dict['-']  = [':SSave! default' , "Save-Session-default"]
    let g:space_prefix_dict['=']  = [':SLoad default' , "Load-Session-default"]


" =================== Parentheses-prefex ===================
    let g:left_parentheses_prefix_dict.g  = ['<Plug>GitGutterNextHunk', "GitGutterNextHunk"]
    let g:right_parentheses_prefix_dict.g = ['<Plug>GitGutterPrevHunk', "GitGutterPrevHunk"]

    let g:left_parentheses_prefix_dict.a  = ['<Plug>(ale_previous)' , "ALE_previous"]
    let g:right_parentheses_prefix_dict.a = ['<Plug>(ale_next)'     , "ALE_NEXT"]

" ================== Finalized Which-key ===================
    call which_key#register(',', 'g:comma_prefix_dict')
    call which_key#register('<SPACE>', 'g:space_prefix_dict')
    call which_key#register('[', 'g:left_parentheses_prefix_dict')
    call which_key#register(']', 'g:right_parentheses_prefix_dict')
" ==================================================Keybinding by Which-key End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9. Plugin KeyBindings                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ===================== YouCompleteMe ======================
   autocmd Filetype cpp nnoremap <buffer> <S-Tab> :YcmCompleter GetDoc<CR>
   autocmd Filetype python nnoremap <buffer> <S-Tab> :YcmCompleter GetDoc<CR>
   autocmd Filetype javascript.jsx nnoremap <buffer> <S-Tab> :YcmCompleter GetDoc<CR>
   autocmd Filetype typescript nnoremap <buffer> <S-Tab> :YcmCompleter GetDoc<CR>

" ========================= vim-go =========================
    autocmd Filetype go nnoremap <buffer> <S-Tab> :GoDoc<CR>

" ======================= vim-swoop ========================
    map <C-S> :call SwoopMulti()<CR>

" ========================== FZF ===========================
    " +----------------+-----------------------------------------------------+
    " | Command        | List                                                |
    " +================+=====================================================+
    " | Files [PATH]   | Files (similar to :FZF)                             |
    " | GFiles [OPTS]  | Git files (git ls-files)                            |
    " | GFiles?        | Git files (git status)                              |
    " | Buffers        | Open buffers                                        |
    " | Colors         | Color schemes                                       |
    " | Ag [PATTERN]   | Search (ALT-A to select all, ALT-D to deselect all) |
    " | Rg [PATTERN]   | Search (ALT-A to select all, ALT-D to deselect all) |
    " | Lines [QUERY]  | Lines in loaded buffers                             |
    " | BLines [QUERY] | Lines in the current buffer                         |
    " | Tags [QUERY]   | Tags in the project (ctags -R)                      |
    " | BTags [QUERY]  | Tags in the current buffer                          |
    " | Marks          | Marks                                               |
    " | Windows        | Windows                                             |
    " | Locate PATTERN | locate command output                               |
    " | History        | v:oldfiles and open buffers                         |
    " | History:       | Command history                                     |
    " | History/       | Search history                                      |
    " | Snippets       | Snippets (UltiSnips)                                |
    " | Commits        | Git commits (requires fugitive.vim)                 |
    " | BCommits       | Git commits for the current buffer                  |
    " | Commands       | Commands                                            |
    " | Maps           | Normal mode mappings                                |
    " | Helptags       | Help tags 1                                         |
    " | Filetypes      | File types                                          |
    " +----------------+-----------------------------------------------------+

" ====================== FZF-Neoyank =======================
  map <A-y> :FZFNeoyank<CR>

" ======================= GitGutter ========================
    let g:gitgutter_map_keys = 0

" ================== vim-multiple-cursors ===================
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'

" ======================== NERDTree ========================
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeWinPos="left"
    let NERDTreeIgnore=['\.pyc','\~$','\.swp'] " 忽略一下文件的显示

" ========================= Tagbar =========================
    nmap <silent> <F4> :TagbarToggle<CR>

" ======================== vimterm =========================
    nnoremap <F7> :call vimterm#toggle() <CR>
    tnoremap <F7> <C-\><C-n>:call vimterm#toggle() <CR>

" ======================= UltiSnips ========================
    let g:UltiSnipsExpandTrigger="<C-a>"
    let g:UltiSnipsJumpForwardTrigger = "<C-n>"
    let g:UltiSnipsJumpBackwardTrigger= "<C-p>"

" ===================== vim-easymotion =====================
    nmap t <Plug>(easymotion-overwin-f)
    nmap ? <Plug>(easymotion-Fn)

" ===================== vim-easy-align =====================
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

" ======================== Vim-move ========================
    map <A-Down> <Plug>MoveLineDown
    map <A-Up> <Plug>MoveLineUp
    map <A-Left> <<
    map <A-Right> >>

    imap <A-Down> <ESC><Plug>MoveLineDownA
    imap <A-Up> <ESC><Plug>MoveLineUpA
    imap <A-Left> <ESC><<A
    imap <A-Right> <ESC>>>A

" ======================== Neo-term ========================
    map <A-f> :TREPLSendFile<CR>
    vmap <A-CR> <Plug>(neoterm-repl-send)
    nmap <A-CR> <Plug>(neoterm-repl-send-line)j


" ======================= UltiSnips ========================
    ino <silent> <c-x><c-a> <c-r>=Ulti_complete()<cr>

" ====================== visual-split ======================
    vmap <C-w>k <Plug>(Visual-Split-VSSplitAbove)
    vmap <C-w>j <Plug>(Visual-Split-VSSplitBelow)

" ======================= choosewin ========================
    nmap  -  <Plug>(choosewin)
    " +-----+-----------+----------------------------+
    " | Key | Action    | Description                |
    " +=====+===========+============================+
    " | 0   | tab_first | Select FIRST  tab          |
    " | [   | tab_prev  | Select PREVIOUS tab        |
    " | ]   | tab_next  | Select NEXT tab            |
    " | $   | tab_last  | Select LAST tab            |
    " | x   | tab_close | Close current tab          |
    " | ;   | win_land  | Navigate to current window |
    " | -   | previous  | Naviage to previous window |
    " | s   | swap      | Swap windows #1            |
    " | S   | swap_stay | Swap windows but stay #1   |
    " +-----+-----------+----------------------------+

" ======================= winteract ========================
    nmap + :InteractiveWindow<CR>
    " +--------------------------+-----------------+
    " | Key                      | Action          |
    " +==========================+=================+
    " | j/k/h/l                  | resize          |
    " | F                        | fullwidth       |
    " | f                        | fullheight      |
    " | o (!closes all others)   | fullscreen      |
    " | =                        | equalize        |
    " | &                        | width=textwidth |
    " | s/v                      | [v]split        |
    " | x/c                      | close           |
    " | Alt + [jkhl]             | focus           |
    " | w/W                      | next/prev       |
    " | H/J/K/L                  | move window     |
    " | m{h/j/k/l} or g{h/j/k/l} |                 |
    " | mx or gx                 | exchange        |
    " | n/p, <S-TAB>/<TAB>       | change buffer   |
    " | <ESC>, <CR>              | exit mode       |
    " +--------------------------+-----------------+

" ===================== vim-table-mode =====================
    " +-------------+---------------------------------+
    " | Key         | Action                          |
    " +=============+=================================+
    " | <leader>t   | Prefix for table mode commands. |
    " | <leader>tt  | Tablelize                       |
    " | <leader>tm  | Toggle table mode               |
    " | <leader>ts  | Sort a column                   |
    " | <leader>tr  | Realigns table columns          |
    " | <leader>tdd | Delete the table row            |
    " | <leader>tdc | Delete table column             |
    " | <leader>tfa | Add a fomula for  table cell.   |
    " | <leader>tfe | Evaluate the formula line       |
    " | ||          | Expands to a header border.     |
    " | [|          | Move to previous cell           |
    " | ]|          | Move to next cell               |
    " | {|          | Move to the cell above          |
    " | }|          | Move to the cell below          |
    " +-------------+---------------------------------+


" ====================== vim-fugitive ======================
    " |-----|---------------------------------|
    " | Key | Action                          |
    " |-----|---------------------------------|
    " | -   | 添加/删除文件                   |
    " | \   | 向下分割一个窗口打开当前文件    |
    " | P   | 为当前文件运行 “git add -patch” |
    " | C   | 调用 :Gcommit                   |
    " |-----|---------------------------------|

" ======================= vim-eunuch =======================
    " |-------------------|----------------------------------------------------------------------|
    " | Key               | Action                                                               |
    " |-------------------|----------------------------------------------------------------------|
    " | :Delete           | Delete a buffer and the file on disk simultaneously.                 |
    " | :Unlink           | Like:Delete, but keeps the now empty buffer.                         |
    " | :Move             | Rename a buffer and the file on disk simultaneously.                 |
    " | :Rename           | Like: Move, but relative to the current file's containing directory. |
    " | :Chmod            | Change the permissions of the current file.                          |
    " | :Mkdir            | Create a directory, defaulting to the parent of the current file.    |
    " | :Cfind            | Run find and load the results into the quickfix list.                |
    " | :Clocate          | Run locate and load the results into the quickfix list.              |
    " | :Lfind / :Llocate | Like above, but use the location list.                               |
    " | :Wall             | Write every open window. Handy for kicking off tools like guard.     |
    " | :SudoWrite        | Write a privileged file with sudo.                                   |
    " | :SudoEdit         | Edit a privileged file with sudo.                                    |
    " |-------------------|----------------------------------------------------------------------|

" ================= plantuml-previewer.vim =================

    autocmd FileType plantuml nmap <silent> <leader>m :PlantumlOpen<CR>
    " +---------------------------+-------------+
    " | Command                   | Action      |
    " +===========================+=============+
    " | :PlantumlSave diagram.png | save to png |
    " | :PlantumlSave diagram.svg | save to svg |
    " +---------------------------+-------------+

" ====================================================== Plugin KeyBindings End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 10. DIY KeyBindings                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==================== Smart close by q ====================
    " 原始q录制宏可以按 <A-q>
    nnoremap <silent> q :call SmartClose()<cr>
    nnoremap <silent> Q :Bclose<CR>
    nnoremap <C-q> :wqa<CR>
    nnoremap <silent> <A-q> q

" ===================== Smart Folding ======================
    autocmd FileType markdown,vim nmap <buffer> <silent> <Tab> zr
    autocmd FileType markdown,vim nmap <buffer> <silent> <S-Tab> zm

" ===================== Hungry delete ======================
    nmap <BS> <Esc>vgelda

" ===================== Buffer Switch ======================
    map [b :bp<CR>
    map ]b :bn<CR>

" ====================== vim-surround ======================
    vmap ( S)
    vmap ) S)
    vmap [ S]
    vmap ] S]
    vmap ' S'
    vmap ` S`

" ============ Smart Search by * in visual mode ============
    vnoremap * y<Esc>0/<C-R>"<CR>

" ==================== Save all buffers ====================
    map <leader>s :wa<CR>

" =============== Show folder of current dir ===============
    map <leader>o :!open %:p:h<CR>
    

" ==================== Testing .....??? ====================
    " nmap ,f: :%s/：/:/g<CR>
    " nmap ,f, :%s/，/, /g<CR>
    " nmap ,f,, :%s/,/, /g<CR> :%s/,  /, /g<CR>
    " nmap ,f( :%s/（/(/g<CR>
    " nmap ,f) :%s/）/)/g<CR>

" ========================================================= Awesome KeyMaps End


