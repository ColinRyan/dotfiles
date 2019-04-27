

" Mapping



vnoremap <localleader>mc :call UltiSnips#SaveLastVisualSelection()<cr>gvd :call template#MakeNewFile("./i$4/Components", "new component name:", ".js")<cr>
nnoremap <localleader>mc :call template#MakeNewFile("./$4/Components", "new component name:", ".js")<cr>
vnoremap <localleader>ms :call UltiSnips#SaveLastVisualSelection()<cr>gvd :call template#MakeNewFile("./$4/Service", "new Service name:", ".js")<cr>
nnoremap <localleader>ms :call template#MakeNewFile("./$4/Services", "new Service name:", ".js")<cr>
vnoremap <localleader>mv :call UltiSnips#SaveLastVisualSelection()<cr>gvd :call template#MakeNewFile("./$4/Views", "new view name:", ".js")<cr>
nnoremap <localleader>mv :call template#MakeNewFile("./$4/Views", "new View name:", ".js")<cr>
vnoremap <localleader>ml :call UltiSnips#SaveLastVisualSelection()<cr>gvd :call template#MakeNewFile("./$4/Libs", "new library name:", ".js")<cr>
nnoremap <localleader>ml :call template#MakeNewFile("./$4/Libs", "new library name:", ".js")<cr>
vnoremap <localleader>ma :call UltiSnips#SaveLastVisualSelection()<cr>gvd :call template#MakeNewFile("./$4/Libs/ApiClients/", "new api client name:", ".js")<cr>
nnoremap <localleader>ma :call template#MakeNewFile("./$4/Services/ApiClients/", "new api client name:", ".js")<cr>

" linting and fixing

let g:ale_fixers = {}
g:ale_fixers["$2"] = [$3]

" wiki stuff

let g:vimwiki_list = []
call add(g:vimwiki_list,{'path': '~/vimwiki/$1/', 'index': 'index'})

nnoremap <leader>wr :exe "vsplit ~/vimwiki/$1/diary/week-" . strftime("%V") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
nnoremap <leader>wd :exe "vsplit ~/vimwiki/$1/diary/" . strftime("%Y-%m-%d") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
nnoremap <leader>wm :exe "vsplit ~/vimwiki/$1/diary/" . strftime("%Y-%B") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
nnoremap <leader>wq :exe "vsplit ~/vimwiki/$1/diary/Quarter-" . GetQuarter() . "-" . strftime("%Y") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o


augroup wiki
    autocmd! bufEnter ~/vimwiki/$1/diary/*.wiki inoremap <buffer> <tab> <esc>:wall<cr>:bdelete<cr>
    autocmd! bufLeave ~/vimwiki/$1/diary/*.wiki silent! wall
    autocmd! bufLeave ~/vimwiki/$1/diary/*.wiki :w | :bdelete
augroup end
