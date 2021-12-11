"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" System Better Default                                                    "
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
    set nowritebackup
    set noswapfile                           " 不产生临时备份文件
    set undofile                             " tell it to use an undo file
    set undodir=~/.vimundo/                  " set a directory to store the undo history
    set undolevels=1000                      " max number of undos
    set undoreload=10000                     " max lines to to save for undo
    set hidden                               " vim切换buffer(文件/tab)后仍然保留undo
    set updatetime=300
    set shortmess+=c
    set signcolumn=yes

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
    " set foldmethod=indent                    " 基于语法进行代码折叠
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
" Awesome CMD                                                              "
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
" Initialize Neovim                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1

        " Neovim 设置
        let g:python_host_skip_check=1
        let g:python3_host_skip_check=1
        let g:python3_host_prog='~/.pyenv/shims/python3'
        let g:python_host_prog=''

        "Neovim Terminal变换
        tnoremap <C-h> <C-\><C-N><C-w>h
        tnoremap <C-j> <C-\><C-N><C-w>j
        tnoremap <C-k> <C-\><C-N><C-w>k
        tnoremap <C-l> <C-\><C-N><C-w>l
    endif

    if (has("termguicolors"))
        set termguicolors
    endif

" ============================================================== Initialize End


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DIY KeyBindings                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==================== Smart close by q ====================
    nnoremap <silent> Q :Bclose<CR>
    nnoremap <silent> q :call SmartClose()<cr>
    nnoremap <silent> <A-q> q
    nnoremap <C-q> :wqa<CR>

" ===================== Smart Folding ======================
    autocmd FileType markdown,vim,toml nmap <buffer> <silent> <Tab> zr
    autocmd FileType markdown,vim,toml nmap <buffer> <silent> <S-Tab> zm

" ===================== Hungry delete ======================
    nmap <BS> <Esc>vgelda

" ===================== Buffer Switch ======================
    map [b :bp<CR>
    map ]b :bn<CR>

" ============ Smart Search by * in visual mode ============
    vnoremap * y<Esc>0/<C-R>"<CR>

" ==================== Save all buffers ====================
    map <leader>s :wa<CR>

" =============== open folder of current dir ===============
    map <leader>o :!open %:p:h<CR>

" ========================================================= Awesome KeyMaps End
    " 更加智能的当前行高亮
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline

    " 复制到剪贴板
    map ,y "+y
    " 剪贴板粘贴到vim
    map ,p "+p
