local _0_0 = nil
do
  local name_0_ = "zest.sl"
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
    return {require("zest.au"), require("zest.lib")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {["require-macros"] = {["zest.macros"] = true}, require = {au = "zest.au", z = "zest.lib"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local au = _local_0_[1]
local z = _local_0_[2]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "zest.sl"
do local _ = ({nil, _0_0, {{nil}, nil, nil, nil}})[2] end
local draw_events = {"BufEnter"}
local hl_reset = "LineNr"
local order_id = 0
local draw = nil
do
  local v_0_ = nil
  local function draw0()
    local bufnr = vim.fn.bufnr()
    vim.wo.statusline = ("%#" .. hl_reset .. "#" .. z.flatten(_Z.sl[bufnr]))
    return nil
  end
  v_0_ = draw0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["draw"] = v_0_
  draw = v_0_
end
local cache = nil
do
  local v_0_ = nil
  local function cache0(id, value)
    local bufnr = vim.fn.bufnr()
    if not _Z.sl[bufnr] then
      _Z.sl[bufnr] = {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""}
    end
    if value then
      _Z.sl[bufnr][id] = value
      return nil
    else
      _Z.sl[bufnr][id] = ""
      return nil
    end
  end
  v_0_ = cache0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["cache"] = v_0_
  cache = v_0_
end
local format = nil
do
  local v_0_ = nil
  local function format0(input, options)
    local output = (input or "")
    if (options and (output ~= "")) then
      output = ((" "):rep(options[3]) .. output)
      output = (output .. (" "):rep(options[4]))
      if options[5] then
        output = ("%#" .. options[5] .. "#" .. output .. "%#" .. hl_reset .. "#")
      end
      output = ((" "):rep(options[1]) .. output)
      output = (output .. (" "):rep(options[2]))
    end
    return output
  end
  v_0_ = format0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["format"] = v_0_
  format = v_0_
end
local add = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function add0(events, options, action)
      if events then
        draw_events = z.concat(draw_events, events)
      end
      order_id = (order_id + 1)
      local id = order_id
      if z["string?"](action) then
        local function _3_()
          local output = format(action, options)
          return cache(id, output)
        end
        return au["set-au"]({"BufEnter"}, "*", _3_)
      else
        local function _3_()
          local output = format(action(), options)
          return cache(id, output)
        end
        return au["set-au"](events, "*", _3_)
      end
    end
    v_0_0 = add0
    _0_0["add"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["add"] = v_0_
  add = v_0_
end
local init = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function init0()
      draw_events = z.uniq(draw_events)
      local function _2_()
        return draw()
      end
      return au["set-au"](draw_events, "*", _2_)
    end
    v_0_0 = init0
    _0_0["init"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["init"] = v_0_
  init = v_0_
end
return nil