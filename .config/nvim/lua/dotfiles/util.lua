local _2afile_2a = "fnl/dotfiles/util.fnl"
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
local function isNil(value)
  if (nil == value) then
    return true
  else
    return false
  end
end
local function mergeRight(a, b)
  local right = b
  if isNil(right) then
    right = {}
  else
  end
  for key, value in pairs(right) do
    a[key] = value
  end
  return a
end
local function remap(mode, from, to, _3foptions)
  _G.assert((nil ~= to), "Missing argument to on /home/colin/.config/nvim/fnl/dotfiles/util.fnl:19")
  _G.assert((nil ~= from), "Missing argument from on /home/colin/.config/nvim/fnl/dotfiles/util.fnl:19")
  _G.assert((nil ~= mode), "Missing argument mode on /home/colin/.config/nvim/fnl/dotfiles/util.fnl:19")
  local defaultOptions = {noremap = true}
  return vim.keymap.set(mode, from, to, mergeRight(defaultOptions, _3foptions))
end
local function noremap(mode, from, to, _3foptions)
  _G.assert((nil ~= to), "Missing argument to on /home/colin/.config/nvim/fnl/dotfiles/util.fnl:30")
  _G.assert((nil ~= from), "Missing argument from on /home/colin/.config/nvim/fnl/dotfiles/util.fnl:30")
  _G.assert((nil ~= mode), "Missing argument mode on /home/colin/.config/nvim/fnl/dotfiles/util.fnl:30")
  local defaultOptions = {noremap = true}
  return vim.keymap.set(mode, from, to, mergeRight(defaultOptions, _3foptions))
end
return {remap = remap, noremap = noremap, test = "catsass"}