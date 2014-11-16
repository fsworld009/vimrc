" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif
 
 "General settings
 set backspace=2                        "enable backspace key
 set tabstop=4 shiftwidth=4 expandtab   "insert 4 spaces for a tab, display tab characters as 4 spaces
 

let $PATH .= ";C:\\Program Files (x86)\\Git\\bin"
 
 
 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 autocmd FileType html setlocal shiftwidth=2 tabstop=2 "set indention to 2 spaces for HTML files
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'hail2u/vim-css3-syntax'
 NeoBundle 'ap/vim-css-color'
 NeoBundle 'othree/html5-syntax.vim'
 NeoBundle 'jelera/vim-javascript-syntax'
 NeoBundle 'othree/javascript-libraries-syntax.vim'
 let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs'
 
 
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
