(local core (require :aniseed.core))
(local nvim (require :aniseed.nvim))
(local util (require :config.util))



;; NeoVim Config

(set nvim.o.relativenumber false)
;; always show signcolumns
(set nvim.o.signcolumn "no")
;; Smaller updatetime for CursorHold & CursorHoldI
(set nvim.o.updatetime 300)
;; Changes how the cursor behaves(set scrolloff 999)
(set nvim.o.scrolloff 999)
;; project based vimrc/nvimrc
(set nvim.o.exrc true)
;; It deals with prompts and fixes a bug for me
(set nvim.o.shortmess "a")
(set nvim.o.modelines 0)
(set nvim.o.pastetoggle "<F5>")


( set nvim.o.tabstop 4 )
( set nvim.o.shiftwidth 4 )
( set nvim.o.softtabstop 4 )
( set nvim.o.expandtab true)
( set nvim.o.cino "f.5s" )
;; set cindent

(set nvim.o.undofile true)


(set nvim.o.encoding "utf-8")
(set nvim.o.autoindent true)
(set nvim.o.cindent true)









{:aniseed/module :config.init}
