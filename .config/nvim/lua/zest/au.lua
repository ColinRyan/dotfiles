local _0_0 = nil
do
  local name_0_ = "zest.au"
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
local _2amodule_name_2a = "zest.au"
do local _ = ({nil, _0_0, {{nil}, nil, nil, nil}})[2] end
local id = 0
local set_au = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function set_au0(events, filetypes, action)
      local events0 = z.flatten(events, ",")
      local filetypes0 = z.flatten(filetypes, ",")
      local body = nil
      local function _2_()
        if z["function?"](action) then
          local function _2_()
            local z_0_ = require("zest.lib")
            local id_0_ = ("__" .. z_0_.count(_Z.fn))
            _G["_Z"]["fn"][id_0_] = action
            return ("v:lua._Z.fn." .. id_0_ .. "()")
          end
          return (":call " .. _2_())
        else
          return action
        end
      end
      body = ("au " .. events0 .. " " .. filetypes0 .. " " .. _2_())
      id = (id + 1)
      return z["run!"](z.exec, {("augroup " .. id), "autocmd!", body, "augroup end"})
    end
    v_0_0 = set_au0
    _0_0["set-au"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["set-au"] = v_0_
  set_au = v_0_
end
return nil