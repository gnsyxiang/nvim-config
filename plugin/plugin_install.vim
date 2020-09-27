" ===============================================================
" 
" Release under GPLv-3.0.
" 
" @file    plugin_install.vim
" @brief   
" @author  gnsyxiang <gnsyxiang@163.com>
" @date    27/09 2020 08:22
" @version v0.0.1
" 
" @since    note
" @note     note
" 
"     change log:
"     NO.     Author              Date            Modified
"     00      zhenquan.qiu        27/09 2020      create the file
" 
"     last modified: 27/09 2020 08:22
" ===============================================================

" Add the dein installation directory into runtimepath
let &runtimepath = &runtimepath.','.g:vim_plugin_path.'/repos/github.com/Shougo/dein.vim'

if dein#load_state(g:vim_plugin_path)
     call dein#begin(g:vim_plugin_path)
 
     call dein#add(g:vim_plugin_path.'/repos/github.com/Shougo/dein.vim')
     call dein#add('wsdjeg/dein-ui.vim')
 
call dein#end()
call dein#save_state()
endif

