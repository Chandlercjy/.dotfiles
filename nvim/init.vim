"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "               Vim-Plug              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"UI
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree',{ 'on':  'NERDTreeToggle' }
" 主题美化类
Plug 'drewtempelmeyer/palenight.vim'
Plug 'yggdroot/indentline'


" 左边栏显示mark
Plug 'kshenoy/vim-signature', {'on': []}


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', {'on': []}



" 搜索
Plug 'junegunn/fzf', {'on': 'FZF', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', {'on': 'FZF'}


"通用插件
"Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree',{ 'on':  'UndotreeToggle' }



" 通用编辑类
Plug 'scrooloose/nerdcommenter', {'on': []}
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround', {'on': []}


" 代码插件
Plug 'skywind3000/asyncrun.vim', {'on': 'AsyncRun'}
Plug 'w0rp/ale', {'on': []}
Plug 'Valloric/YouCompleteMe',{'do': './install.py --clang-completer' }
Plug 'dyng/ctrlsf.vim',{'on':'CtrlSF'}
Plug 'vim-python/python-syntax', {'for' : 'python'}
Plug 'bfrg/vim-cpp-modern'
Plug 'leafgarland/typescript-vim'

"补全
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Markdown插件
Plug 'iamcco/mathjax-support-for-mkdp',{'for':'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for':'markdown'}
Plug 'mzlogin/vim-markdown-toc',{'for':'markdown'}


" 试用
Plug 'xolox/vim-misc'
Plug 'sillybun/vim-autodoc'


" 文件管理
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'



" ========================== 实用类 ===========================
" 快速跳转
Plug 'easymotion/vim-easymotion', {'on': []}
Plug 'tpope/vim-repeat'
Plug 'gcmt/wildfire.vim'

" 记录编程时间
Plug 'wakatime/vim-wakatime', {'on': []} 
" 对齐格式
Plug 'junegunn/vim-easy-align'
" 快捷键帮助视图
Plug 'liuchengxu/vim-which-key'
" 检查启动时间
Plug 'tweekmonster/startuptime.vim'
" 可以自动创建文件夹不报错
Plug 'pbrisbin/vim-mkdir'
"舒服的滚动
Plug 'yuttie/comfortable-motion.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

"Plug 'Shougo/denite.nvim'


"Plug 'dhruvasagar/vim-table-mode'
"Plug 'terryma/vim-expand-region'
"Plug 'roxma/vim-tmux-clipboard'
"Plug 'KangOl/vim-pudb'
"Plug 'idanarye/vim-vebugger'
"Plug 'Shougo/vimproc.vim'





call plug#end()
"
augroup lazy_load
    autocmd!
    autocmd InsertEnter * call plug#load('vim-wakatime') | autocmd! lazy_load
    autocmd InsertEnter * call plug#load('nerdcommenter') | autocmd! lazy_load
    autocmd InsertEnter * call plug#load('vim-surround') | autocmd! lazy_load
    autocmd InsertEnter * call plug#load('vim-easymotion') | autocmd! lazy_load
    autocmd InsertEnter * call plug#load('ale') | autocmd! lazy_load
    autocmd InsertEnter * call plug#load('vim-signature') | autocmd! lazy_load
    autocmd InsertEnter * call plug#load('vim-gitgutter') | autocmd! lazy_load
augroup END

" ========================= 读取配置文件 =========================
source ~/.config/nvim/utils.vim
source ~/.config/nvim/init-better-default.vim
source ~/.config/nvim/init-packages.vim
source ~/.config/nvim/init-keybinding.vim
source ~/.config/nvim/init-ui.vim

"在当前目录下新建一个custom.vim的文件加载自己的自定义配置, 文件不存在时不报错
"ru init-custom.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                        "                Others               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1


    " Neovim 设置
    let g:python_host_skip_check=1
    let g:python3_host_skip_check=1
    let g:python3_host_prog='python'
    let g:python_host_prog='python2'


     "Neovim Terminal变换
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l

endif

let g:ycm_python_binary_path = 'python'



" =================== Comfortable-motion ===================
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>


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


