" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif


 " runtime paths
 let s:plugin_path = "~/vim/bundle/"
 
 "force English
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

 
 " General settings
 set backspace=2                        "enable backspace key
 set tabstop=4 shiftwidth=4 expandtab   "insert 4 spaces for a tab, display tab characters as 4 spaces
 let mapleader = ","                    "change leader key to ','
 "set nowrap                               "no auto word wrapping
 
 " Use bash
 "set shell="sh.exe --login -i"
 "set shellcmdflag="--login -i"
 
 " abbreviated motion keys for split moving
 nnoremap <C-Left> <C-w><Left>
 nnoremap <C-Right> <C-w><Right>
 nnoremap <C-Up> <C-w><Up>
 nnoremap <C-Down> <C-w><Down>
 
 " abbreviated motion keys for tab moving
 nnoremap <C-Tab> gt
 nnoremap <C-S-Tab> gT
 
 " abbreviated motion keys for tab moving
 nnoremap ]b :bn<CR>
 nnoremap [b :bp<CR>
 nnoremap ]B :buffers<CR>
 " abbreviated motion keys for quickfix moving
 nnoremap ]c :cnext<CR>
 nnoremap [c :cprevious<CR>
 nnoremap ]C :copen<CR>

 "close buffers/kill buffers
 nnoremap [B :buf 
 nnoremap [d :bd 
 nnoremap [D :bd<CR>
 nnoremap [C :close<CR>
 
 " editor styling, colorscheme specified after the scheme file is loaded
 syntax on
 
 set number
 set hlsearch
 
 " UTF-8
 set encoding=utf-8
 setglobal fileencoding=utf-8
 setglobal nobomb
 
 "folding settings http://smartic.us/2009/04/06/code-folding-in-vim/
 set foldmethod=indent   "fold based on indent
 set foldnestmax=10      "deepest fold is 10 levels
 set nofoldenable        "dont fold by default
 set foldlevel=1         
 
 "Find and Replace (substitute)
 nnoremap <leader>fr :%s///gcI

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
 NeoBundle 'Xuyuanp/nerdtree-git-plugin'
 nnoremap <leader>nt :NERDTreeToggle<CR>

 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'fsworld009/obsidian2.vim'
 NeoBundle 'tpope/vim-surround'

 "NeoBundle 'scrooloose/syntastic'
 "let g:syntastic_quiet_messages = { "type": "style","level": "warnings"} 
 let g:syntastic_check_on_open = 1
 let g:syntastic_enable_highlighting=0
 "active mode is broken when NERDTree is opened, workaround
 "autocmd BufWritePost *.* SyntasticCheck
 
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

 NeoBundle 'b3niup/numbers.vim' 
 "Numbers key bindings
 nnoremap <F3> :NumbersToggle<CR>
 nnoremap <F4> :NumbersOnOff<CR>

 NeoBundle 'majutsushi/tagbar'
 nmap <leader>tb :TagbarToggle<CR>

 NeoBundle 'Shougo/neocomplcache.vim'
 "let g:tagbar_ctags_bin = '~/vim/bin/ctags.exe' "this directory is already in $PATH, so this line is useless
 
 NeoBundle 'bling/vim-airline'
 let g:airline_theme = 'powerlineish'
 let g:airline#extensions#branch#enabled=1
 let g:airline#extensions#tabline#enabled = 1
 set laststatus=2
 
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'gregsexton/gitv'
 
 source ~/projectview.vim 

 " HTML, XML
 autocmd FileType html,markdown,xml setlocal shiftwidth=2 tabstop=2 "set indention to 2 spaces for HTML files
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'othree/html5-syntax.vim'
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 let g:syntastic_html_checkers = ['tidy']
 let g:syntastic_html_tidy_exec = 'tidy5'
 NeoBundle 'valloric/MatchTagAlways'

 " CSS
 NeoBundle 'hail2u/vim-css3-syntax'
 NeoBundle 'ap/vim-css-color'
 NeoBundle 'KabbAmine/vCoolor.vim'
 NeoBundle 'mtscout6/vim-tagbar-css'
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 let g:syntastic_css_checkers = ['csslint']

 "javascript
 NeoBundle 'jelera/vim-javascript-syntax'
 NeoBundle 'othree/javascript-libraries-syntax.vim'
 let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs'
 let g:syntastic_js_checkers = ['jshint']
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
