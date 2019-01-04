" # Funcs

fun! template#MakeConfig()
    call inputsave()
    let name = input('Enter new config name (without .vim): ')
    call inputrestore()
    execute ":e ~/.config/nvim/after/ftplugin/" . name . ".vim"
endf 

fun!  template#MakePlugin()
    call inputsave()
    let name = input('Enter new plugin name (without .vim): ')
    call inputrestore()
    execute ":e ~/.config/nvim/autoload/" . name . ".vim"
endf 

fun!  template#MakeSkeleton()
    call inputsave()
    let name = input('Enter new skeleton name: skeleton.')
    call inputrestore()
    execute ":e ~/.config/nvim/skeletons/skeleton." . name
endf 

fun!  template#MakeNewFile(path, inputText, ext)
    let l:filename = substitute(input(a:inputText), '^\s*', '', '')
    execute "e " . a:path . "/" . l:filename . a:ext
endf 


