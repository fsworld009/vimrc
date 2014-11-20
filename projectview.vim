" modified from: http://unix.stackexchange.com/questions/92942/gvim-nerdtree-and-tagbar-above-each-other-left-to-edited-file

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
        return
    endif

    if nerdtree_open
        NERDTreeClose
    elseif tagbar_open
        TagbarClose
    endif
    NERDTree
    TagbarOpen
    wincmd K
    wincmd j
    wincmd L

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor  
 endfunction
 nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
