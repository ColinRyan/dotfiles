(module dotfiles.util
  {require {nvim aniseed.nvim}})

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

{: remap 
 : noremap
 :test "catsass"}
