set nocompatible

filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin(stdpath('data') . 'plugged')
" let Vundle manage Vundle, required

imap <leader>nl <Plug>Vimwiki#tbl#kbd_tab()

let g:loaded_html_ftplugin = 1


" Plugins


Plug 'projekt0n/github-nvim-theme' 


Plug 'briones-gabriel/darcula-solid.nvim' 


Plug 'rktjmp/lush.nvim' 


Plug 'nickkadutskyi/jb.nvim' 


Plug 'huggingface/llm.nvim' 

Plug 'nvim-neotest/nvim-nio'


Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

Plug 'HakonHarnes/img-clip.nvim'

Plug 'TimotheeSai/git-sessions.nvim' 


Plug 'stevearc/dressing.nvim' 


"Plug 'zbirenbaum/copilot.lua' 


"Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main'}


Plug 'andymass/vim-matchup' 


Plug 'nvim-lualine/lualine.nvim' 


"Plug 'echasnovski/mini.hipatterns' 


Plug 'jinh0/eyeliner.nvim' 



Plug 'ColinRyan/sin.nvim' 


" Plug 'Olical/nfnl' 

Plug 'folke/neodev.nvim'

Plug 'mtth/scratch.vim' 


Plug 'nvim-treesitter/playground'

" Plug 'topaxi/gh-actions.nvim' 


"Plug 'github/copilot.vim' 



Plug 'RRethy/nvim-treesitter-textsubjects' 

"Plug 'dpayne/CodeGPT.nvim' 

Plug 'thmsmlr/gpt.nvim' 

Plug 'theHamsta/nvim-dap-virtual-text' 

" Plug 'freddiehaddad/feline.nvim' 

Plug 'brenoprata10/nvim-highlight-colors'

Plug 'nanozuki/tabby.nvim' 

Plug 'sindrets/diffview.nvim'

" meh"
"Plug 'hood/popui.nvim'

" @review

" This plugin is used to create menus
" https://github.com/meznaric/conmenu?tab=readme-ov-file
Plug 'meznaric/conmenu' 


" @review
Plug 'm-demare/hlargs.nvim' 

Plug 'jackMort/ChatGPT.nvim' 

Plug 'rcarriga/nvim-notify'

" Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'echasnovski/mini.ai', { 'branch': 'stable' }

" useful. Explore more.
Plug 'windwp/nvim-ts-autotag' 

" config needs work.
Plug 'windwp/nvim-autopairs' 

Plug 'gbprod/substitute.nvim' 

Plug 'ibhagwan/smartyank.nvim' 

Plug 'folke/which-key.nvim' 

Plug 'ldelossa/litee.nvim'  " Utility lib

Plug 'ldelossa/gh.nvim' 

" " Plug 'romgrk/barbar.nvim'

Plug 'lewis6991/gitsigns.nvim' 

" Plug 'nathom/filetype.nvim' 

Plug 'MunifTanjim/nui.nvim'

" " Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'kyazdani42/nvim-web-devicons'

Plug 'https://gitlab.com/yorickpeterse/nvim-window.git' 


" Plug 'norcalli/nvim-colorizer.lua' 


Plug 'jparise/vim-graphql' 


Plug 'mfussenegger/nvim-dap-python' 


Plug 'ElmCast/elm-vim' 


Plug 'tpope/vim-rhubarb' 

Plug 'fannheyward/telescope-coc.nvim' 


Plug 'tommcdo/vim-ninja-feet' 


Plug 'nvim-treesitter/nvim-treesitter-textobjects' 


Plug 'nvim-lua/popup.nvim'

Plug 'nvim-lua/plenary.nvim'

" " Plug 'code-biscuits/nvim-biscuits'

Plug 'mfussenegger/nvim-dap'

Plug 'rcarriga/nvim-dap-ui'

Plug 'Pocco81/DAPInstall.nvim'

"Plug 'glepnir/dashboard-nvim'

Plug 'edluffy/specs.nvim'

Plug 'nvim-telescope/telescope.nvim' 

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'tsbohc/zest.nvim' 


Plug 'editorconfig/editorconfig-vim' 


Plug 'gennaro-tedesco/nvim-peekup' 


Plug 'ojroques/nvim-osc52' 


Plug 'Olical/nvim-local-fennel'

"Plug 'tpope/vim-obsession' 


" Plug 'gcmt/taboo.vim' 


Plug 'w1mvy/vim-denite-tab' 


"Plug 'leafgarland/typescript-vim' 


"Plug 'peitalin/vim-jsx-typescript' 


"Plug 'styled-components/vim-styled-components' 


" Plug 'voldikss/vim-translator' 


Plug 'ryanoasis/vim-devicons' 


Plug 'sodapopcan/vim-twiggy' 


Plug 'junegunn/gv.vim' 


Plug 'neoclide/denite-git' 


Plug 'tpope/vim-abolish' 


Plug 'whiteinge/diffconflicts' 


" Plug 'camspiers/animate.vim' 


Plug 'blueyed/vim-diminactive' 

" Plug 'vimtaku/vim-textobj-keyvalue' 

Plug 'tpope/vim-sexp-mappings-for-regular-people' 


Plug 'guns/vim-sexp' 


Plug 'Olical/conjure' , {'tag':'v4.53.0'}


" Plug 'liuchengxu/vim-clap' 


Plug 'bakpakin/fennel.vim'



Plug 'Olical/aniseed', {'tag': 'v3.23.0'}

Plug 'rhysd/git-messenger.vim'

Plug 'FooSoft/vim-argwrap'

Plug 'mattn/emmet-vim'

" Plug 'OmniSharp/omnisharp-vim'

Plug 'liuchengxu/vista.vim' 

"Plug 'ColinRyan/sin' 

" Plug 'fvictorio/vim-extract-variable'

" Plug 'justinmk/vim-sneak'

"Plug 'vim-scripts/matchit.zip'

Plug 'easymotion/vim-easymotion' 

Plug 'fvictorio/vim-yank-queue' 

Plug 'thalesmello/vim-textobj-methodcall' 

" Plug 'idanarye/vim-vebugger' 

"Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Plug 'rbong/pimodoro' 

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Chun-Yang/vim-textobj-chunk' 

" " Plug 'neoclide/vim-jsx-improve' 

Plug 'tweekmonster/dyslexic.vim' "Finds mistyped text

" " Plug 'jacobsimpson/nvim-example-lua-plugin' 

" " Plug 'ludovicchabant/vim-gutentags' 

