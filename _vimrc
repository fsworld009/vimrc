" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif
 
 "General settings
 set backspace=2                        "enable backspace key
 set tabstop=4 shiftwidth=4 expandtab   "insert 4 spaces for a tab, display tab characters as 4 spaces
 :let mapleader = ","
 nnoremap <C-Left> <C-w><Left>
 nnoremap <C-Right> <C-w><Right>
 nnoremap <C-Up> <C-w><Up>
 nnoremap <C-Down> <C-w><Down>
 
 "Add git directory to $PATH for NeoBundle to work
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
 NeoBundle 'scrooloose/nerdtree'
 nnoremap <leader>nt :NERDTree<Enter>
 NeoBundle 'Yggdroot/indentLine'
 
 " HTML
 autocmd FileType html setlocal shiftwidth=2 tabstop=2 "set indention to 2 spaces for HTML files
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'othree/html5-syntax.vim'

 " CSS
 NeoBundle 'hail2u/vim-css3-syntax'
 NeoBundle 'ap/vim-css-color'
 NeoBundle 'KabbAmine/vCoolor.vim'

 "javascript
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
