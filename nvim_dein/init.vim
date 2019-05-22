" dein 插件安装
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein Configurations                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
    let g:dein#install_max_processes = 16
    let g:dein#install_progress_type = 'echo'
    let g:dein#enable_notification = 1
    let g:dein#install_progress_type = 'title'
    let g:dein#install_log_filename = '~/.tmp/dein.log'

    let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
    let $CACHE = expand('~/.cache')
    let s:path = expand('$CACHE/dein')
    let s:toml_dir = expand('~/.config/nvim/config')
    let s:default_toml = s:toml_dir.'/deindefault.toml'
    let s:lazy_toml = s:toml_dir.'/deinlazy.toml'

    if dein#load_state(s:path)
        call dein#begin(s:path, [expand('<sfile>'), s:default_toml, s:lazy_toml])
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

    execute 'source' expand('~/.config/nvim/init-default.vim')
    execute 'source' expand('~/.config/nvim/init-utils.vim')
    execute 'ru' expand('~/.config/nvim/init-custom.vim')

