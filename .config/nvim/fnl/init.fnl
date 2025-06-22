(module dotfiles.init
  {require {
            os os
            nvim-window nvim-window
            ; specs specs
            telescope telescope
            telescope-utils telescope.utils
            telescope-sorters telescope.sorters
            entry-display telescope.pickers.entry_display
            nvim aniseed.nvim
            core aniseed.nvim
            util dotfiles.util
            ; bufferline bufferline
            ; filetype filetype
            gitsigns gitsigns
            osc52 osc52
            smartyank smartyank
            substitute substitute
            treesitterParsers nvim-treesitter.parsers
            treesitterConfigs nvim-treesitter.configs
            ts_utils nvim-treesitter.ts_utils
            ai mini.ai
            autopairs nvim-autopairs
            toggleterm toggleterm
            gpt gpt
            ; chatgpt chatgpt
            ; popui-uio popui.ui-overrider 
            ; popui-io popui.input-overrider 
            ; popui-dn popui.diagnostics-navigator 
            ; popui-mm popui.marks-manager
            tabby tabby.tabline
            hc nvim-highlight-colors
            dap dap
            dap-vt nvim-dap-virtual-text
            dapui dapui
            dap-python dap-python
            eyeliner eyeliner
            sin sin
            lualine lualine
            ; copilot copilot
            ; CopilotChat CopilotChat
            ; feline feline
            ; litee litee
            dressing dressing
            git-sessions git-sessions
            ; avante_lib avante_lib
            ; avante avante
            hlargs hlargs
            nvim-ts-autotag nvim-ts-autotag
            ; llm llm
            }
   })

(import-macros
  {: set! : let! : augroup! : autocmd! } :macros)



(local remap  util.remap)
(local noremap  util.noremap)









(print "init.fnl")
;; NeoVim Config


(set! clipboard "unnamed" ) ;; Use system clipboard

(set! termguicolors true ) ;; Set color options to use more than 256 
(set! guifont "JetBrainsMono Nerd Font" ) ;; Set GUI Font


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


(set! tabstop 2 )
(set! shiftwidth 2 )
(set! softtabstop 2 )
(set! expandtab)
(set! cino "f.5s" )
;; set! cindent




(set! encoding "utf-8")
; (set! autoindent)
; (set! cindent)
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
(set! foldlevel 99)
(set! foldlevelstart 0)

(set! foldclose "all")

(set! foldnestmax 4)
; (set! foldmethod "indent")
(set nvim.ex.set "wildignore+=*/.git/*,*/tmp/*,*.swp" )
(set nvim.ex.set "sessioniptions+=tabpages,globals" )



(let! mapleader "," )	
(let! maplocalleader "-")	

;;; Plugin Config

;; LLM
;
; (llm.setup {
;             :backend "ollama"
;             :model "llama3.2"
;             :url "http://localhost:11434" 
;             :request_body {
;               :options {
;                 :temperature 0.2
;                 :top_p 0.95
;               }
;             }
;             })
;

;; Avante

; (avante_lib.load)
; (avante.setup)

;; HLARGS

(hlargs.setup {})

;; UI



;; Session Management

(git-sessions.setup {})

;; AI

; Copilot 
;
; (copilot.setup {
;                 :suggestion {
;                              :auto_trigger true
;                              :keymap {
;                                       :accept "<Tab>"
;                                       }
;                              }
;                 })
;
; Copilot Chat


; (CopilotChat.setup {
;                     :debug false
;                     })
;
; Lualine

(lualine.setup {

                })
; SIN

(sin.setup {
            :extensions {
                :telescope true

                        }

            })

; eyeliner

(eyeliner.setup {
                 :highlight_on_key true
                 :dim true


})

; Neodev

; DAP

;; dap ui

(dapui.setup {})

;; virtual text

(dap-vt.setup {
               :clear_on_continue false
               })
;; Python


(dap-python.setup "~/venvs/neovim/bin/python")  

