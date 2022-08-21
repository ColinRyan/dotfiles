(module dotfiles.init
  {require {
            nvim-window nvim-window
            specs specs
            telescope telescope
            colorizer colorizer
            nvim aniseed.nvim
            core aniseed.nvim
            util dotfiles.util
            }
   })

(import-macros
  {: set! : let! : augroup! : autocmd! } :macros)

(print "init.fnl")
;; NeoVim Config

;; always show signcolumns
(set! signcolumn "yes")
;; Smaller updatetime for CursorHold & CursorHoldI
(set! updatetime 300)
;; Changes how the cursor behaves(set scrolloff 999)
(set! scrolloff 999)
;; project based vimrc/nvimrc
(set! exrc true)
;; It deals with prompts and fixes a bug for me
(set! shortmess "a")
(set! modelines 0)
(set! pastetoggle "<F5>")


(set! tabstop 4 )
(set! shiftwidth 4 )
(set! softtabstop 4 )
(set! expandtab)
(set! cino "f.5s" )
;; set! cindent




(set! encoding "utf-8")
(set! autoindent)
(set! cindent)
(set! showmode)
(set! showcmd)
(set! hidden)
(set! wildmenu)
(set! wildmode "list:longest")
(set! visualbell )
(set! cursorline )
(set! ttyfast  )
(set! ruler )
(set! backspace "indent,eol,start")
(set! laststatus 2)
(set! undofile )
(set! backupcopy "yes")

(set! ignorecase )
(set! smartcase )
(set! gdefault )
(set! incsearch )
(set! showmatch )

(set! wrap )
; (set! textwrap 79)
(set! formatoptions "tcqrn1")
; (set! colorcolumns 85)

(set! foldenable )
(set! foldlevel 0)
(set! foldnestmax 20)
(set! foldmethod "indent")
(set nvim.ex.set "wildignore+=*/.git/*,*/tmp/*,*.swp" )
(set nvim.ex.set "sessioniptions+=tabpages,globals" )




(fn isNil [value]
  (if (= nil value ) true false)
)


(fn mergeRight [a b]
  (var right b)
  (when (isNil right)
    (set right {})
    )
  (each [key value (pairs right)]
    (tset a key value)
  ) a
)


(lambda remap [mode from to ?options]
  (let [defaultOptions {:noremap true}]
    (vim.keymap.set
      mode
      from
      to 
      (mergeRight defaultOptions ?options )
      )
    )
  )

(lambda noremap [mode from to ?options]
  (let [defaultOptions {:noremap true}]
    (vim.keymap.set
      mode
      from
      to 
      (mergeRight defaultOptions ?options )
    )
  )
)


(let! mapleader "," )	
(let! maplocalleader "-")	

; Config

; Specs

(specs.setup 
  {
    :show_jumps true 
    :min_jumps 30 
    :popup { 
            :delay_ms 0 
            :inc_ms 10 
            :belend 10 
            :width 10 
            :winhl "PMenu" 
            :fader specs.linear_fader
            :resizer specs.shrink_resizer
    }
    :ignore_filetypes {}
    :ignore_buftypes {
      :nofile true
    }
  }
)

; Coc

(let! coc_root_patterns [".git" ".env"])

; Colorizer
(colorizer.setup)

; Telescope

(telescope.load_extension "coc")

; Conjure

