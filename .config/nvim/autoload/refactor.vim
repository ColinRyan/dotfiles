" # Funcs
"
"
" WordValue
" const WordValue = 'cat'

fun! refactor#sub()

    exe "normal mx"
    let l:startingTag = tagbar#currenttag('%s', '')
    let lineNum = search("\\(let [lagbwtv]:\\|const \\|var \\|let \\|$\\)" . expand("<cword>") . " =", 'bn') 
    if l:lineNum > 0

        exe "normal " . l:lineNum . "G"
        echom "found"
        if l:startingTag == tagbar#currenttag('%s', '')
            exe "normal f=wy$`xpiwF "
            if &ft == 'vim'
                s/[lagbwtv]://
            endif
            exe "normal `xe"
            
        else
            echom "Couldn't find a suitable local variable to swap "
            exe "normal <c-o>"
        endif

    endif


    

endf 


fun! refactor#Move()
    execute "normal! gvd"
    execute "Denite file/rec:" . "~/.config/nvim/autoload"
    execute "normal! Gp"
endf

