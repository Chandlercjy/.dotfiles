
" ================== Initialize Which-key ==================
    set timeoutlen=500
    " let g:mapleader = ","

    " 高亮prefix
    autocmd! FileType which_key
    autocmd FileType which_key highlight WhichKeyGroup guifg=PaleGoldenrod
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    call which_key#register(',', 'g:comma_prefix_dict')
    call which_key#register('<SPACE>', 'g:space_prefix_dict')
    call which_key#register('[', 'g:left_parentheses_prefix_dict')
    call which_key#register(']', 'g:right_parentheses_prefix_dict')
    nnoremap <silent> , :<c-u>WhichKey ','<CR>
    nnoremap <silent> <SPACE> :<c-u>WhichKey '<SPACE>'<CR>

" ====================== Comma-prefix ======================
    let g:comma_prefix_dict =  {}
    let g:space_prefix_dict =  {}
    let g:left_parentheses_prefix_dict = {}
    let g:right_parentheses_prefix_dict = {}
    let g:comma_prefix_dict.y = "yank to clipboard"

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
                \ 'c': [':call ConcealLevelToggle()'       , 'ConcealLevelToggle']        ,
                \ 'C': [':call ComfortableMotionToggle()'  , 'Comfortable-Motion-Toggle'] ,
                \ 'b': [':call BackgroundColorToggle()'    , 'BackgroundColorToggle']     ,
                \ 't': [':TableModeToggle'                 , 'table-mode-Toggle']         ,
                \ }


    " 复制达到剪贴板
    let g:comma_prefix_dict.f = [':ALEFix | wa'               , 'ALEFix and save']
    let g:comma_prefix_dict.q = [':call QuickfixToggle()'     , 'QuickfixToggle']
    let g:comma_prefix_dict.l = [':call LocationListToggle()' , 'LocationListToggle']
    let g:comma_prefix_dict.r = [':call AsyncRun_Code()'      , 'AsyncRun Code!']
    let g:comma_prefix_dict.s = [':AsyncStop'                 , 'AsyncStop']
    let g:comma_prefix_dict.g = ['<Plug>(coc-definition)'         , 'coc-definition']




" ====================== Space-prefix ======================
    let g:space_prefix_dict.v = {
                \ 'name' : '+Neovim_Config'                  ,
                \ 's': [':FZF ~/.config/nvim'                , 'Search config']    ,
                \ 'i': [':e ~/.config/nvim/init.vim'         , 'init.vim']         ,
                \ 'd': [':e ~/.config/nvim/init-default.vim' , 'init-default.vim'] ,
                \ 'u': [':e ~/.config/nvim/init-utils.vim'   , 'init-utils.vim']   ,
                \ 'c': [':e ~/.config/nvim/init-custom.vim'  , 'init-custom.vim'],
                \ 't': [':e ~/.config/nvim/config/deindefault.toml'  , 'deindefault.toml'],
                \ 'l': [':e ~/.config/nvim/config/deinlazy.toml'  , 'deinlazy.toml']
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
                \ 'p' : [':Gitpush' , 'fugitive-push']                        ,
                \ }

    let g:space_prefix_dict.s = {
                \ 'name' : '+Swoop/Search' ,
                \ 's' : [':call SwoopMultiSelection()' , 'swoop-multi-selection'] ,
                \ 'w' : [':Windows'                    , 'Windows-search']        ,
                \ 'hc' : [':History:'                  , 'History-Commands']      ,
                \ 'hs' : [':History/'                  , 'History-Search']        ,
                \ 'c' : [':Colors'                     , 'Colors-Search']         ,
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

    let g:space_prefix_dict.a = [':Ag'                             , 'Ag-search']
    let g:space_prefix_dict.b = [':Buffers'                        , 'Buffer-list']
    let g:space_prefix_dict.h = [':call HighlightSearchToggle()'   , 'HighlightSearchToggle']
    let g:space_prefix_dict.u = [':MundoToggle'                    , 'MundoToggle']
    let g:space_prefix_dict['[']  = ['<Plug>(coc-diagnostic-prev)' , "coc-dianostic-previous"]
    let g:space_prefix_dict[']'] = ['<Plug>(coc-diagnostic-next)'  , "coc-dianostic-next"]

    let g:space_prefix_dict['-']  = [':SSave! default' , "Save-Session-default"]
    let g:space_prefix_dict['=']  = [':SLoad default' , "Load-Session-default"]

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


" =================== Parentheses-prefex ===================
    let g:left_parentheses_prefix_dict.g  = ['<Plug>GitGutterNextHunk', "GitGutterNextHunk"]
    let g:right_parentheses_prefix_dict.g = ['<Plug>GitGutterPrevHunk', "GitGutterPrevHunk"]


    let g:left_parentheses_prefix_dict.a  = ['<Plug>(ale_previous)' , "ALE_previous"]
    let g:right_parentheses_prefix_dict.a = ['<Plug>(ale_next)'     , "ALE_NEXT"]

" ================== Finalized Which-key ===================
