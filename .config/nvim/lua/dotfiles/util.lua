local _0_0 = nil
do
  local name_23_0_ = "dotfiles.util"
  local loaded_23_0_ = package.loaded[name_23_0_]
  local module_23_0_ = nil
  if ("table" == type(loaded_23_0_)) then
    module_23_0_ = loaded_23_0_
  else
    module_23_0_ = {}
  end
  module_23_0_["aniseed/module"] = name_23_0_
  module_23_0_["aniseed/locals"] = (module_23_0_["aniseed/locals"] or {})
  module_23_0_["aniseed/local-fns"] = (module_23_0_["aniseed/local-fns"] or {})
  package.loaded[name_23_0_] = module_23_0_
  _0_0 = module_23_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {nvim = "aniseed.nvim"}}
  return {require("aniseed.nvim"), _0_0["aniseed/locals"].noremap}
end
local _2_ = _1_(...)
local nvim = _2_[1]
local noremap = _2_[2]
do local _ = ({nil, _0_0, nil})[2] end
local noremap0 = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function noremap1(mode, from, to)
      return nvim.set_keymap(mode, from, to, {noremap = true})
    end
    v_23_0_0 = noremap1
    _0_0["noremap"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["noremap"] = v_23_0_
  noremap0 = v_23_0_
end
return nil