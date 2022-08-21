(module dotfiles.util
  {require {nvim aniseed.nvim}})

(defn noremap [mode from to]
  (nvim.set_keymap
    mode
    from
    to 
    {:noremap true}))