(set dap-python.test_runner "pytest")
(set dap-python.resolve_python #("~/venvs/neovim/bin/python"))

(table.insert dap.configurations.python {
    :type "python"
    :request "attach"
    :name "Docker: Django Debug"
    :connect {
        :host "localhost"
        :port 5678
    }
    :pathMappings [
        {
            :localRoot (vim.fn.getcwd) 
            :remoteRoot "/app"
        }
    ]
    :django true
    :justMyCode true
})






(noremap :n "<leader>b" ":lua require'dap'.toggle_breakpoint()<CR>" )
(noremap :n "<leader>dd" ":lua require'dap'.continue()<CR>" )
(noremap :n "<leader>dn" ":lua require'dap'.step_over()<CR>" )
(noremap :n "<leader>di" ":lua require'dap'.step_into()<CR>" )
(noremap :n "<leader>do" ":lua require'dap'.step_out()<CR>" )

(noremap :n "<leader>dr" ":lua require'dap'.repl.open()<CR>" )
(noremap :n "<leader>dm" ":lua require'dap-python'.test_method()<CR>" )
(noremap :n "<leader>dc" ":lua require'dap-python'.test_class()<CR>" )
(noremap :n "<leader>ds" ":lua require'dap-python'.debug_selection()<CR>" )
(noremap :n "<leader>dt" ":lua require'dapui'.toggle()<CR>" )
(noremap :n "<leader>de" ":lua require'dapui'.eval()<CR>" )
(noremap :v "<leader>de" ":lua require'dapui'.eval()<CR>" )












; vimwiki

(let! vimwiki_table_mapping 0)

(noremap :n "<leader>wss" ":vsplit ~/vimwiki/Scratchpad.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o" )
(noremap :n "<leader>wp" ":vsplit ~/vimwiki/Problems.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o" )
(noremap :n "<leader>wl" ":vsplit ~/vimwiki/LessonsLearned.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o" )
(noremap :n "<leader>wf" ":vsplit ~/vimwiki/improvements.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o" )


(let! vimwiki_list = [
  {
    :path "~/vimwiki"
    :syntax "markdown"
    :ext "wiki"
    :auto_export 1
    :auto_toc 1
    :auto_tags 1
    :auto_diary_index 1
    :auto_diary_header 1
    :auto_diary_entry 1
    :auto_diary_title 1
    :auto_diary_date_format "%A, %B %d, %Y"
    :auto_diary_time_format "%I:%M %p"}])


; copilot

(noremap :i "<C-TAB>" "copilot#Accept('<CR>')" {:silent true :expr true})



; github

; (litee.lib.setup)
; (litee.gh.setup)


; Feline


; highlight colors

(hc.setup)

; tabby

(set vim.o.showtabline 2)
(tabby.use_preset "active_wins_at_tail" {
                                          :theme {
                                                  :fill "TabLineFill"
                                                  :head "TabLine"
                                                  :current_tab "TabLineSel"
                                                  }
                                          :nerdfont true
                                          })

; popui

;
; (set vim.ui.select popui-uio)
; (set vim.ui.input popui-io)
;



; GPT


; (gpt.setup {
;             :api_key (os.getenv "OPENAI_API_KEY")
;             })

(local home (vim.fn.expand "$HOME"))

; Chatgpt
; (chatgpt.setup {
;      ; :api_key_cmd  (.. "gpg --decrypt`" home "/.bobsburgars.txt.gpg`")
;     :yank_register  "+"
;     :edit_with_instructions  {
;       :diff  false
;       :keymaps  {
;         :close  "<C-c>"
;         :accept  "<C-y>"
;         :toggle_diff  "<C-d>"
;         :toggle_settings  "<C-o>"
;         :cycle_windows  "<Tab>"
;         :use_output_as_input  "<C-i>"
;       }
;     }
;     :chat  {
;       :welcome_message  "If you don't ask the right questions you wont get the right answers ~ Robert Half"
;       :loading_text  "Loading please wait ..."
;       :question_sign  ""
;       :answer_sign  "ﮧ"
;       :max_line_length  120
;       :sessions_window  {
;         :border  {
;           :style  "rounded"
;           :text  {
;             :top  " Sessions "
;           }
;         }
;         :win_options  {
;           :winhighlight  "Normal:Normal,FloatBorder:FloatBorder"
;         }
;       }
;       :keymaps  {
;         :close  "<C-c>"
;         :yank_last  "<C-y>"
;         :yank_last_code  "<C-k>"
;         :scroll_up  "<C-u>"
;         :scroll_down  "<C-d>"
;         :new_session  "<C-n>"
;         :cycle_windows  "<Tab>"
;         :cycle_modes  "<C-f>"
;         :next_message  "<C-j>"
;         :prev_message  "<C-k>"
;         :select_session  "<Space>"
;         :rename_session  "r"
;         :delete_session  "d"
;         :draft_message  "<C-d>"
;         :edit_message  "e"
;         :delete_message  "d"
;         :toggle_settings  "<C-o>"
;         :toggle_message_role  "<C-r>"
;         :toggle_system_role_open  "<C-s>"
;         :stop_generating  "<C-x>"
;       }
;     }
;     :popup_layout  {
;       :default  "center"
;       :center  {
;         :width  "80%"
;         :height  "80%"
;       }
;       :right  {
;         :width  "30%"
;         :width_settings_open  "50%"
;       }
;     }
;     :popup_window  {
;       :border  {
;         :highlight  "FloatBorder"
;         :style  "rounded"
;         :text  {
;           :top  " ChatGPT "
;         }
;       }
;       :win_options  {
;         :wrap  true
;         :linebreak  true
;         :foldcolumn  "1"
;         :winhighlight  "Normal:Normal,FloatBorder:FloatBorder"
;       }
;       :buf_options  {
;         :filetype  "markdown"
;       }
;     }
;     :system_window  {
;       :border  {
;         :highlight  "FloatBorder"
;         :style  "rounded"
;         :text  {
;           :top  " SYSTEM "
;         }
;       }
;       :win_options  {
;         :wrap  true
;         :linebreak  true
;         :foldcolumn  "2"
;         :winhighlight  "Normal:Normal,FloatBorder:FloatBorder"
;       }
;     }
;     :popup_input  {
;       :prompt  "  "
;       :border  {
;         :highlight  "FloatBorder"
;         :style  "rounded"
;         :text  {
;           :top_align  "center"
;           :top  " Prompt "
;         }
;       }
;       :win_options  {
;         :winhighlight  "Normal:Normal,FloatBorder:FloatBorder"
;       }
;       :submit  "<C-Enter>"
;       :submit_n  "<Enter>"
;       :max_visible_lines  20
;     }
;     :settings_window  {
;       :border  {
;         :style  "rounded"
;         :text  {
;           :top  " Settings "
;         }
;       }
;       :win_options  {
;         :winhighlight  "Normal:Normal,FloatBorder:FloatBorder"
;       }
;     }
;     :openai_params  {
;       :model  "gpt-4"
;       :frequency_penalty  0
;       :presence_penalty  0
;       :max_tokens  300
;       :temperature  0
;       :top_p  1
;       :n  1
;     }
;     :openai_edit_params  {
;       :model  "gpt-4"
;       :frequency_penalty  0
;       :presence_penalty  0
;       :temperature  0
;       :top_p  1
;       :n  1
;     }
;     :use_openai_functions_for_edits  false
;     :actions_paths  {}
;     :show_quickfixes_cmd  "Trouble quickfix"
;     :predefined_chat_gpt_prompts  "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv" 

; })
; (gpt.setup {
;             :api_key (os.getenv "OPENAI_API_KEY")
;             })

; noice


; toggle term

(toggleterm.setup {
    :open_mapping "`"
    :direction "float"
})
; nvim AutoPairs


(autopairs.setup {
                  :enable_abbr true
                  :check_ts true


                  })

(tset (. (autopairs.get_rule "'") 1) :not_filetypes ["jsx" "javascript.react" "javascript" "tsx" "typescript" "typescriptreact"])
(tset (. (autopairs.get_rule "\"") 1) :not_filetypes ["jsx" "javascript.react" "javascript" "tsx" "typescript" "typescriptreact"])
(tset  (autopairs.get_rule "{") :not_filetypes ["jsx" "javascript.react" "javascript" "tsx" "typescript" "typescriptreact"])
(tset  (autopairs.get_rule "[") :not_filetypes ["jsx" "javascript.react" "javascript" "tsx" "typescript" "typescriptreact"])


; (print (vim.inspect  autopairs.config.rules))

; (print (vim.inspect  (. (autopairs.get_rule "'") 1))

; (print (vim.inspect  (. (autopairs.get_rule "'") 1)))
; (print (vim.inspect  (. (autopairs.get_rule "{") 0)))
; (tset (. (autopairs.get_rule "{") 1) :not_filetypes ["jsx" "javascript.react" "javascript" "tsx" "typescript" "typescriptreact"])

; (print (vim.inspect  (autopairs.get_rule "'")))








; (autopairs.add_rules [
;                       (-> (autopairs.rule "\"" "\"" "tsx")
;                           (:with_pair (fn [_] (fn [_] true )))
;                       )])

; Mini AI


(ai.setup)

; Treesitter

(treesitterConfigs.setup {
                  :disable ["html" "htmldjango"]

                   :matchup {
                            :enable false
                            :disable ["html" "htmldjango"]

                            }
                   :textobjects {
                                 :disable ["html" "htmldjango"]

                               :select {
                                  :enable true
                                  :lookahead true
                                  :keymaps {
                                        :af "@function.outer"
                                        :ai "@function.inner"

                                            }
                                        }
                                 }
                   :highlight {
                               :enable true
                               :disable ["html" "htmldjango"]
                               :additional_vim_regex_highlighting false


                               }
                   :indent {
                            :enable false
                            :disable ["html" "htmldjango"]
                            :additional_vim_regex_highlighting false

                            }
                   :ensure_installed [
                                      "tsx"
                                      "typescript"
                                      "javascript"
                                      "graphql"
                                      "python"

                                      "fennel"
                                      "json"
                                      "yaml"
                                      "css"
                                      "lua"
                                      "html"
                                      "htmldjango"
                                      ]
                   :autotag {
                             :enable true
                             :disable ["html" "htmldjango"]

                             }
                   :incremental_selection
                     {
                      :enable true
                      :disable ["html" "htmldjango"]

                      :keymaps {
                                :init_selection "gnn"
                                :node_incremental "grn"
                                :scope_incremental "grc"
                                :node_decremental "grm"
                                }
                      } 

                   })

(var parserConfig (treesitterParsers.get_parser_configs))



(set parserConfig.tsx.filetype_to_parsername [ "javascript" "typescript.tsx" "typescriptreact" "javascriptreact"])

; Smart Yank

(smartyank.setup {})



; substitute

(substitute.setup {})

; Gitsigns


(gitsigns.setup {
                 :signs {
                         :add {
                               :hl "GitSignsAdd"
                               :text "+"

                               }

                         :change {
                                  :hl "GitSignsChange"
                                  :text "~"

                                  }
                         }

                 })

; FileType



; (filetype.setup {
;   :overrides {
;     :complex {
;       ".*service.js" "services.javascript"
;       ".*service.ts" "services.typescript"
;     }
;   }

; })

; Bufferline

; (bufferline.setup {
;   :options {
;     :mode "buffers"
;     :numbers "ordinal"

;   }
; })

; Specs

; (specs.setup 
;   {
;     :show_jumps true 
;     :min_jumps 30 
;     :popup { 
;             :delay_ms 0 
;             :inc_ms 10 
;             :belend 10 
;             :width 10 
;             :winhl "PMenu" 
;             :fader specs.linear_fader
;             :resizer specs.shrink_resizer
;     }
;     :ignore_filetypes {}
;     :ignore_buftypes {
;       :nofile true
;     }
;   }
; )

; Coc

(let! coc_root_patterns [".git" ".env"])


; Telescope


(telescope.setup
 {
  :defaults
  {
     :sorting_strategy "descending"
     :preview false
     ; :file_sorter telescope_sorters.get_fzy_sorter
     ; :generic_sorter telescope_sorters.get_fzy_sorter
     :file_ignore_patterns []
     :vimgrep_arguments ["rg"
                         "--files"
                         "--hidden"
                         "--color=never"
                         "--no-heading"
                         "--with-filename"
                         "--line-number"
                         "--column"
                         "--smart-case"
                         ]
     ; :preview {
     ;    :win_config {
     ;      :foldmethod "manual"
     ;      :foldenable false
     ;    }
     ; }
    }

 }
)

(telescope.load_extension "coc")
(telescope.load_extension "fzf")


; Conjure

(set nvim.g.conjure#client#fennel#aniseed#aniseed_module_prefix "aniseed.")

; OSC52

(osc52.setup {
              :max_length 0
              :trim true
              :tmux_pass_through true
              })

; EasyMotion
(set nvim.g.EasyMotion_do_mapping 0)	

; Lion
(set nvim.b.lion_sqeeze_spaces 1)	


; Dashboard

(set nvim.g.dashboard_default_executive "telescope" )

; ; Git Gutter

; (set nvim.g.gitgutter_max_signs 1200)	
; (set nvim.g.gitgutter_diff_args "-w")	

; Surround
(set nvim.g.surround_indent 0)	



; Vista


(set nvim.g.vista#renderer#enable_icon 1 )	
(set nvim.g.vista_default_executive "coc" )	
(set nvim.g.vista_sidebar_width 60 )	


; tmux navigator

(set nvim.g.tmux_navigator_save_on_switch 2 )	


; ale

; (set nvim.g.ale_javascript_prettier_use_local_config 1 )	
; (set nvim.g.ale_lint_on_text_changed "never" )	
; (set nvim.g.ale_lint_delay 1000 )	
; (set nvim.g.ale_sign_column_always 1)
; (set nvim.g.ale_lint_on_save 1 )	
; (set nvim.g.ale_set_quickfix 0)	
; (set nvim.g.ale_set_locallist 0)	
; (set nvim.g.ale_open_list 0)	
; (set nvim.g.ale_keep_list_window_open 0)	
; (set nvim.g.ale_fix_on_save 0)	

; (set nvim.g.ale_disable_lsp 1)	

; (set nvim.g.ale_linters {
;     :php ["php" "phpcs"  "phpmd"  "phpstan"  "php-cs-fixer"  "phan"] 
;     :javascript ["flow"  "tsserver"] 
;     :javascript.jsx ["flow"  "tsserver"] 
;     :python ["flake8" "black" ] 
;     :flow ["flow"  "tsserver"] 
;     :json [] 
;     :elm ["elm_ls"] 
;     :jsx [ "flow"  "tsserver"] 
;     :cs [ "OmniSharp" ]
;  } )


; (set nvim.g.ale_fixers {
;      :php ["phpcbf" "php_cs_fixer"] 
;      :python ["autopep8" "isort" "black"] 
;      :css ["prettier"] 
;      :sass ["prettier"] 
;      :scss ["prettier"] 
;      :javascript ["importjs"  "prettier"] 
;      :javascript.jsx ["importjs"  "prettier"] 
;      :jsx [ "importjs"]
;  })



;UltiSnips


(let! UltiSnipsExpandTrigger "<leader>e" )
(let! UltiSnipsJumpForwardTrigger "<c-j>")
(let! UltiSnipsJumpBackwardTrigger "<c-k>")
(let! UltiSnipsSnippetsDir   (.. nvim.env.HOME  "/.vim/snippets/UltiSnips"))
(let! UltiSnipsSnippetDirectories   ["UltiSnips" (.. nvim.env.HOME "/.vim/snippets/UltiSnips")])
(let! UltiSnipsEditSplit "vertical")


; autotag

(nvim-ts-autotag.setup {})




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






; Python


(let! loaded_python_provider 1)
(let! python_host_skip_check 1)
(let! python_host_prog "/usr/bin/python")
(let! python3_host_skip_check 1)
(let! python3_host_prog "~/venvs/neovim/bin/python")

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

;; ===== Mappings =====

(noremap :n "<leader>tt" #(translate_word_under_cursor) {:silent true :desc "Translate words to different forms"})

; (noremap :n "gg" ":ChatGPT<cr>")



; ; GPT

(noremap :v "<C-g>r" #(gpt.replace) {:silent true :desc "[G]pt [R]eplace"})
(noremap :v "<C-g>p" #(gpt.visual_prompt) {:silent true :desc "[G]pt [P]rompt"})


(noremap :n "<C-g>p" #(gpt.prompt) {:silent true :desc "[G]pt [P]rompt"})
(noremap :n "<C-g>c" #(gpt.cancel) {:silent true :desc "[G]pt [C]ancel"})

(noremap :i "<C-g>p" #(gpt.prompt) {:silent true :desc "[G]pt [P]rompt"})



; Alternate

(noremap :n "<leader>av" ":AV<cr>")
(noremap :n "<leader>aa" ":A<cr>")



; Toggle term


; Substitution

(noremap :n "p" #(substitute.operator))


; go up and down between functions

(noremap :n "<s-j>" "]m")
(noremap :n "<s-k>" "[m")


; COC

(noremap :n "<space>a" ":Telescope coc diagnostics<cr>" {:silent true})
(noremap :n "<space>e" ":Telescope coc extensions<cr>" {:silent true})
(noremap :n "<space>c" ":Telescope coc commands<cr>" {:silent true})
(noremap :n "<space>o" ":Telescope coc outline<cr>" {:silent true})
(noremap :n "<space>s" ":<C-u>CocList -I symbols<cr>" {:silent true})
(noremap :n "<space>j" ":<C-u>CocNext<cr>" {:silent true})
(noremap :n "<space>k" ":<C-u>CocPrev<cr>" {:silent true})
(noremap :n "<space>p" ":<C-u>CocListResume" {:silent true})


; COC code actions


(noremap :x "<leader>ac" "<Plug>(coc-codeaction-selected)<cr>" )
(noremap :n "<leader>ac" "<Plug>(coc-codeaction)" )
(noremap :n "<leader>cl" "<Plug>(coc-codelens-action)" )
(noremap :n "ga" "<Plug>(coc-codeaction-cursor)" )


(noremap :x "if" "<Plug>(coc-funcobj-i)" )
(noremap :x "af" "<Plug>(coc-funcobj-a)" )
(noremap :o "if" "<Plug>(coc-funcobj-i)" )
(noremap :o "af" "<Plug>(coc-funcobj-a)" )

; Use <c-space> to trigger completion

(noremap :i "<c-space>" "coc#refresh()" {:silent true :expr true})



(noremap :n "<leader>j" "<Plug>(coc-diagnostic-next)" {:silent true })
(noremap :n "<leader>k" "<Plug>(coc-diagnostic-prev)" {:silent true })
(noremap :n "gi" "<Plug>(coc-implementation)" {:silent true })
(noremap :n "gy" "<Plug>(coc-type-definition)" {:silent true })
(noremap :n "gd" "<Plug>(coc-definition)" {:silent true })
(noremap :n "gv" ":vsp<CR><Plug>(coc-definition)" {:silent true })

(noremap :n "gr" "<Plug>(coc-references)" {:silent true })
(noremap :n "<leader>/" ":Denite grep<cr>" )
(noremap :n "<space><space>" "zazt" )







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
; (noremap :n "y" #(osc52.copy_operator) {:expr true})
; (noremap :n "yy" "normal <leader>c_" {:remap true})
; (noremap :v "y" #(osc52.copy_visual))

; Searching

(noremap :n "<C-f>" "<cmd>Telescope find_files<cr>")
(noremap :n "s" "<Plug>(easymotion-s2)" {:noremap false})

; (noremap :n :s "<Plug>(easymotion-s2)")

(noremap :n "<leader>gb" ":Git blame <cr>")


; ===== AuGroups =====

(augroup! colorscheme 
          (print "configuring Colorsheme")
          (autocmd! FileType * #(nvim.ex.colorscheme "sin")))


(fn configureDeniteBuffer []
  (noremap :n "<ESC>" "denite#do_map('quit')"                {:silent true :expr true})
  ; (noremap :n "q"     "denite#do_map('quit')"                {:silent true :expr true})
  (noremap :n "<CR>"  "denite#do_map('do_action')"           {:silent true :expr true})
  (noremap :n "p"     "denite#do_map('do_action','preview')" {:silent true :expr true})
)

(fn hasPlugin [name]
  (= 1 (vim.fn.has_key vim.g.plugs name))
)


(fn MakeFennelPluginMappings []

  (when (hasPlugin "denite.nvim")


    (noremap :n "<leader>eca" ":execute 'Denite -split=floating file/rec:~/.config/nvim/after/ftplugin'<cr>")
    (noremap :n "<leader>ep"  ":execute 'Denite -split=floating file/rec:~/.config/nvim/autoload'<cr>")
    (noremap :n "<leader>es"  ":execute 'Denite -split=floating file/rec:~/.config/nvim/skeletons'<cr>")
    (noremap :n "<leader>efp" ":execute 'Denite -split=floating file/rec:~/.config/nvim/nvim/fnl'<cr>")
    (autocmd! FileType denite #(configureDeniteBuffer))
  )
)

(var foldIncrement 0 )
(fn custom-comment-fold [lnum]
  ; Custom folding. If a line contains "foldstart" it will start a new fold.
  ; foldend will end a fold. Otherwise use treesitter.

  
  (let [line (vim.fn.getline lnum)]
    (if 
      (string.find line "foldstart") 
      (do
        (set foldIncrement (+ foldIncrement 1)) 
        "a2" ;; Start a new fold
      )
      (string.find line "foldend")
      (do
        (set foldIncrement (- foldIncrement 1))   
        "s2" ;; Start a new fold
      )
      (> foldIncrement 0)
      (do
        "=" ;; keep fold level equal
      )
      (vim.treesitter.foldexpr lnum)
    )
  )
)
(set _G.custom_comment_fold custom_comment_fold)


(fn StartAvante []
  (print "avante starting")
  (avante_lib.load)
  (avante.setup)
)

(fn ReloadSin []

  (vim.cmd "source %")
  (vim.cmd "colorscheme sin")
)
(fn getCurrentLineNumber []
  ; You know what it does.
  (local cursorPos (vim.api.nvim_win_get_cursor 0))
  (. cursorPos 1)
)

(fn onCursorMove []
  ; fold and unfold based on cursor position
  ; TODO replace with a pair of functions that operate on
  ; j and k 

  (local currentLineNumber (getCurrentLineNumber))
  (local myFoldLevel (nvim.fn.foldlevel currentLineNumber))

  (print currentLineNumber)
  (if (> (myFoldLevel) 0)
    (nvim.command "silent! normal! zo"))
  ; (if (= (nvim.fn.foldlevel ".") 0)
    ; (nvim.command "silent! normal! zM")))
)

(fn onCursorMoveUp []
  ; fold and unfold based on cursor position
  ; TODO replace with a pair of functions that operate on
  ; j and k 

  (local nextLineNumber (- (getCurrentLineNumber) 1))
  (local myFoldLevel (nvim.fn.foldlevel nextLineNumber))

  (print (.. "line:" nextLineNumber " foldlevel:" myFoldLevel))


  (nvim.command "silent! normal! gk")

  (if (> myFoldLevel 0)
    (nvim.command "silent! normal! zo")
  )

)
  ; (if (= (nvim.fn.foldlevel ".") 0)
      ; (nvim.command "silent! normal! zM")))
(fn onCursorMoveDown []
  ; fold and unfold based on cursor position
  ; TODO replace with a pair of functions that operate on
  ; j and k 


  (local currentLineNumber (getCurrentLineNumber))
  (local nextLineNumber (+ currentLineNumber 1))

  (local currentFoldLevel (nvim.fn.foldlevel currentLineNumber))
  (local nextFoldLevel (nvim.fn.foldlevel nextLineNumber))

  (print (.. "curr line:" currentLineNumber " foldlevel:" currentFoldLevel  "| next line:" nextLineNumber " foldlevel:" nextFoldLevel))



  (nvim.command "silent! normal! gj")

  (if (> nextFoldLevel currentFoldLevel)
    (nvim.command "normal! zo")
  )
)


(noremap :n "k" #(onCursorMoveUp) {:noremap false})
(noremap :n "j" #(onCursorMoveDown) {:noremap false})

  ; (if (= (nvim.fn.foldlevel ".") 0)
      ; (nvim.command "silent! normal! zM")))

(augroup! fennelstartup 
  (autocmd! StdinReadPre * #(let! std_in 1))
  (autocmd! VimEnter * #(vim.fn.vista#RunForNearestMethodOrFunction))
  (autocmd! VimEnter * #(MakeFennelPluginMappings))
  (autocmd! bufwritepost *.js ":TestFile -strategy=vimux")
  (autocmd! bufwritepost *.jsx ":TestFile -strategy=vimux")
  (autocmd! bufwritepost *.ts ":TestFile -strategy=vimux")
  (autocmd! bufwritepost *.tsx ":TestFile -strategy=vimux")
  (autocmd! bufwritepost *.py ":TestFile -strategy=vimux")
  (autocmd! User SinToggleMode #(ReloadSin))
  (autocmd! FileType TelescopeResults "setlocal nofoldenable")
  ; (autocmd! User avante.nvim #(StartAvante))
  (set! foldmethod "expr" )
  (print "meow")
  (set! foldexpr "v:lua.custom_comment_fold(v:lnum)")




  ; (autocmd! CursorMoved *.tsx #(onCursorMove))
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



; # Funcs 

; Get the syntax tree of the current buffer
(fn get-current-buffer-syntax-tree []
  (local parser (vim.treesitter.get_parser 0))

  ; (print  "parser" )

  ; (print  (vim.inspect parser) )
  ; (print  (vim.inspect ( parser:parse )) )


  (local tree (. (parser:parse) 1))
  (local root (tree:root))
  root
)
; This function prints the syntax tree of the current buffer
(fn print-syntax-tree []
  (local root (get-current-buffer-syntax-tree))
  ; (print (root:sexpr))
)

(set _G.print_syntax_tree print_syntax_tree)

(fn getBufferId []
  (-> (vim.api.nvim_get_current_buf) (vim.api.nvim_buf_get_number)))

; This function gets the treesitter_node under the cursor as well as it's
; parent
(fn treesitter_node [pos]
  

  (local current_node (vim.treesitter.get_node {:pos pos}))
  (local root_node (ts_utils.get_root_for_node current_node ))
  (local parent_node (: current_node "parent"))



  ; (print "================")
  ; (print (vim.inspect current_node))

  ; (print (: current_node "type"))
  ; (print (if parent_node (: parent_node "type") nil))


  (if current_node
    [(: current_node "type") (if parent_node (: parent_node "type") nil)]
    [nil nil]
  )
)



(set _G.treesitter_node treesitter_node)

; This function will take a value and a list and return true if the value is in
; the list, otherwise it will return false.

(fn is_in_list [value list]
  (var found false)
  (each [i v (ipairs list)]
    (when (= v value)
      (set found true)
    )
  )
  found
)

; This function determines if a node matches a list of node names
;

(fn is_node_type [node node_names]
  (local node_type (: node "type"))

  (is_in_list node_type node_names)
)

; This function will take a list of node names, current node , and an
; generation count. If the current node is not a member of node_names it will
; check it's ancestor (if it has an ancestor). It will keep doing this until it
; goes back generation_count times or until it finds a node that is a member
; of node_names. If it finds a node that is a member of node_names it will
; return true, otherwise it will return false.
;

(fn is_node_in_path_of [node_names current_node generation_count]
  (if current_node
    true
    (lua "return false")

  )
  
  (local parent_node (: current_node "parent"))

  (if (is_node_type current_node node_names)
    true
    (if parent_node
      (if (= generation_count 0)
        false
        (is_node_in_path_of node_names parent_node (- generation_count 1))
      )
      false
    )
  )
)

; This function will take a list of node names, current node postion, and an
; generation count. If the current node is not a member of node_names it will
; check it's ancestor (if it has an ancestor). It will keep doing this until it
; goes back generation_count times or until it finds a node that is a member
; of node_names. If it finds a node that is a member of node_names it will
; return true, otherwise it will return false.
;
; @param node_names list of node names
; @param pos current node position
; @param generation_count how many generations to go back
;
(fn is_node_under_cursor_ancestor_of [props ]


  (local node_names (. props "node_names"))
  (local generation_count (. props "generation_count"))



  (local node_under_cursor (vim.treesitter.get_node {:pos (. props "pos")}))

  (local is_in_path (if node_under_cursor (is_node_in_path_of  node_names node_under_cursor generation_count) false))

  is_in_path

)

(set _G.is_node_under_cursor_ancestor_of is_node_under_cursor_ancestor_of)

; Get the first element of a list and return it
(fn head [list ]
  (if list
    (. list 1)
    nil
  )
)
(fn tail [list]  
  (icollect [i s (ipairs list)]
    (if (not= 1 i)
        s))
)


; This function will take a node and return a lineage
(fn get_lineage [node]
  (print "-==-=-=-=-=-=-=-=-=--=")



  (if node
  (print (vim.inspect (: node "type")))

  (let [current-type [(: node "type")]
        parent (: node "parent")]
    (if parent
      (table.concat current-type (get_lineage parent))
      current-type))
  [])
)



; This function will take a list of node names, and a node. It will return true
; if the ancestory of the node is exactly the same as the node names list.
(fn check_lineage [lineage node]

  (print "-=-=-=-=-=-")

  (print (vim.inspect node))
  (if node
    (if (= (: node "type") (. lineage 1))
      (if (=  (length (tail lineage)) 0)
        true
        (check_lineage (tail lineage) (: node "parent"))
      )
      false
    )
    false
  )
)

; This function will take a list of node names, and current node postion. It will
; return true if the ancestory of the node at the position is exactly the same
; as the node names list. Otherwise it will return false.
; 
; Incomplete

(fn has_node_lineage [props]

  (local node_names (. props "node_names"))
  (local node_under_cursor (vim.treesitter.get_node {:pos (. props "pos")}))

  (print "node lineage")
  (print (get_lineage node_under_cursor))
  (check_lineage node_names node_under_cursor)
)

(set _G.has_node_lineage has_node_lineage)

(fn get_node_lineage [props]

  (local node_under_cursor (vim.treesitter.get_node {:pos (. props "pos")}))

  (get_lineage node_under_cursor)
)

(set _G.get_node_lineage get_node_lineage)

; This function is suppose to be a custom sorter for telescope. Not sure it
; works though.
;
; Incomplete
(fn custom-sorter [opts]
  (fn custom-sorter-impl [entry1 entry2]
    (var filename1 (-> telescope-utils (get "path_tail") (call (. entry1 "value"))))
    (var filename2 (-> telescope-utils (get "path_tail") (call (. entry2 "value"))))
    
    (var dir-score1 (or (string.match (. entry1 "ordinal") "(.+)/") (. entry1 "ordinal")))
    (var dir-score2 (or (string.match (. entry2 "ordinal") "(.+)/") (. entry2 "ordinal")))

    (when (. opts "ignore_case")
      (set filename1 (string.lower filename1))
      (set filename2 (string.lower filename2))
      (set dir-score1 (string.lower dir-score1))
      (set dir-score2 (string.lower dir-score2)))

    (local filename-priority (< filename1 filename2))

    (if (= dir-score1 dir-score2)
      filename-priority
      (< (. entry1 "ordinal") (. entry2 "ordinal"))))
  
  (fn [entry1 entry2]
    (if (and entry1 entry2)
      (custom-sorter-impl entry1 entry2)
      false)))

(fn select_skeleton []
  (vim.ui.select [:cats :dogs :frogs] {:prompt "Select Skeleton"} (fn [choice] (print choice))))

(set _G.select_skeleton select_skeleton)

(fn translate-word-under-cursor []
  (let [word-to-translate (vim.api.nvim_call_function "expand" ["<cword>"])
        translations {"end" "begin"
                      "const" "let"
                      "var" "const"
                      "let" "var"
                      "begin" "end"
                      "px" "em"
                      "em" "rem"
                      "rem" "px"
                      "false" "true"
                      "False" "True"
                      "true" "false"
                      "True" "False"
                      "public" "private"
                      "private" "protected"
                      "protected" "public"
                      "no" "yes"
                      "yes" "no"
                      "off" "on"
                      "on" "off"
                      "start" "stop"
                      "stop" "start"}]
    (if (. translations word-to-translate )
      (vim.api.nvim_command (.. "normal! ciw" (. translations word-to-translate )))
      (print "word not in translations"))))

(set _G.translate_word_under_cursor translate_word_under_cursor)