" " Plug 'kentaro/vim-textobj-function-php'

Plug 'tommcdo/vim-lion' 

" " Plug 'bps/vim-textobj-python'

" " Plug 'kana/vim-textobj-lastpat' 

" " Plug 'godlygeek/tabular'

Plug 'pbrisbin/vim-mkdir' 

" " Plug 'alvan/vim-closetag' 

" " Plug 'tommcdo/vim-express' 

Plug 'Julian/vim-textobj-variable-segment' 

Plug 'wellle/targets.vim'

" " Plug 'rhysd/vim-textobj-anyblock'

" " Plug 'thinca/vim-textobj-between' "This caused a bug in delete function

Plug 'mhinz/vim-startify' 

Plug 'tmux-plugins/vim-tmux-focus-events' 

" " Plug 'noahfrederick/vim-laravel' 

" " Plug 'danro/rename.vim'

" Plug 'galooshi/vim-import-js' 

Plug 'brooth/far.vim' 

Plug 'ton/vim-bufsurf' 

" " Plug 'wokalski/autocomplete-flow' 

" " Plug 'itchyny/calendar.vim' 

Plug 'michaeljsmith/vim-indent-object'

" " Plug 'raghur/vim-textobj-line'

"Plug 'othree/jspc.vim'

" " Plug 'poetic/vim-textobj-javascript'

" " Plug 'thinca/vim-textobj-function-javascript'

Plug 'whatyouhide/vim-textobj-xmlattr'
     
" " Plug 'jelera/vim-javascript-syntax'

" " Plug 'carlitux/deoplete-ternjs'
     
" " Plug 'mxw/vim-jsx'
     
" " Plug 'chemzqm/vim-jsx-improve'
     
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-projectionist'

" Fucking useless right now
Plug 'ColinRyan/vim-skeletons'

" Plug 'roxma/LanguageServer-php-neovim'
     
"Plug 'jceb/vim-orgmode'
     
"" Plug 'roxma/nvim-completion-manager'
     
"" Plug 'junegunn/vim-peekaboo'
     
" Plug 'tpope/vim-cucumber'
     
"Plug 'c9s/phpunit.vim'
     
"" Plug 'autozimu/LanguageClient-neovim'
     
"Plug 'Shougo/echodoc.vim'
     
Plug 'elzr/vim-json'
    
"Plug 'MaxMellon/vim-jsx-pretty'
    
"" Plug 'kana/vim-textobj-function'
    
Plug 'kana/vim-textobj-user'
    
Plug 'kana/vim-operator-user'
    
"" Plug 'rafi/vim-denite-z'
    
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
    
"" Plug 'MattesGroeger/vim-bookmarks'
    
"" Plug 'sampson-chen/sack'

"Plug 'metakirby5/codi.vim'

"" Plug 'brooth/far.vim'

"" Plug 'blueshirts/darcula'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-unimpaired'

Plug 'machakann/vim-swap'

"" Plug 'adoy/vim-php-refactoring-toolbox'

"" Plug 'chriskempson/base16-vim'

Plug 'sniphpets/sniphpets'

Plug 'sniphpets/sniphpets-common'

"" Plug 'Shougo/deoplete.nvim'

"" Plug 'padawan-php/deoplete-padawan'

"Plug 'docteurklein/neovim-php'

"Plug 'scrooloose/nerdcommenter'

"Plug 'noahfrederick/vim-composer'

Plug 'simnalamburt/vim-mundo'

"" Plug 'ColinRyan/auto-pairs'

"" Plug 'gmarik/Vundle.vim'


Plug 'tpope/vim-fugitive'

"Plug 'StanAngeloff/php.vim'
 
"Plug 'pangloss/vim-javascript'

"Plug 'jwalton512/vim-blade'

Plug 'ctrlpvim/ctrlp.vim'

"" Plug 'vim-airline/vim-airline'

"" Plug 'vim-airline/vim-airline-themes'

Plug 'christoomey/vim-tmux-navigator'

"" Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree'

"Plug 'Xuyuanp/nerdtree-git-plugin'

""Plug 'Valloric/YouCompleteMe'

"" Plug 'shawncplus/phpcomplete.vim'

Plug 'benmills/vimux'

"" Plug 'joonty/vdebug'

Plug 'vimwiki/vimwiki'

"" Plug 'lambdatoast/elm.vim'

"" Plug 'swekaj/php-foldexpr.vim'
"" Plug 'rayburgemeestre/phpfolding.vim'

"" Plug 'majutsushi/tagbar'

"" Plug 'joonty/vim-taggatron'

Plug 'ColinRyan/vim-test'

Plug 'mattn/gist-vim'

"Plug 'othree/html5.vim'

Plug 'tpope/vim-surround'

"" Plug 'weierophinney/argumentrewrap'

"" Plug 'airblade/vim-gitgutter'

"" Plug 'ternjs/tern_for_vim'

"" Plug 'othree/yajs.vim'

"" Plug 'othree/javascript-libraries-syntax.vim'

"" Plug 'othree/es.next.syntax.vim'

"" Plug 'isRuslan/vim-es6'

"" Plug 'lvht/phpcd.vim'

"Plug 'honza/vim-snippets'

Plug 'SirVer/ultisnips'

""Plug 'joonty/vim-phpqa.git'

" Plug 'w0rp/ale'

""Plug 'neomake/neomake'

call plug#end()

" Talon
"let &titlestring ='VIM MODE:%{mode()} - (%f) %t'

"OBS
let &titlestring ='NVIM'
set title

" set title
" autocmd BufEnter * let &titlestring ='VIM - (%f) %t'
" set title " required for neovim

" Text Objects

" call textobj#user#plugin('selfclosingtag', {
"             \   'tag': {
"             \      'pattern': ['<', '/>'],
"             \      'select-a': 'aT',
"             \      'select-i': 'iT',
"             \   },
"             \})


lua <<EOF

function ReloadConfig()
    for name, _ in pairs(package.loaded) do
        if name:match('^user_config') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.fn.stdpath('config') .. '/lua/init.lua')
end

function initFNL()

    local nvim = require("aniseed.nvim")
    local compile = require("aniseed.compile")


    config_dir = nvim.fn.stdpath("config")
    compile.glob("**/*.fnl", (config_dir .. "/fnl"), (config_dir .. "/lua") )
    package.loaded["dotfiles.init"] = nil
    _G["dotfiles.init"] = nil
    require("dotfiles.init")
    nvim.command("source $MYVIMRC")
