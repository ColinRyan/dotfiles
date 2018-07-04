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



function! toggle#Buffer()
  b#
endfunction

fun!  toggle#Normal(a, b)
    let x = {'i': 0, '0': a:a, '1': a:b}

    function x.funcall() dict
        " exe "normal " . self[self.i]
        " echom self[self.i]
        " let self.i = (self.i + 1) % 2
    endfunction
    return x
endf 


