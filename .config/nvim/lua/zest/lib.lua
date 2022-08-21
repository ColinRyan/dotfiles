local _0_0 = nil
do
  local name_0_ = "zest.lib"
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
    return {}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local _2amodule_2a = _0_0
local _2amodule_name_2a = "zest.lib"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local config_path = nil
do
  local v_0_ = nil
  do
    local v_0_0 = vim.fn.stdpath("config")
    _0_0["config-path"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["config-path"] = v_0_
  config_path = v_0_
end
local glob = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function glob0(path)
      return vim.fn.glob(path, true, true, true)
    end
    v_0_0 = glob0
    _0_0["glob"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["glob"] = v_0_
  glob = v_0_
end
local exec = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function exec0(cmd)
      return vim.api.nvim_command(cmd)
    end
    v_0_0 = exec0
    _0_0["exec"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["exec"] = v_0_
  exec = v_0_
end
local norm = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function norm0(cmd)
      return vim.api.nvim_command(("norm! " .. cmd))
    end
    v_0_0 = norm0
    _0_0["norm"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["norm"] = v_0_
  norm = v_0_
end
local eval = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function eval0(str)
      return vim.api.nvim_eval(str)
    end
    v_0_0 = eval0
    _0_0["eval"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["eval"] = v_0_
  eval = v_0_
end
local fn_ = nil
do
  local v_0_ = nil
  do
    local v_0_0 = vim.fn
    _0_0["fn-"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["fn-"] = v_0_
  fn_ = v_0_
end
local nil_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function nil_3f0(x)
      return (nil == x)
    end
    v_0_0 = nil_3f0
    _0_0["nil?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["nil?"] = v_0_
  nil_3f = v_0_
end
local string_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function string_3f0(x)
      return ("string" == type(x))
    end
    v_0_0 = string_3f0
    _0_0["string?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["string?"] = v_0_
  string_3f = v_0_
end
local table_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function table_3f0(x)
      return ("table" == type(x))
    end
    v_0_0 = table_3f0
    _0_0["table?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["table?"] = v_0_
  table_3f = v_0_
end
local sequential_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function sequential_3f0(xs)
      local i = 0
      for _ in pairs(xs) do
        i = (i + 1)
        if nil_3f(xs[i]) then
          return false
        end
      end
      return true
    end
    v_0_0 = sequential_3f0
    _0_0["sequential?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["sequential?"] = v_0_
  sequential_3f = v_0_
end
local function_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function function_3f0(x)
      return ("function" == type(x))
    end
    v_0_0 = function_3f0
    _0_0["function?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["function?"] = v_0_
  function_3f = v_0_
end
local bool_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function bool_3f0(x)
      return ("boolean" == type(x))
    end
    v_0_0 = bool_3f0
    _0_0["bool?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["bool?"] = v_0_
  bool_3f = v_0_
end
local number_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function number_3f0(x)
      return (type(x) == "number")
    end
    v_0_0 = number_3f0
    _0_0["number?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["number?"] = v_0_
  number_3f = v_0_
end
local count = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function count0(xs)
      if table_3f(xs) then
        local maxn = 0
        for k, v in pairs(xs) do
          maxn = (maxn + 1)
        end
        return maxn
      elseif not xs then
        return 0
      else
        return #xs
      end
    end
    v_0_0 = count0
    _0_0["count"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["count"] = v_0_
  count = v_0_
end
local run_21 = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function run_210(f, xs)
      if xs then
        local nxs = count(xs)
        if (nxs > 0) then
          for i = 1, nxs do
            f(xs[i])
          end
          return nil
        end
      end
    end
    v_0_0 = run_210
    _0_0["run!"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["run!"] = v_0_
  run_21 = v_0_
end
local reduce = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function reduce0(f, init, xs)
      local result = init
      local function _2_(x)
        result = f(result, x)
        return nil
      end
      run_21(_2_, xs)
      return result
    end
    v_0_0 = reduce0
    _0_0["reduce"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["reduce"] = v_0_
  reduce = v_0_
end
local concat = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function concat0(...)
      local result = {}
      local function _2_(xs)
        local function _3_(x)
          return table.insert(result, x)
        end
        return run_21(_3_, xs)
      end
      run_21(_2_, {...})
      return result
    end
    v_0_0 = concat0
    _0_0["concat"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["concat"] = v_0_
  concat = v_0_
end
local uniq = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function uniq0(xs)
      local uniq1 = {}
      local hash = {}
      for _, v in ipairs(xs) do
        if not hash[v] then
          hash[v] = true
          table.insert(uniq1, v)
        end
      end
      return uniq1
    end
    v_0_0 = uniq0
    _0_0["uniq"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["uniq"] = v_0_
  uniq = v_0_
end
local flatten = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function flatten0(t, delimiter)
      local delimiter0 = (delimiter or "")
      if string_3f(t) then
        return t
      else
        if (delimiter0 ~= "") then
          local function _2_(_241, _242)
            return (_241 .. _242 .. delimiter0)
          end
          return string.gsub(reduce(_2_, "", t), ".?$", "")
        else
          local function _2_(_241, _242)
            return (_241 .. _242 .. delimiter0)
          end
          return reduce(_2_, "", t)
        end
      end
    end
    v_0_0 = flatten0
    _0_0["flatten"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["flatten"] = v_0_
  flatten = v_0_
end
local merge_21 = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function merge_210(base, ...)
      local function _2_(acc, m)
        if m then
          for k, v in pairs(m) do
            acc[k] = v
          end
        end
        return acc
      end
      return reduce(_2_, (base or {}), {...})
    end
    v_0_0 = merge_210
    _0_0["merge!"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["merge!"] = v_0_
  merge_21 = v_0_
end
local merge = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function merge0(...)
      return merge_21({}, ...)
    end
    v_0_0 = merge0
    _0_0["merge"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["merge"] = v_0_
  merge = v_0_
end
local map = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function map0(f, xs)
      local result = {}
      local function _2_(x)
        local mapped = f(x)
        local function _3_()
          if (0 == select("#", mapped)) then
            return nil
          else
            return mapped
          end
        end
        return table.insert(result, _3_())
      end
      run_21(_2_, xs)
      return result
    end
    v_0_0 = map0
    _0_0["map"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["map"] = v_0_
  map = v_0_
end
local empty_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function empty_3f0(xs)
      return (0 == count(xs))
    end
    v_0_0 = empty_3f0
    _0_0["empty?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["empty?"] = v_0_
  empty_3f = v_0_
end
local full_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function full_3f0(xs)
      return (0 ~= count(xs))
    end
    v_0_0 = full_3f0
    _0_0["full?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["full?"] = v_0_
  full_3f = v_0_
end
local index_as_method = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function index_as_method0(callback)
      local function _2_(self, index)
        local function _3_(...)
          return callback(index, ...)
        end
        self[index] = _3_
        return rawget(self, index)
      end
      return setmetatable({}, {__index = _2_})
    end
    v_0_0 = index_as_method0
    _0_0["index-as-method"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["index-as-method"] = v_0_
  index_as_method = v_0_
end
return nil