(set nvim.g.conjure#client#fennel#aniseed#aniseed_module_prefix "aniseed.")

; OSCYank

(set nvim.g.oscyank_max_length 2000000)

; EasyMotion
(set nvim.g.EasyMotion_do_mapping 0)	

; Lion
(set nvim.b.lion_sqeeze_spaces 1)	


; Dashboard

(set nvim.g.dashboard_default_executive "telescope" )

; Git Gutter

(set nvim.g.gitgutter_max_signs 1200)	
(set nvim.g.gitgutter_diff_args "-w")	

; Surround
(set nvim.g.surround_indent 0)	



; Vista


(set nvim.g.vista#renderer#enable_icon 1 )	
(set nvim.g.vista_default_executive "coc" )	
(set nvim.g.vista_sidebar_width 60 )	


; tmux navigator

(set nvim.g.tmux_navigator_save_on_switch 2 )	


; ale

(set nvim.g.ale_javascript_prettier_use_local_config 1 )	
(set nvim.g.ale_lint_on_text_changed "never" )	
(set nvim.g.ale_lint_delay 1000 )	
(set nvim.g.ale_sign_column_always 1)
(set nvim.g.ale_lint_on_save 1 )	
(set nvim.g.ale_set_quickfix 0)	
(set nvim.g.ale_set_locallist 0)	
(set nvim.g.ale_open_list 0)	
(set nvim.g.ale_keep_list_window_open 0)	
(set nvim.g.ale_fix_on_save 0)	

(set nvim.g.ale_disable_lsp 1)	

(set nvim.g.ale_linters {
    :php ["php" "phpcs"  "phpmd"  "phpstan"  "php-cs-fixer"  "phan"] 
    :javascript ["flow"  "tsserver"] 
    :javascript.jsx ["flow"  "tsserver"] 
    :python ["flake8" "black" ] 
    :flow ["flow"  "tsserver"] 
    :json [] 
    :elm ["elm_ls"] 
    :jsx [ "flow"  "tsserver"] 
    :cs [ "OmniSharp" ]
 } )


(set nvim.g.ale_fixers {
     :php ["phpcbf" "php_cs_fixer"] 
     :python ["autopep8" "isort" "black"] 
     :css ["prettier"] 
     :sass ["prettier"] 
     :scss ["prettier"] 
     :javascript ["importjs"  "prettier"] 
     :javascript.jsx ["importjs"  "prettier"] 
     :jsx [ "importjs"]
 })



;UltiSnips


(let! UltiSnipsExpandTrigger "<leader>e" )
(let! UltiSnipsJumpForwardTrigger "<c-j>")
(let! UltiSnipsJumpBackwardTrigger "<c-k>")
(let! UltiSnipsSnippetsDir   (.. nvim.env.HOME  "/.vim/snippets/UltiSnips"))
(let! UltiSnipsSnippetDirectories   ["UltiSnips" (.. nvim.env.HOME "/.vim/snippets/UltiSnips")])
(let! UltiSnipsEditSplit "vertical")


; autotag




(let! closetag_filenames "*.html,*.xhtml,*.phtml,*.js")
(let! closetag_xhtml_filenames "*.xhtml,*.jsx,*.js")
(let! closetag_filetypes "html,xhtml,phtml,js")
(let! closetag_xhtml_filetypes "xhtml,jsx,js")



(let! closetag_emptyTags_caseSensitive   1)
(let! closetag_shortcut   ">")
(let! closetag_close_shortcut   "<leader>>")

; Skeletons




(let!  skeletons#skeletonsDir "~/.config/nvim/skeletons" )
(let!  skeletons#autoRegister 1 )


; Vim Testing



(let! test#strategy "neovim")

; Python


(let! loaded_python_provider 1)
(let! python_host_skip_check 1)
(let! python_host_prog "/usr/bin/python")
(let! python3_host_skip_check 1)
(let! python3_host_prog "/usr/bin/python3")

; Javascript

(let! javascript_plugin_flow 1)

; ctrl-p


(let! ctrlp_max_files 30001)
(let! ctrlp_clear_cache_on_exit 0)
(let! ctrlp_working_path_mode "wr")
(let! ctrlp_cmdg "CtrlPTag")
(let! ctrlp_lazy_update 1)
(let! ctrlp_by_filename 1)
(let! ctrlp_match_window "bottom,order:ttb")
(let! ctrlp_root_markers ["composer.json" ".gitignore"])
(let! ctrlp_open_func {:files "GoToMostImportantPlace"})

; taggatron

(let! taggatron_verbose 0)

; tagbar

(let! tagbar_autoclose 1)
(let! tagbar_autofocus 1)
(let! tagbar_show_linenumbers 2)
(let! tagbar_compact 2)

; Nerd tree

(let! NERDTreeShowLineNumbers 1)


; Vimux

(let! VimuxUseNearest 1)


; Vim Test

(let! test#strategy "vimux")


; Text Objects

(vim.fn.textobj#user#plugin "selfclosingtag" {
                                              "tag" {
                                                     "pattern" ["<" "/>"]
                                                     "select-a" "aT"
                                                     "select-i" "iT"
                                                     }
                                              })

; Denite



(vim.fn.denite#custom#map "insert" "<C-j>" "<denite:move_to_next_line>" "noremap")
(vim.fn.denite#custom#map "insert" "Up" "<denite:move_to_next_line>" "noremap")
(vim.fn.denite#custom#map "insert" "<C-k>" "<denite:move_to_previous_line>" "noremap")
(vim.fn.denite#custom#map "insert" "Down" "<denite:move_to_previous_line>" "noremap")

;===== Mappings =====




; Close all windows

(noremap :n "<leader>q" ":if bufname('%') == '' <bar> :q <bar> else <bar> :wq <bar> endif<cr>")


; Clear certain lines from current buffer

(noremap :v "dc" ":g/console/d<cr>")
(noremap :v "dd" ":g/./d<cr>")
  


; Wraps args

(noremap :n "<leader>x" ":ArgWrap<cr>")



; Windows

(remap :n "gw"  #(nvim-window.pick))

; Translation

(noremap :n "<leader>tl" "<Plug>TranslateR")
(noremap :v "<leader>tl" "<Plug>TranslateRV")

; Git


(noremap :n "<leader>gg" ":Twiggy<cr>")
(noremap :n "<leader>gs" ":vertical Git<cr>")
(noremap :n "<leader>gr" ":Gr<cr>")
(noremap :n "<leader>gw" ":Gw<cr>")





; Tabs

(noremap :n "<leader>nt" ":tabnew<cr>")
(noremap :n "gt" ":Denite tab<cr>")


; Buffers

(noremap :n "<leader>." ":vsplit ~/.config/nvim/fnl/init.fnl<cr>")

; Movement
(noremap :n "<leader>," ":vsplit $MYVIMRC<cr>")
(noremap :n "<leader>;" ":vsplit ~/.config/nvim/lua/init.lua<cr>")


(noremap :n "<leader>v" ":vnew<cr><C-f>")
(noremap :v "<leader>c" ":OSCYank<cr>")


; Searching

(noremap :n "<C-f>" "<cmd>Telescope find_files<cr>")
(noremap :n "s" "<Plug>(easymotion-s2)" {:noremap false})

; (noremap :n :s "<Plug>(easymotion-s2)")

(noremap :n "<leader>gb" ":Gblame -w<cr>")


; ===== AuGroups =====

(augroup! colorscheme 
          (print "configuring Colorsheme")
          (autocmd! FileType * #(nvim.ex.colorscheme "sin")))


(fn configureDeniteBuffer []
  (print "configuring Denite")
  (noremap :n "<ESC>" "denite#do_map('quit')"                {:silent true :expr true})
  (noremap :n "q"     "denite#do_map('quit')"                {:silent true :expr true})
  (noremap :n "<CR>"  "denite#do_map('do_action')"           {:silent true :expr true})
  (noremap :n "p"     "denite#do_map('do_action','preview')" {:silent true :expr true})
)

(fn hasPlugin [name]
  (= 1 (vim.fn.has_key vim.g.plugs name))
)


(fn MakePluginMappings []

  (when (hasPlugin "denite.nvim")

    (noremap :n "<leader>eca" ":execute 'Denite -split=floating file/rec:~/.config/nvim/after/ftplugin'<cr>")
    (noremap :n "<leader>ep"  ":execute 'Denite -split=floating file/rec:~/.config/nvim/autoload'<cr>")
    (noremap :n "<leader>es"  ":execute 'Denite -split=floating file/rec:~/.config/nvim/skeletons'<cr>")
    (noremap :n "<leader>efp" ":execute 'Denite -split=floating file/rec:~/.config/nvim/nvim/fnl'<cr>")
    (autocmd! FileType denite #(configureDeniteBuffer))
  )
  (print "MakePluginMapping")
)

(augroup! startup 

  (autocmd! StdinReadPre * #(let! std_in 1))
  (autocmd! VimEnter * #(vim.fn.vista#RunForNearestMethodOrFunction))
  (autocmd! VimEnter * #(MakePluginMappings))
)

(when (= 1 (vim.fn.executable "rg"))
  (set nvim.g.greprg "rg --color=never")
  (let! ackprg "rg --vimgrep --no-heading")
  (let! ctrlp_user_command "rg %s --files --color=never --glob ''")
  (let! ctrlp_use_cache 0)
  (vim.fn.denite#custom#var "grep" "command" ["rg"])
  (vim.fn.denite#custom#var "grep" "default_opts" ["--vimgrep" "--no-heading"])
  (vim.fn.denite#custom#var "grep" "recursive_opts" [])
  (vim.fn.denite#custom#var "grep" "pattern_opts" ["--regexp"])
  (vim.fn.denite#custom#var "grep" "separator" ["--"])
  (vim.fn.denite#custom#var "grep" "final_opts" [""])



)

(print (vim.fn.has_key vim.g.plugs "denite.nvim"))
(print "complete")


