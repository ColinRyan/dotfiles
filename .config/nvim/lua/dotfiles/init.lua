local _0_0 = nil
do
  local name_23_0_ = "dotfiles.init"
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
  _0_0["aniseed/local-fns"] = {require = {core = "aniseed.nvim", nvim = "aniseed.nvim", util = "dotfiles.util"}}
  return {require("aniseed.nvim"), require("aniseed.nvim"), require("dotfiles.util"), _0_0["aniseed/locals"].noremap}
end
local _2_ = _1_(...)
local core = _2_[1]
local nvim = _2_[2]
local util = _2_[3]
local noremap = _2_[4]
do local _ = ({nil, _0_0, nil})[2] end
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
nvim.o.encoding = "utf-8"
nvim.o.autoindent = true
nvim.o.cindent = true
nvim.o.showmode = true
nvim.o.showcmd = true
nvim.o.hidden = true
nvim.o.wildmenu = true
nvim.o.wildmode = "list:longest"
nvim.o.visualbell = true
nvim.o.cursorline = true
nvim.o.ttyfast = true
nvim.o.ruler = true
nvim.o.backspace = "indent,eol,start"
nvim.o.laststatus = 2
nvim.o.undofile = true
nvim.o.backupcopy = "yes"
nvim.o.ignorecase = true
nvim.o.smartcase = true
nvim.o.gdefault = true
nvim.o.incsearch = true
nvim.o.showmatch = true
nvim.o.wrap = true
nvim.o.formatoptions = "tcqrn1"
nvim.o.foldenable = true
nvim.o.foldlevel = 0
nvim.o.foldnestmax = 20
nvim.o.foldmethod = "indent"
nvim.ex.set = "wildignore+=*/.git/*,*/tmp/*,*.swp"
nvim.ex.set = "sessioniptions+=tabpages,globals"
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
nvim.g.mapleader = ","
nvim.g.maplocalleader = "-"
nvim.g.EasyMotion_do_mapping = 0
nvim.b.lion_sqeeze_spaces = 1
nvim.g.gitgutter_max_signs = 1200
nvim.g.gitgutter_diff_args = "-w"
nvim.g.surround_indent = 0
print("running")
nvim.g["vista#renderer#enable_icon"] = 1
nvim.g.vista_default_executive = "coc"
nvim.g.vista_sidebar_width = 60
nvim.g.tmux_navigator_save_on_switch = 2
nvim.g.ale_javascript_prettier_use_local_config = 1
nvim.g.ale_lint_on_text_changed = "never"
nvim.g.ale_lint_delay = 1000
nvim.g.ale_sign_column_always = 1
nvim.g.ale_lint_on_save = 1
nvim.g.ale_set_quickfix = 0
nvim.g.ale_set_locallist = 0
nvim.g.ale_open_list = 0
nvim.g.ale_keep_list_window_open = 0
nvim.g.ale_fix_on_save = 1
nvim.g.ale_linters = {["javascript.jsx"] = {"flow", "tsserver"}, cs = {"OmniSharp"}, elm = {"elm_ls"}, flow = {"flow", "tsserver"}, javascript = {"flow", "tsserver"}, json = {}, jsx = {"flow", "tsserver"}, php = {"php", "phpcs", "phpmd", "phpstan", "php-cs-fixer", "phan"}, python = {"pycodestyle", "mypy", "flake8", "prospector", "pyflakes"}}
nvim.g.ale_fixers = {["javascript.jsx"] = {"importjs", "prettier"}, css = {"prettier"}, javascript = {"importjs", "prettier"}, jsx = {"importjs"}, php = {"phpcbf", "php_cs_fixer"}, python = {"black", "isort"}, sass = {"prettier"}, scss = {"prettier"}}
nvim.g.UltiSnipsExpandTrigger = "<leader>e"
nvim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
nvim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
nvim.g.UltiSnipsSnippetsDir = (nvim.env.HOME .. "/.vim/snippets/UltiSnips")
nvim.g.UltiSnipsSnippetDirectories = {"UltiSnips", (nvim.env.HOME .. "/.vim/snippets/UltiSnips")}
nvim.g.UltiSnipsEditSplit = "vertical"
return nil