end

function translateWordUnderCursor()
    local wordToTranslate = vim.api.nvim_call_function("expand", { "<cword>" })
    local translations = {}

    translations["end"] = "begin"
    translations["const"] = "let"
    translations["var"] = "const"
    translations["let"] = "var"
    translations["begin"] = "end"
    translations["px"] = "em"
    translations["em"] = "rem"
    translations["rem"] = "px"
    translations["false"] = "true"
    translations["False"] = "True"
    translations["true"] = "false"
    translations["True"] = "False"
    translations["public"] = "private"
    translations["private"] = "protected"
    translations["protected"] = "public"
    translations["no"] = "yes"
    translations["yes"] = "no"
    translations["off"] = "on"
    translations["on"] = "off"
    translations["start"] = "stop"
    translations["stop"] = "start"






    if translations[wordToTranslate] then 
        vim.api.nvim_command("normal! ciw" .. translations[wordToTranslate] )
    else
        print('word not in translations')
    end
end


EOF


" tabs

" set sessionoptions+=tabpages,globals

" call vundle#end()            " required
" Easymotion

" let g:EasyMotion_do_mapping = 0

" Lion

" let b:lion_squeeze_spaces = 1

" Git Gutter

" let g:gitgutter_max_signs = 1200
" let g:gitgutter_diff_args = "-w"
" Surround

" let g:surround_indent = 0

" OmniSharp

" Use ctrlp.vim
" let g:OmniSharp_selector_ui = 'ctrlp'  

" Use the stdio version of OmniSharp-roslyn:
" let g:OmniSharp_server_stdio = 1

" VISTA

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
" let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }
" let g:vista_default_executive = 'coc'
" let g:vista_sidebar_width = 60

" Sneak

" let g:sneak#label = 1

" let javaScript_plugin_flow = 1

" vimwiki VimWiki

" let g:vimwiki_list = []
            " \{'path': '~/vimwiki/foreshadowme/', 'index': 'index'},
            " \{'path': '~/vimwiki/streaming/', 'index': 'index'},
            " \{'path': '~/vimwiki/writing/', 'index': 'index'}
 
" let g:sneak#label = 1
" let g:tmux_navigator_save_on_switch = 2

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#auto_complete_start_length = 1

"Add extra filetypes
" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'vue'
"                 \ ]

" These lines are here for phpcd

" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_delay = 1000 
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_save = 1
" let g:ale_set_quickfix = 0
" let g:ale_set_loclist = 0
" let g:ale_open_list = 0
" let g:ale_keep_list_window_open = 0
" let g:ale_fix_on_save = 1



" let g:ale_linters = {
" \    'php': ['php','phpcs', 'phpmd', 'phpstan', 'php-cs-fixer', 'phan'],
" \    'javascript': ['flow', 'tsserver'],
" \    'javascript.jsx': ['flow', 'tsserver'],
" \    'python': ['pycodestyle', 'mypy', 'flake8', 'prospector', 'pyflakes'],
" \    'flow': ['flow', 'tsserver'],
" \    'json': [],
" \    'elm': ['elm_ls'],
" \    'jsx': [ 'flow', 'tsserver'],
" \    'cs': [ 'OmniSharp' ]
" \
" \}

" let g:ale_fixers = {
" \    'php': ['phpcbf','php_cs_fixer'],
" \    'python': ['black', 'isort'],
" \    'css': ['prettier'],
" \    'sass': ['prettier'],
" \    'scss': ['prettier'],
" \    'javascript': ['importjs', 'prettier'],
" \    ' -pjavascript.jsx': ['importjs', 'prettier'],
" \    'jsx': [ 'importjs']
" \}

"let g:neomake_php_enabled_makers = ['php', 'phpmd', 'phpcs']

"let g:neomake_verbose=3

"let g:neomake_list_height = 1


"autocmd! BufWritePost,BufEnter  * Neomake


" let g:taggatron_verbose = 0

" let test#strategy = "neovim"

"let g:ycm_auto_trigger = 1


" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * :call vista#RunForNearestMethodOrFunction()


" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<leader>e"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetsDir = $HOME . "/.vim/snippets/UltiSnips"
" let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME . '/.vim/snippets/UltiSnips']
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line

filetype plugin indent on


"Plugins config

" let g:closetag_filenames='*.html,*.xhtml,*.phtml,*.js'
" let g:closetag_xhtml_filenames='*.xhtml,*.jsx,*.js'
" let g:closetag_filetypes='html,xhtml,phtml,js'
" let g:closetag_xhtml_filetypes='xhtml,jsx,js'

" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'


" let skeletons#skeletonsDir = "~/.config/nvim/skeletons"
" let skeletons#autoRegister = 1

" let g:jsx_ext_required = 0

" let g:javscript_plugin_flow = 1


" let g:loaded_python_provider = 1
" let g:python_host_skip_check=1
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_skip_check=1
" let g:python3_host_prog = '/usr/bin/python3'

" let g:ctrlp_max_files=30001 
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_working_path_mode = 'wr'
" let g:ctrlp_cmd = 'CtrlPTag'
" let g:ctrlp_lazy_update = 1
" let g:ctrlp_by_filename = 1
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_root_markers =  ['composer.json', '.gitignore']

" let g:ctrlp_open_func = { "files": 'GoToMostImportantPlace' }
" if executable('rg')
    " use rg for ack
    " let g:ackprg = 'rg --vimgrep --no-heading'

    " use rg over grep
    " set grepprg=rg\ --color=never

    " Use rg in CtrlP
    " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    " let g:ctrlp_use_caching = 0



    " call denite#custom#var('grep', 'command', ['rg'])
    " call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
    " call denite#custom#var('grep', 'recursive_opts', [])
    " call denite#custom#var('grep', 'pattern_opts', ['--regexp'])
    " call denite#custom#var('grep', 'separator', ['--'])
    " call denite#custom#var('grep', 'final_opts', [])

" endif

" let g:tagbar_autoclose = 1
" let g:tagbar_autofocus = 1
" let g:tagbar_show_linenumbers = 2
" let g:tagbar_compact = 1

" let NERDTreeShowLineNumbers = 1


