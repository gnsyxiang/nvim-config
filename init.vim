" ===============================================================
" 
" Release under GPLv-3.0.
" 
" @file    init.vim
" @brief   
" @author  gnsyxiang <gnsyxiang@163.com>
" @date    27/09 2020 08:21
" @version v0.0.1
" 
" @since    note
" @note     note
" 
"     change log:
"     NO.     Author              Date            Modified
"     00      zhenquan.qiu        27/09 2020      create the file
" 
"     last modified: 27/09 2020 08:21
" ===============================================================

" 关闭vi兼容模式，这个命令会影响后续命令，建议第一个设置
if &compatible
    set nocompatible
endif

let g:vim_plugin_path = '~/data/opt/vim_plugin'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugin/plugin_install.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugin/plugin_config.vim'

filetype plugin indent on
syntax enable

