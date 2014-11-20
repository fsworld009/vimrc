" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif
 
 " runtime paths
 let s:git_path = "C:\\Program Files (x86)\\Git\\bin"
 let s:bin_path = $HOME . "\\vim\\bin"
 let s:plugin_path = "~/vim/bundle/"
 
 " General settings
 set backspace=2                        "enable backspace key
 set tabstop=4 shiftwidth=4 expandtab   "insert 4 spaces for a tab, display tab characters as 4 spaces
 let mapleader = ","                    "change leader key to ','
 set nowrap                               "no auto word wrapping
 
 " abbreviated motion keys for split moving
 nnoremap <C-Left> <C-w><Left>
 nnoremap <C-Right> <C-w><Right>
 nnoremap <C-Up> <C-w><Up>
 nnoremap <C-Down> <C-w><Down>
 
 " abbreviated motion keys for tab moving
 nnoremap <C-Tab> gt
 nnoremap <C-S-Tab> gT
 
 " editor styling, colorscheme specified after the scheme file is loaded
 syntax on
 set guifont=Dejavu\ Sans\ Mono:h10
 set number
 set hlsearch
 
 " UTF-8
 set encoding=utf-8
 setglobal fileencoding=utf-8
 setglobal nobomb
 
 " Add git directory to $PATH for NeoBundle to work properly
 let $PATH .= ";" . s:git_path
 " Add bin directory to $PATH for Tagbar
 let $PATH .= ";" . s:bin_path

 "redirect ex-command output to register x
 redir @x
 
 
 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   execute "set runtimepath+=" .  s:plugin_path . "neobundle.vim/"
 endif

 " Required:
 call neobundle#begin(expand(s:plugin_path))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 NeoBundle 'scrooloose/nerdtree'
 nnoremap <leader>nt :NERDTree<Enter>
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'vim-scripts/obsidian2.vim'
 NeoBundle 'tpope/vim-surround'

 
 "vim-misc is required for vim-session
 NeoBundle 'xolox/vim-misc'
 NeoBundle 'xolox/vim-session'
 let g:session_autosave = 'yes'
 let g:session_autoload = 'yes'
 let g:session_autosave_periodic = 10
 
 "Surround plugin command remaps (all commands begin with <leader>s, it just makes more sense to me)
 "cs ysiw ds yss (V)S
 nmap <leader>sc cs
 nmap <leader>sd ds
 nmap <leader>sw ysiw
 nmap <leader>sW ysiW
 nmap <leader>ss yss
 vmap <leader>s S
 
 NeoBundle 'tpope/vim-repeat'

 NeoBundle 'Lokaltog/vim-easymotion'
 let g:neocomplcache_enable_at_startup = 1
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

 NeoBundle 'majutsushi/tagbar'
 nmap <leader>tb :TagbarOpen<CR>

 NeoBundle 'Shougo/neocomplcache.vim'
 "let g:tagbar_ctags_bin = '~/vim/bin/ctags.exe' "this directory is already in $PATH, so this line is useless
 
 NeoBundle 'bling/vim-airline'
 let g:airline#extensions#tabline#enabled = 1
 
 source ~/projectview.vim 

 " HTML, XML
 autocmd FileType html setlocal shiftwidth=2 tabstop=2 "set indention to 2 spaces for HTML files
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'othree/html5-syntax.vim'
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

 " CSS
 NeoBundle 'hail2u/vim-css3-syntax'
 NeoBundle 'ap/vim-css-color'
 NeoBundle 'KabbAmine/vCoolor.vim'
 NeoBundle 'mtscout6/vim-tagbar-css'
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

 "javascript
 NeoBundle 'jelera/vim-javascript-syntax'
 NeoBundle 'othree/javascript-libraries-syntax.vim'
 let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs'
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 NeoBundle 'marijnh/tern_for_vim'
 
 
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on
 colorscheme obsidian2

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
