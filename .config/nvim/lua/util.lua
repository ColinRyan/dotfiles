local _2afile_2a = "/home/colin/.config/nvim/fnl/util.fnl"
local _2amodule_name_2a = "dotfiles.util"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local nvim = require("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
local function noremap(mode, from, to)
  return nvim.set_keymap(mode, from, to, {noremap = true})
end
_2amodule_2a["noremap"] = noremap