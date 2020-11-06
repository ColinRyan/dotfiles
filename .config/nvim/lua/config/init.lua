local core = require("aniseed.core")
local nvim = require("aniseed.nvim")
local nu = require("aniseed.nvim.util")
local util = require("config.util")
local function noremap(mode, from, to)
  return nvim.set_keymap(mode, from, to, {noremap = true})
end
local function ft_map(ft, mode, from, to)
  return nvim.ex.autocmd("FileType", ft, (mode .. "map"), "<buffer>", ("<localleader>" .. from), to)
end
local function plug(cmd)
  return ("<Plug>(" .. cmd .. ")")
end
nvim.ex.augroup("aniseed")
nvim.ex.autocmd_()
nvim.ex.autocmd_("bufwritepost init.fnl :AniseedEvalFile ~/.config/nvim/fnl/config/init.fnl")
ft_map("fennel", "n", "E", plug("AniseedEval"))
ft_map("fennel", "n", "ee", (plug("AniseedEval") .. "af"))
ft_map("fennel", "n", "er", (plug("AniseedEval") .. "aF"))
ft_map("fennel", "n", "ef", plug("AniseedEvalCurrentFile"))
ft_map("fennel", "v", "ee", plug("AniseedEvalSelection"))
ft_map("fennel", "n", "eb", ":%AniseedEvalRange<cr>")
nvim.ex.augroup("END")
nvim.ex.colorscheme("darcula")
nvim.o.cmdheight = 2
nvim.o.relativenumber = false
nvim.o.signcolumn = "yes"
nvim.o.updatetime = 300
nvim.o.scrolloff = 999
nvim.o.exrc = true
nvim.o.shortmess = "a"
nvim.o.modelines = 0
nvim.o.pastetoggle = "<F5>"
nvim.o.tabstop = 4
nvim.o.shiftwidth = 4
nvim.o.softtabstop = 4
nvim.o.expandtab = true
nvim.o.cino = "f.5s"
nvim.o.undofile = true
return {["aniseed/module"] = "config.init"}
