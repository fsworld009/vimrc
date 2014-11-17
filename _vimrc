" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif
 
 "General settings
 set backspace=2                        "enable backspace key
 set tabstop=4 shiftwidth=4 expandtab   "insert 4 spaces for a tab, display tab characters as 4 spaces
 :let mapleader = ","                   "change leader key to ','
 
 "abbreviated motion keys for split moving
 nnoremap <C-Left> <C-w><Left>
 nnoremap <C-Right> <C-w><Right>
 nnoremap <C-Up> <C-w><Up>
 nnoremap <C-Down> <C-w><Down>
 
 " editor styling, colorscheme specified after the scheme file is loaded
 syntax on
 set guifont=Dejavu\ Sans\ Mono:h10
 set number
 set hlsearch
 
 "Add git directory to $PATH for NeoBundle to work properly
 let $PATH .= ";C:\\Program Files (x86)\\Git\\bin"

 "redirect ex-command output to register x
 redir @x
 
 
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
 NeoBundle 'vim-scripts/obsidian2.vim'
 NeoBundle 'tpope/vim-surround'
 
 "Surround plugin remap (all commands begin with <leader>s, it just makes more sense to me)
 "cs ysiw ds yss (V)S
 nmap <leader>sc cs
 nmap <leader>sd ds
 nmap <leader>sw ysiw
 nmap <leader>sl yss
 vmap <leader>s S
 
 NeoBundle 'tpope/vim-repeat'

 NeoBundle 'Lokaltog/vim-easymotion'
 "EasyMotion key bindings
 nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-s2)
 nmap <Plug>(easymotion-prefix)<Down> <Plug>(easymotion-j)
 nmap <Plug>(easymotion-prefix)<Up> <Plug>(easymotion-k)
 nmap <Plug>(easymotion-prefix)/   <Plug>(easymotion-sn)
 nmap <Plug>(easymotion-prefix).   <Plug>(easymotion-repeat)

 "NeoBundle 'b3niup/numbers.vim' "Need fork and improvement
 "Numbers key bindings
 nnoremap <F3> :NumbersToggle<CR>
 nnoremap <F4> :NumbersOnOff<CR>

 
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
 colorscheme obsidian2

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck