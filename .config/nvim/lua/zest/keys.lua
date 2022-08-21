local _0_0 = nil
do
  local name_0_ = "zest.keys"
  local module_0_ = nil
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {require("zest.lib")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {["require-macros"] = {["zest.macros"] = true}, require = {z = "zest.lib"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local z = _local_0_[1]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "zest.keys"
do local _ = ({nil, _0_0, {{nil}, nil, nil, nil}})[2] end
local _id = 0
local set_keymaps = nil
do
  local v_0_ = nil
  local function set_keymaps0(modes, options, lhs, rhs)
    for mode in modes:gmatch(".") do
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
    return nil
  end
  v_0_ = set_keymaps0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["set-keymaps"] = v_0_
  set_keymaps = v_0_
end
local map_keys = nil
do
  local v_0_ = nil
  local function map_keys0(modes, ...)
    local params = {...}
    local rhs = table.remove(params)
    local lhs = table.remove(params)
    local params0 = unpack(params)
    local opts = {noremap = true}
    if z["full?"](params0) then
      for _, o in ipairs(params0) do
        if (o == "remap") then
          opts["noremap"] = false
        else
          opts[o] = true
        end
      end
    end
    if z["string?"](rhs) then
      return set_keymaps(modes, opts, lhs, rhs)
    else
      local cm = nil
      if opts.expr then
        local z_0_ = require("zest.lib")
        local id_0_ = ("__" .. z_0_.count(_Z.fn))
        _G["_Z"]["fn"][id_0_] = rhs
        cm = ("v:lua._Z.fn." .. id_0_ .. "()")
      else
        local _3_
        do
          local z_0_ = require("zest.lib")
          local id_0_ = ("__" .. z_0_.count(_Z.fn))
          _G["_Z"]["fn"][id_0_] = rhs
          _3_ = ("v:lua._Z.fn." .. id_0_ .. "()")
        end
        cm = (":call " .. _3_ .. "<cr>")
      end
      return set_keymaps(modes, opts, lhs, cm)
    end
  end
  v_0_ = map_keys0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["map-keys"] = v_0_
  map_keys = v_0_
end
local k = z["index-as-method"](map_keys)
k.leader = function(key)
  vim.g.mapleader = key
  return nil
end
k.localleader = function(key)
  vim.g.maplocalleader = key
  return nil
end
return k