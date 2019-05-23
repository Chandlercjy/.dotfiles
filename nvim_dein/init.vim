"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein Installation                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let s:dein_path = expand('~/.cache/dein')

    function! s:AskContinue(msg)
        let l:my_input=input(a:msg . "[y/n]?")
        if l:my_input == 'n'
            exit
        elseif l:my_input == 'y'
            echo "Continue..."
        else
            call s:AskContinue()
        endif
    endf

    if !isdirectory(s:dein_path)
        let s:dein_scirpt = '/tmp/installer.sh'
        let s:save_cmd = '!curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ' . s:dein_scirpt
        let s:install_cmd = '!sh ' . s:dein_scirpt . " " . s:dein_path
        if executable("curl")
            echo "Run Command: " . s:save_cmd
            call s:AskContinue("Continue?")
            execute s:save_cmd
        else
            echo 'Command "curl" is not executable. Please Install curl'
            exit
        endif

        echo "Run Command: " . s:install_cmd
        call s:AskContinue("Continue?")
        execute s:install_cmd
        call s:AskContinue("Start to download plugins?")
    endif
" ====================================================== Dein Installation end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
    let g:dein#install_max_processes = 16
    let g:dein#enable_notification = 1
    let g:dein#install_progress_type = 'title'
    let g:dein#install_log_filename = '~/.tmp/dein.log'

    let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
    let s:toml_dir = expand('~/.config/nvim/config')
    let s:default_toml = s:toml_dir.'/deindefault.toml'
    let s:lazy_toml = s:toml_dir.'/deinlazy.toml'

    if dein#load_state(s:dein_path)
        call dein#begin(s:dein_path, [expand('<sfile>'), s:default_toml, s:lazy_toml])
        try
            call dein#load_toml(s:default_toml, {'lazy': 0})
            call dein#load_toml(s:lazy_toml, {'lazy': 1})
        catch /.*/
            echoerr v:exception
            echomsg 'Error loading ...'
            echomsg 'Caught: ' v:exception
            echoerr 'error plugin.toml config'
        endtry
        call dein#end()
        if ! s:is_sudo
        call dein#save_state()
        endif
        if dein#check_install()
            " Installation check.
        call dein#install()
        endif
    endif
" ==================================================== Dein Configurations end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Configurations                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    execute 'source' expand('~/.config/nvim/init-default.vim')
    execute 'source' expand('~/.config/nvim/init-utils.vim')
    execute 'source' expand('~/.config/nvim/init-theme.vim')

    let s:init_custom=expand('~/.config/nvim/init-custom.vim')
    if filereadable(expand(s:init_custom))
        execute 'source' s:init_custom
    endif
" ==================================================== Load Configurations end
