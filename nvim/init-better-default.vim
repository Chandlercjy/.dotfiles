" ==============================
" System Setting 系统设置
" ==============================

"设置24 bit True color
if has("termguicolors")
    set termguicolors
endif

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
set nu  " show line numbers
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


" 使find指令可用
set path+=**

set whichwrap=b,h,l,<,>,[,]  "list of menu_flags specifying which commands wrap to another line
set showtabline=1  "always show the tabline