" let g:LanguageClient_rootMarkers = ['.flowconfig']
" let g:LanguageClient_autostart = 1
" " let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
" let g:LanguageClient_diagnosticDisplay = {}
" let g:LanguageClient_serverCommands = {
"     \ 'php': ['php', $HOME . '/.vim/bundle/LanguageServer-php-neovim/vendor/felixfbecker/language-server/bin/php-language-server.php'],
"     \ 'javascript': ['./node_modules/.bin/flow', 'lsp'],
"     \ 'javascript.jsx': ['./node_modules/.bin/flow', 'lsp'],
"     \ 'python': ['pyls']
"         \}


" call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', 'Up', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', 'Down', '<denite:move_to_previous_line>', 'noremap')

"Vimux settings

" let g:VimuxUseNearest = 1

" let mapleader = ","
" let maplocalleader = "-"


"Vim test

" let test#stategy = "vimux"

" let g:dispatch_compilers = { }
" let g:dispatch_compilers['./vendor/bin/'] = ''
" let g:dispatch_compilers['phpunit'] = 'phpunit'

" Debugger

" let g:vebugger_leader='<leader>d'
""""""""""""""""""""""

" Abbreviations



""""""""""""""""""""""
" Mapping


" vnoremap <leader>c :OSCYank<CR>  


" nnoremap <leader>nt :tabnew<cr>


" nnoremap gt :Denite tab<cr>

" nmap <silent> <Leader>tl <Plug>TranslateR
" vmap <silent> <Leader>tl <Plug>TranslateRV

" nnoremap <leader>gg :Twiggy<cr> 
" nnoremap <leader>gs :vertical Git<cr> 
" nnoremap <silent> <Leader>lr <Plug>TranslateR
" nnoremap <leader>gr :Gr<cr> 

" nnoremap <leader>gw :Gw<cr> 

" nnoremap " :Clap registers<cr> 

" nmap s <Plug>(easymotion-s2)


" nnoremap <leader>b :Clap buffers<cr>  


" nnoremap <leader>y :Clap yanks<cr>  
" nnoremap " :Clap registers<cr>  


" nnoremap <leader>x :ArgWrap<cr>




" nmap pe w%pp=`]


" nnoremap <space>gs /scss<cr>:noh<cr>gf




" Remember <bar instead of |

" nnoremap  <leader>q :if bufname("%") == "" <bar> :q <bar> else <bar> :wq <bar> endif<cr>

" vnoremap dd :g/./d<cr>
" vnoremap dc :g/console/d<cr>

" Moving back and forth between lines of same or lower indentation.
" nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
" nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
" nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
" nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
" vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
" vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
" vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
" vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
" onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
" onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
" onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
" onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

" nmap <leader>ss $%

" let b:coc_root_patterns = ['.git', '.env']

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :Telescope coc diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :Telescope coc extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :Telescope coc commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :Telescope coc outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" " Remap for do codeAction of selected region, ex: `<leader>acap` for current paragraph
" xmap <leader>ac  <Plug>(coc-codeaction-selected)<cr>
" nmap <leader>ac  <Plug>(coc-codeaction)
" nmap <leader>cl  <Plug>(coc-codelens-action)
" nmap ga  <Plug>(coc-codeaction-cursor)


" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()


" " nmap <leader>I   }I


" nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)

" nnoremap } :call search('^\s*$', '')<CR>
" nnoremap { :call search('^\s*$', 'b')<CR>


" nnoremap zk zk%^
" nnoremap zj zj^



" nmap mcat vat<localleader>mc  

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction




" inoremap <silent><expr> <C-TAB> copilot#Accept("\<CR>")

" inoremap <silent><expr> <TAB> coc#pum#visable() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <S-TAB> coc#pum#visable() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <c-space> coc#refresh()

" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" nnoremap <leader>av :AV<cr>
" nnoremap <leader>aa :A<cr>  


" nmap ril vil,e
" nmap ri{ vi{,e
" nmap ric vic,e

vnoremap pp p
vnoremap po "_dP

nnoremap <expr> p PutOperator()

