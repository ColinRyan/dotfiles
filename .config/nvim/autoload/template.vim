fun!  template#MakePlugin()
    call inputsave()
    let name = input('Enter new plugin name: ')
    call inputrestore()
    execute ":e ~/.config/nvim/autoload/" . name
endf 

fun!  template#MakeSkeleton()
    call inputsave()
    let name = input('Enter new skeleton name: ')
    call inputrestore()
    execute ":e ~/.config/nvim/skeletons/skeleton." . name
endf 

fun!  template#MakeNewFile()
    let l:path = expand('%:h')
    let l:filename = substitute(input('new filename:'), '^\s*', '', '')
    execute "e " . l:path . "/" . l:filename
endf 


