let g:toggle_config = 0
function! toggle#Config()
    if (g:toggle_config)
        let g:toggle_config = 0
        b#
    else

        let g:toggle_config = 1
        let l:bufnum = bufnr($MYVIMRC)
        if (l:bufnum > 0)
            execute ":buf " . l:bufnum
        else
            edit $MYVIMRC
        endif
    endif
endfunction


