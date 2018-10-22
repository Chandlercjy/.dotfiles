


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

"
" ALE 设置快捷键
nmap <Space>] <Plug>(ale_next)
nmap <Space>[ <Plug>(ale_previous)
nmap <F7> :ALEToggle<CR>
nmap <leader>f  :ALEFix<CR>:wa<CR>



" ==============================
" 代码补全
" ==============================

" UltiSnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"




" 设置YouCompleteMe

"set completeopt=longest,menu "关闭弹出原型窗口的功能
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_show_diagnostics_ui = 0 "关闭静态检查
let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
let g:ycm_complete_in_comments = 1 " 在注
let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_invoke_completion = '<C-a>' " 主动调用补全
"
"Vim补全
"autocmd FileType vim let b:vcm_tab_complete = 'vim'


" ==============================
" 其他
" ==============================
"

" Python 语法高亮
let g:python_highlight_all = 1
set re=1 " python语法高亮后会延迟,换用旧款正则表达式引擎即可修复
"set ttyfast
"set lazyredraw

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1 " 忽略大小写
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"let g:EasyMotion_use_upper = 1
""let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz;'




" vim-gfm-syntax markdown语法高亮
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json','python', 'r']

" Markdown table formatter ,快捷键为 <leader>tm
let g:table_mode_corner='|'


" ===================== Nerd Commenter =====================
let g:NERDSpaceDelims = 1
let g:NERDDefaultNesting = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCreateDefaultMappings = 1