nnoremap <silent> pp o<esc>P=`]

nnoremap <silent> P O<esc>p




" nmap <silent> P O<esc>P

nnoremap C-I C-I  
nnoremap C-O C-O  


nnoremap zA zAzt  


nmap du( "ddi(dack"d]p
nmap du{ "ddi{dack"d]p
nmap dut "dditdat"d]p

" nnoremap s, /,<cr>:noh<cr>  

nnoremap d; dv/;<cr>:noh<cr>  

nnoremap 'a 'azt  

nnoremap 's 'szt  




" onoremap r; v/;<cr>:noh<cr>
" onoremap r) /)<cr>:noh<cr>
" onoremap r( /($\\|(\()\)\@!<cr>:noh<cr>
" onoremap r} /}\( from\\| =\)\@!/e<cr>:noh<cr>
" onoremap r{ /\(={\)\@<={\\|\([=:]\s\+\)\@<={\\|\([,(]\s\{0,1}\)\@<={/e<cr>:noh<cr>
" onoremap rt /\(\/\/.*\\|\w\)\@<!<\w/e<cr>:noh<cr>
" nnoremap sf /[^ .]\w*(/<cr>
" nnoremap s; /;/e<cr>
" nnoremap s) /)$/e<cr>
" nnoremap s( /($\\|(\()\)\@!/e<cr>
" nnoremap s} /}\( from\\| =\)\@!/e<cr>
" nnoremap s{ /\(={\)\@<={\\|\([=:]\s\+\)\@<={\\|\([,(]\s\{0,1}\)\@<={/e<cr>
" nnoremap st /\(\/\/.*\\|\w\)\@<!<\w/e<cr>
" nnoremap sdo /\(const \)\@<={/e<cr>

nnoremap <leader>tt :lua translateWordUnderCursor()<cr>


snoremap <c-j> <esc>:call UltiSnips#JumpForwards()<cr>
snoremap <c-k> <esc>:call UltiSnips#JumpBackwards()<cr>

inoremap <c-j> <esc>:call UltiSnips#JumpForwards()<cr>
inoremap <c-k> <esc>:call UltiSnips#JumpBackwards()<cr>

nnoremap ri( df(f)x 


nnoremap <Leader>if :ImportJSWord<CR>
nnoremap <Leader>ix :ImportJSFix<CR>

"nnoremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'gk'
"nnoremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'gj' 


" nnoremap <leader>/ :Denite grep<cr>

nnoremap <leader>l :call LocationListToggle()<cr>
" I never use the following. Change PublicPrivateToggle to just togle and use it!
" 2018-09-12 Wed 05:44 PM
" nnoremap <leader>t :call PublicPrivateToggle()<cr> 

" let g:openclose = toggle#Normal('dd', 'u')
" nnoremap <space> :exe g:openclose.funcall()<cr>
" nnoremap <space><space> zazt




" Wiki stuff
" nnoremap <leader>wr :exe "vsplit ~/vimwiki/diary/week-" . strftime("%V") . ".wiki"<cr>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
" nnoremap <leader>wd :exe "vsplit ~/vimwiki/diary/" . strftime("%Y-%m-%d") . ".wiki"<cr>Go<cr><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o

" let g:vimwiki_table_mappings = 0
" nnoremap <leader>wss :vsplit ~/vimwiki/Scratchpad.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o
" nnoremap <leader>wp :vsplit ~/vimwiki/Problems.wiki<CR>O<esc>i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
" nnoremap <leader>wl :vsplit ~/vimwiki/LessonsLearned.wiki<CR>O<esc>i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o
" nnoremap <leader>wf :vsplit ~/vimwiki/improvements.wiki<CR>O<esc>i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR><Esc>o

" Forgot this existed
" 2018-09-12 Wed 05:44 PM
" nnoremap <leader>rnf :Rename
nmap <leader>rnw <Plug>(coc-rename)

nnoremap <leader>rnt :TabRename 

" This goes to open or closed. BUUUUG
nnoremap <leader>zj :call NextClosedFold('j')<cr>
nnoremap <leader>zk :call NextClosedFold('k')<cr>

nnoremap <leader>gv `[v`]

nnoremap <silent> <Plug>gotoClass /class <cr>:noh<cr>zazt
\:call repeat#set("\<Plug>gotoClass")<CR>
" These mappings are confusing me. localleader stuff in the project .nvimrc uses g{x} 
" to designate traveling to a file. I don't rememeber them either. Probably overloaded
" 2018-09-12 Wed 05:44 PM
nmap <localleader>gcc <Plug>gotoClass
nmap <localleader>gcdm /componentDidMount()<cr>:noh<cr>ztzO
nmap <localleader>gt /# Types<cr>:noh<cr>ztzO
nmap <localleader>gf /# Funcs<cr>:noh<cr>]]ztzO
nmap <localleader>gl /# Logic<cr>:noh<cr>jztzO
nmap <localleader>ge /# Effects<cr>:noh<cr>jztzO
nmap <localleader>gc /# Callacks<cr>:noh<cr>jztzO

nmap <localleader>gs /# Global State<cr>:noh<cr>jztzO

nmap <localleader>ls /# Local State<cr>:noh<cr>jztzO



nmap <localleader>gl /# Lifecycle<cr>:noh<cr>]]ztzO
nmap <localleader>gr /# Render<cr>:noh<cr>ztzO
nmap <localleader>gm /" Mapping<cr>:noh<cr>zt

nnoremap <localleader>xx ][ 

nnoremap tn :TestNearest<cr>  
nnoremap tf :TestFile<cr>  
nnoremap ts :TestSuite<cr>  
nnoremap tl :TestLast<cr>  
nnoremap tv :TestVisit<cr>  


nnoremap <localleader><localleader> :vsplit ./.lnvim.fnl<cr>


vnoremap s :s/
vnoremap <leader>rm :call refactor#Move()<CR>  


nnoremap <leader>mnf :call template#MakeNewFile()<CR>  
nnoremap <leader>mca :call template#MakeConfigAfter()<CR>
nnoremap <leader>mp  :call template#MakePlugin()<CR>
nnoremap <leader>msk :call template#MakeSkeleton()<CR>
nnoremap <leader>mr  :call AddType("rules", "ri")<cr>
nnoremap <leader>mf  :call AddType("\# Funcs", "fn")<cr>
nnoremap <leader>mst  :call AddType("\# Stories", "pub")<cr>
nnoremap <leader>msc  :call AddType("\# Style", "cs")<cr>
nnoremap <leader>mm  :call AddType("\# Memo", "mm")<cr>
nnoremap <leader>mi  :call AddType("\# Imports", "i")<CR>
nnoremap <leader>mut :call AddType("\# Tests", "ut")<CR>
nnoremap <leader>mt  :call AddType("\# Types", "t")<CR>

nnoremap <leader>msh  :call AddType("\# Hooks", "uH")<CR>
nnoremap <leader>mse  :call AddType("\# Effects", "uE")<CR>
nnoremap <leader>mcc  :call AddType("\# Callbacks", "uc")<CR>



nnoremap <leader>mls  :call AddType("\# Local State", "uS")<CR>

nnoremap <leader>mgs  :call AddType("\# Global State", "ugs")<CR>

nnoremap <leader>mvc  :call AddType("\# Voice Commands", "normal")<CR>

nnoremap <leader>mivc  :call AddType("\# Voice Commands", "insert")<CR>

nnoremap <leader>mtvc  :call AddType("\# Voice Commands", "term")<CR>

nnoremap <leader>mxvc  :call AddType("\# Voice Commands", "ex")<CR>

nnoremap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Never use it 2018-09-12 Wed 05:44 PM
" nnoremap <leader>w :mks!<cr>:w<cr> 

" nnoremap <C-v>  :wq<CR> 

nnoremap <C-q> ::wq<CR> 
inoremap <C-q> ::wq<CR> 

" nnoremap <C-f> :CtrlP<cr>

" nnoremap <C-f> :Denite -start-filter file/rec <CR>
" let mapleader = "\<space>"

" let g:AutoPairsFlyMode = 0
" let g:AutoPairsShortcutBackInsert = '<M-b>'
" Create/edit snippets

nnoremap <leader>u :UltiSnipsEdit<CR>
"move line up
" nnoremap <s-j> ddj<s-p>==
" nnoremap <s-k> ddk<s-p>==
    
nmap <C-_> gcc
vmap <C-_> gc


" deoplete tab-complete
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<C-h>"
" Fold Toggle
" nnoremap <space> zazt

" Tagbar Toggle
" not used often 2018-09-12 Wed 05:45 PM
nnoremap <leader>f :Vista!!<CR>

" Toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" nnoremap <F5> :set invpaste paste?<Enter>
" imap <F5> <C-O><F5>

" make a split and switch to it
nnoremap <leader>V :vnew<CR>
" nmap <leader>v :vnew<CR><C-f>

" Movement
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" navigate panels
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" remove highlight
nnoremap <leader><space><space> :noh<cr>

" nnoremap <tab> %
" vnoremap <tab> %

" vimrc
"noremap <leader><leader> :vsplit $MYVIMRC<cr>
nnoremap <leader>S :source $MYVIMRC<cr>


" change the first word to return
" noremap <leader>r :s/^\S\+ \{-}=\{-}/return/<CR>


" Delete
nnoremap <leader>D "dyy"dp
nnoremap dii  `[ d`]

" Paste
" nnoremap p$  d$"0P
" nnoremap pt<space>  dt<space>"0P
" nnoremap pp p
" nnoremap p0 "0p

" nnoremap paw daw"0P
" nnoremap pa" da""0P
" nnoremap pa' da'"0P
" nnoremap pa[ da["0P
" nnoremap pa( da("0P
" nnoremap pa{ da{"0P

" nnoremap piw diw"0P
" nnoremap pi" di""0P
" nnoremap pi' di'"0P
" nnoremap pi[ di["0P
" nnoremap pi( di("0P
" nnoremap pi{ di{"0P
" nnoremap pi` di`"0P


" To command mode
inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>l
inoremap kj <ESC>


inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


"Disabled 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


nnoremap <leader>. :vsplit ~/.config/nvim/fnl/init.fnl<cr>

nnoremap <leader>, :vsplit $MYVIMRC<cr>

noremap <leader>i "ip
nnoremap <C-Tab> :call toggle#Buffer()<CR>


" nnoremap <leader>b :<C-u>Denite buffer -split=floating<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer -split=floating<CR>

" Config
" Settings

syntax on






" set encoding=utf-8
" set scrolloff=3
" set autoindent
" set cindent
" set smartindent
" set showmode
" set showcmd
" set hidden
" set wildmenu
" set wildmode=list:longest
" set wildignore+=*/.git/*,*/tmp/*,*.swp
" set visualbell
" set cursorline
" set ttyfast
" set ruler
" set backspace=indent,eol,start
" set laststatus=2
" set relativenumber " set line numbers to relative
" set undofile
" set backupcopy=yes 


"nnoremap / /\v
"vnoremap / /\v

" set ignorecase
" set smartcase
" set gdefault
" set incsearch
" set showmatch
" set hlsearch


" set wrap
"set textwidth=79
" set formatoptions=tcqrn1
" set colorcolumn=85

"Codi
let g:codi#rightalign=1
let g:codi#rightsplit=0
let g:codi#raw=0
let g:codi#width=100

"_________________
"'"'"'"''""""'"""'
"\__/\__/^-/\_____
" Folding

" set foldenable




" set foldlevel=0

" set foldnestmax=20

" set foldmethod=indent

fun! Foldex()
    "This functions shows off how folds work
    "Folds will fold like so
        "catsass
        "asssss
            "cat
            "dog
endf

highlight Folded ctermbg=black ctermfg=white

" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


autocmd! BufEnter webpack.mix.js set foldtext=MyWebpackMixFolds()

autocmd FileType json syntax match Comment +\/\/.\+$+

" Color 

let base16colorspace=256

" colorscheme sin


command! W w !sudo tee % > /dev/null

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | vnew | setlocal bt=nofile | put! a





" augroups


augroup  talon
    autocmd!

    autocmd FileType *.talon call TalonSettings()
    
augroup end 

augroup  onexit
    autocmd!
augroup end

augroup  wiki
    au BufRead, BufNewFile *.wiki setlocal textwidth=79
augroup end 

augroup  plugins
    autocmd!
    autocmd! bufwritepost */nvim/autoload/* :exe "source " .  expand('%:p')
    
augroup end 


augroup  nvimrc
    autocmd!
    autocmd! bufEnter $MYVIMRC nnoremap <buffer> <tab> <esc>:wall<cr>ZZ
    autocmd! bufEnter .nvimrc nnoremap <buffer> <tab> <esc>:wall<cr>ZZ
    autocmd! bufEnter $MYVIMRC inoremap <buffer> <tab> <esc>:wall<cr>ZZ
    autocmd! bufEnter .nvimrc inoremap <buffer> <tab> <esc>:wall<cr>ZZ
    autocmd! bufwritepost $MYVIMRC source $MYVIMRC
    autocmd! bufwritepost */nvim/skeletons :SkeletonsReload
    autocmd! bufLeave $MYVIMRC :
    autocmd! bufEnter $MYVIMRC call Initvim()
augroup end 

augroup jsx
    autocmd!
    autocmd FileType jsx LoadJsxCommands()
augroup end
 

augroup editor
    au  BufLeave   * if (len(@%)       <  1)  | :wa |        endif
    au  FocusLost  * if (len(@%)       <  1)  | :wa |        endif
    au  VimResized * if (winwidth('%') >= 70) | exe "normal! \<c-w>=" |  endif
    au  VimResized * if (winwidth('%') <  70) | exe "normal! \<c-w>   |" | endif
    au  bufEnter   * if (winwidth('%') >= 70) | exe "normal! \<c-w>=" |  endif
    au  bufEnter   * if (winwidth('%') <  70) | exe "normal! \<c-w>   |" | endif
augroup end

augroup js
    autocmd!
    autocmd FileType javascript,typescript,json,jsx,tsx call JavascriptSettings()
    " autocmd FileType javascript,typescript,json,jsx colorscheme sin
    " autocmd FileType javascript,typescript,json,jsx colorscheme darcula

augroup end

" augroup snippets
"     autocmd! bufLeave *.snippets silent! wall
"     autocmd! bufLeave *.snippets :bdelete
" augroup end


augroup vimrc
    autocmd!
    autocmd! bufwritepost .vimrc source ~/.vimrc
    autocmd! bufLeave .vimrc g:toggle_config=0
    autocmd! bufLeave .vimrc source ~/.vimrc
    autocmd! bufEnter .vimrc call Initvim()
augroup end

augroup init.vim
    autocmd!
    autocmd! bufwritepost init.vim source $MYVIMRC
    autocmd! bufLeave init.vim g:toggle_config=0
    autocmd! bufLeave init.vim source $MYVIMRC
    autocmd! FileType help wincmd L
    autocmd! bufEnter init.vim call Initvim()
augroup end

augroup startup
    autocmd!
    autocmd VimEnter * badd $MYVIMRC 
    autocmd VimEnter * call MakePluginMappings()
    autocmd! User UltiSnipsExitLastSnippet call UltiDispatcher()
    autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
    "autocmd VimEnter * :lua initFNL() 

augroup END

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

augroup php
    autocmd!
    autocmd FileType php call PhpSettings()
    " When the filetype is FILETYPE then make AutoPairs only match for parenthesis
    
    " autocmd FileType php LanguageClientStart
    " autocmd FileType php nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    " autocmd FileType php nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    " autocmd FileType php nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
augroup END


let g:takeMeBack = 0




" Funcs


function! Max(a, b)
  return a:a >= a:b ? a:a : a:b
endfunction

fun! SelectSkeleton()
    let results = luaeval('select_skeleton()')
    return results
endf

fun! TreesitterNode(row, col)
    " Check if arg1 is a number and not empty
    if a:row =~ '^\d\+$'
        let l:row = a:row-1  
    else
        let l:row = line('.')-1 
    endif

    " Check if arg2 is a number and not empty
    if a:col =~ '^\d\+$'
        let l:col = a:col
    else
        let l:col = col('.') 
    endif

    let results = luaeval('treesitter_node(_A)', [l:row,l:col])
    return results
endf

inoremap <silent><expr> <C-a> TreesitterNode(line('.'), col('.')-1)

fun! IsNodeUnderCursorAncestorOf(node_names, row, col, generation_count)
    " Check if agi1 is a list and not empty
    if type(a:node_names) != type([])
        let l:node_names = ['program']
    else
        let l:node_names = a:node_names
    endif

    " Check if arg2 is a number and not empty
    if a:row =~ '^\d\+$'
        let l:row = a:row-1
    else
        let l:row = line('.')-1
    endif

    " Check if arg3 is a number and not empty
    if a:col =~ '^\d\+$'
        let l:col = a:col
    else
        let l:col = col('.') 
    endif

    " Check if arg4 is a number and not empty
    if a:generation_count =~ '^\d\+$'
        let l:generation_count = a:generation_count - 1
    else
        let l:generation_count = line('.') - 1
    endif


    let args = { 'pos': [l:row, l:col], 'node_names': l:node_names, 'generation_count': l:generation_count}
    let results = luaeval('is_node_under_cursor_ancestor_of(_A)', args)
    return results
endf

fun! GetNodeLineage(row, col)

  " Check if arg1 is a number and not empty
  if a:row =~ '^\d\+$'
    let l:row = Max(a:row-1, 1)
  else
    let l:row = Max(line('.')-1,1)
  endif

  " Check if arg2 is a number and not empty
  if a:col =~ '^\d\+$'
    let l:col = Max(a:col-1, 1)
  else

    let l:col = Max(col('.')-1, 1)
  endif


  let args = { 'pos': [l:row, l:col]}
  echom(args)
  let results = luaeval('get_node_lineage(_A)', args)
  return results
endf
inoremap <silent><expr> <C-b> GetNodeLineage(line('.'), col('.'))

fun! HasNodeLineage(node_names, row, col)
    echo a:node_names
    " Check if agi1 is a list and not empty
    if type(a:node_names) != type([])
        let l:node_names = ['program']
    else

        let l:node_names = a:node_names
    endif

    " Check if arg2 is a number and not empty
    if a:row =~ '^\d\+$'
        let l:row = Max(a:row-1,1)
    else
        let l:row = Max(line('.')-1,1)
    endif

    " Check if arg3 is a number and not empty
    if a:col =~ '^\d\+$'
        let l:col = Max(a:col-1, 1)
    else

        let l:col = Max(col('.')-1,1)
    endif


    let args = { 'pos': [l:row, l:col], 'node_names': l:node_names}
    let results = luaeval('has_node_lineage(_A)', args)
    return results
endf

fun!  TalonSettings()
    

    " let g:AutoPairsInsert = 0
endf 


fun!  CloseOrSave()
    if bufname("%") == "" | :q  | else | :wq | endif
endf 

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

fun!  GoToMostImportantPlace(action, line)

    call call('ctrlp#acceptfile', [a:action, a:line])
    " normal -gr
endf 


fun!  GetQuarter()
    let weekNum =  strftime("%W") + 1

    if weekNum <= 13
        return 1
    endif

    if weekNum <= 13 * 2
        return 2
    endif

    if weekNum <= 13 * 3
        return 3
    endif

    if weekNum <= 13 * 4
        return 4
    endif
endf 

fun!  TestNearest()
    if expand('%') =~# '\v\.php$'
        let tag = TagBarCurrentTag
        execute "PhpUnit" expand('%') tag
    else
        TestNearest
    endif
endf 


fun!  JavascriptFoldText()
    let startLine = getline(v:foldstart)
    let endLine  = getline(v:foldend)

    let lines = getline(v:foldstart, v:foldend)
    let sub = startLine


    if match(startLine, 'import type {') >= 0
        let endNew = substitute(endLine, '^.\+from ', '', 'g')
        let sub = substitute(startLine, 'import type {', 'import type {...} = ' . endNew, 'g')
    endif


    if match(startLine, 'import {') >= 0
        let endNew = substitute(endLine, '^.\+from ', '', 'g')
        let sub = substitute(startLine, 'import {', 'import {...} = ' . endNew, 'g')
    endif

    if match(startLine, 'const {') >= 0
        let endNew = substitute(endLine, '^.\+= ', '', 'g')
        let sub = substitute(startLine, 'const {', 'const {...} = ' . endNew, 'g')
    endif

    let lineCount = len(lines)

    if lineCount < 10

        let lineCount = "0" .  lineCount 
    endif
    
    return substitute(sub, '^\( \+\)', '\1' .  lineCount . " lines: ", 'g')
endf 

fun!  Swap(text, initPos, finPos)

    echom a:text

endf 


" To get snipX to work, I'll need to use items(g:current_ulti_dict_info)
" and ultiSnips#SnippetsInCurrentScope to find the snippet, get it, and then
" do regex to replace the parts I want to replace
fun! SnipX()
    let lines = getline("'<", "'>")


    call inputsave()
    let snipName = input('Enter Snippet name:')
    call inputrestore()


    execute "normal! `<v`>C" . snipName . " "

    echo UltiSnips#SnippetsInCurrentScope()
    call UltiSnips#ExpandSnippetOrJump()
    for x in lines
        let fields = split(x, ",")
        for field in fields
            echo field
            execute "normal! i". field
            call UltiSnips#ExpandSnippetOrJump()
        endfor
    endfor
endf

fun! JavascriptSettings()



    " let g:AutoPairsInsert = 0

    set foldtext=JavascriptFoldText()

    let javaScript_fold = 0

    "autocmd FileType javascript,typescript,jsx,tsx, setlocal shiftwidth=2 tabstop=2 smartindent expandtab


endf 

fun! MakePluginMappings()
    if exists(":LanguageClientStart")
        " nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
        nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
        nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    endif

    if exists(":BufSurfForward")

        nnoremap <s-l> :BufSurfForward<cr> 
        nnoremap <s-h> :BufSurfBack<cr> 
    endif

    if exists(":ALENext")
        
        " nmap <silent> <leader>j <Plug>(ale_next_wrap)
        " nmap <silent> <leader>k <Plug>(ale_previous_wrap)
    endif
    if exists(":ImportJSWord")
        nnoremap <Leader>if :ImportJSWord<CR>
        nnoremap <Leader>ix :ImportJSFix<CR>
    endif
    if exists(":Denite")
        
        " nnoremap <leader>eca :execute "Denite -split=floating file/rec:" . "~/.config/nvim/after/ftplugin"<cr>
        " nnoremap <leader>ep :execute "Denite -split=floating file/rec:" . "~/.config/nvim/autoload"<cr>
        " nnoremap <leader>es :execute "Denite -split=floating file/rec:" . skeletons#skeletonsDir<cr>
        " nnoremap <leader>efp :execute "Denite -split=floating file/rec:" . "~/.config/nvim/fnl"<cr>

                " Define mappings
        " autocmd FileType denite call s:denite_my_settings()
        function! s:denite_my_settings() abort
          " nnoremap <silent><buffer><expr> <CR>
          " \ denite#do_map('do_action')
          " nnoremap <silent><buffer><expr> d
          " \ denite#do_map('do_action', 'delete')
          " nnoremap <silent><buffer><expr> p
          " \ denite#do_map('do_action', 'preview')
          " nnoremap <silent><buffer><expr> <ESC>
          " \ denite#do_map('quit')
          " nnoremap <silent><buffer><expr> q
          " \ denite#do_map('quit')
          nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
          nnoremap <silent><buffer><expr> <Space>
          \ denite#do_map('toggle_select').'j'
        endfunction
    endif

    if exists(":NERDTreeToggle")
        
        call NERDTreeAddMenuItem({
                \ 'text': '(n) New file from skeleton',
                \ 'shortcut': 'n',
                \ 'callback': "template#MakeNewFile"})

    endif
endf 



fun!  LoadJsxCommands()
endf


fun! AddType(anchor, trigger)
    let g:takeMeBack = 1
    execute "normal! m':1/" . a:anchor . "\<CR>jo\<esc>o\<esc>ko" . a:trigger . " "
    call UltiSnips#ExpandSnippetOrJump() 
endf

fun! Initvim()
    nnoremap <localleader>n :call AddType("\" Mapping", "n")<CR>
    nnoremap <localleader>v :call AddType("\" Mapping", "v")<CR>
    nnoremap <localleader>c :call AddType("\" Mapping", "c")<CR>
    nnoremap <localleader>p :call AddType("\" Plugins", "p")<CR>
    nnoremap <localleader>f :call AddType("\" Funcs", "pub")<CR> 
    nnoremap <localleader>a :call AddType("\" augroup", "ag")<CR> 
endf


fun! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endf


function! MyWebpackMixFolds()
    " Not is use but good for reference re: folding

    let text = join(getline(v:foldstart, v:foldend))
    let option = ''

    let path = matchstr(text , 'public/bundle/[-._/a-zA-Z]\+')

    let start = substitute(getline(v:foldstart), 'mix.\|([', '', 'g')
    let libCount = v:foldend - v:foldstart - 1

    let usedIn = split(system("grep -rwl './resources/views/' -e '" . substitute(path, 'public', '', 'g') . "'"), "\n")


    echom usedIn[1]

    return  path . "    " . join(usedIn, ' ')

endfunction

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

function! PhpSettings()
    " let g:AutoPairsInsert = 0
    let g:phpcomplete_search_tags_for_variables = 1
    let g:phpcomplete_parse_docblock_comments = 1
    let g:phpcomplete_relax_static_constraint = 1
    let g:phpcomplete_enchance_jump_to_definition = 1
    let g:phpcomplete_mapping = {
     \ 'jump_to_def_vsplit': ',g' 
     \}

    " let g:ale_php_phpcs_standard='PSR2'
    let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
    let g:deoplete#ignore_sources.php = ['omni']

    let g:tagcommands["php"] = {"tagfile":".php.tags", "cmd": "ctags","args":"-R --exclude=.git --exclude=node_modules --exclude=vendor"}

    set tags=./.php.tags;/

    let b:phpfold_use = 1
    let b:phpfold_group_args = 0
    let b:phpfold_docblocks = 1
    let b:phpfold_group_iftry = 0
    let b:phpfold_text_right_lines = 0
endfunction

function! PublicPrivateToggle()
    let line = getline('.')
    if (line =~ 'mappingpublic')
        s/public/private/
    elseif (line =~ 'private')
        s/private/public/
    endif
endfunction


let g:location_is_open = 0
function! LocationListToggle()
   if g:location_is_open
       lcl
       let g:location_is_open = 0
       execute g:location_return_to_window . "wincmd w"
   else
       let g:location_return_to_window = winnr()
       lop
       let g:location_is_open = 1
   endif
endfunction


let g:quick_fix_is_open = 0
function! QuickFixToggle()
   if g:quick_fix_is_open
       cclose
       let g:quick_fix_is_open = 0
       execute g:quick_fix_return_to_window . "wincmd w"
   else
       let g:quick_fix_return_to_window = winnr()
       copen 
       let g:quick_fix_is_open = 1
   endif
endfunction


function! PutOperator(...) abort
    if !a:0
        return ":set opfunc=PutOperator\<cr>\"" . v:register . "g@"
    endif
    let visual = get({'line': 'V', 'block': "\<c-v>"}, a:1, 'v')
    let [rv, rt] = [@@, getregtype('"')]
    execute 'normal! `[' . visual . '`]"' . v:register . ']p'
    if v:register == '"'
        call setreg('"', rv, rt)
    endif
endfunction


function! UltiDispatcher()
    echo g:takeMeBack
    if(g:takeMeBack)
        call GoBack()
    endif
endfunction

function! GoBack()
    let g:makingFunction = 0
    " execute "normal! ''"
endfunction


set hidden
set secure "recommended to be placed at the bottom of the file

" To Fix that ctrl+p/ctrl+s bug
silent !stty -ixon > /dev/null 2>/dev/null

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"


let g:aniseed#env = v:true
