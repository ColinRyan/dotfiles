local _2afile_2a = "/home/colin/.config/nvim/fnl/config/util.fnl"
local nvim = require("aniseed.nvim")
local function expand(path)
  return nvim.fn.expand(path)
end
local function glob(path)
  return nvim.fn.glob(path, true, true, true)
end
local function exists_3f(path)
  return (nvim.fn.filereadable(path) == 1)
end
local function lua_file(path)
  return nvim.ex.luafile(path)
end
return {["aniseed/module"] = "config.util", expand = expand, glob = glob, ["exists?"] = exists_3f, ["lua-file"] = lua_file, ["config-path"] = nvim.fn.stdpath("config")}