" ========================== ALE ===========================
    let g:ale_python_mypy_executable = 'mypy'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    let g:ale_javascript_prettier_options = '--config ~/.prettierrc'
    let g:ale_fixers = {
                \   'vim': ['remove_trailing_lines','trim_whitespace'],
                \   'uml': ['remove_trailing_lines','trim_whitespace'],
                \   'python': ['isort','black','yapf','remove_trailing_lines','trim_whitespace'],
                \   'markdown': ['prettier','remove_trailing_lines','trim_whitespace'],
                \   'cpp': ['clang-format','remove_trailing_lines','trim_whitespace'],
                \   'c': ['clang-format','remove_trailing_lines','trim_whitespace'],
                \   'typescript': ['prettier','remove_trailing_lines','trim_whitespace'],
                \   'javascript': ['prettier','importjs', 'remove_trailing_lines', 'trim_whitespace' ],
                \   'html': ['prettier','remove_trailing_lines','trim_whitespace'],
                \   'json': ['prettier','remove_trailing_lines','trim_whitespace'],
                \   'sh': ['shfmt','remove_trailing_lines','trim_whitespace'],
                \   'go': ['gofmt','goimports','remove_trailing_lines','trim_whitespace'],
                \   'cmake': ['cmakeformat','remove_trailing_lines','trim_whitespace'],
                \   'yaml': ['prettier','remove_trailing_lines','trim_whitespace'],
                \}


    " 保存时自动调整
    autocmd FileType python let g:ale_fix_on_save = 0

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


