

" Mapping



" wiki stuff


add(g:vimwiki_list,{'path': '~/vimwiki/$1/', 'index': 'index'})

nnoremap <leader>wr :exe "vsplit ~/vimwiki/$1/diary/week-" . strftime("%V") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
nnoremap <leader>wd :exe "vsplit ~/vimwiki/$1/diary/" . strftime("%Y-%m-%d") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
nnoremap <leader>wm :exe "vsplit ~/vimwiki/$1/diary/" . strftime("%Y-%B") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
nnoremap <leader>wq :exe "vsplit ~/vimwiki/$1/diary/Quarter-" . GetQuarter() . "-" . strftime("%Y") . ".wiki"<cr><esc>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o


augroup wiki
    autocmd! bufEnter ~/vimwiki/$1/diary/*.wiki inoremap <buffer> <tab> <esc>:wall<cr>:bdelete<cr>
    autocmd! bufLeave ~/vimwiki/$1/diary/*.wiki silent! wall
    autocmd! bufLeave ~/vimwiki/$1/diary/*.wiki :w | :bdelete
augroup end
