local _2afile_2a = "/home/colin/.config/nvim/fnl/init.fnl"
local _2amodule_name_2a = "dotfiles.init"
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
local colorizer, core, nvim, nvim_window, specs, telescope, util = require("colorizer"), require("aniseed.nvim"), require("aniseed.nvim"), require("nvim-window"), require("specs"), require("telescope"), require("dotfiles.util")
do end (_2amodule_locals_2a)["colorizer"] = colorizer
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["nvim-window"] = nvim_window
_2amodule_locals_2a["specs"] = specs
_2amodule_locals_2a["telescope"] = telescope
_2amodule_locals_2a["util"] = util
print("init.fnl")
do end (vim.opt)["signcolumn"] = "yes"
vim.opt["updatetime"] = 300
vim.opt["scrolloff"] = 999
vim.opt["exrc"] = true
vim.opt["shortmess"] = "a"
vim.opt["modelines"] = 0
vim.opt["pastetoggle"] = "<F5>"
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt["softtabstop"] = 4
vim.opt["expandtab"] = true
vim.opt["cino"] = "f.5s"
vim.opt["encoding"] = "utf-8"
vim.opt["autoindent"] = true
vim.opt["cindent"] = true
vim.opt["showmode"] = true
vim.opt["showcmd"] = true
vim.opt["hidden"] = true
vim.opt["wildmenu"] = true
vim.opt["wildmode"] = "list:longest"
vim.opt["visualbell"] = true
vim.opt["cursorline"] = true
vim.opt["ttyfast"] = true
vim.opt["ruler"] = true
vim.opt["backspace"] = "indent,eol,start"
vim.opt["laststatus"] = 2
vim.opt["undofile"] = true
vim.opt["backupcopy"] = "yes"
vim.opt["ignorecase"] = true
vim.opt["smartcase"] = true
vim.opt["gdefault"] = true
vim.opt["incsearch"] = true
vim.opt["showmatch"] = true
vim.opt["wrap"] = true
vim.opt["formatoptions"] = "tcqrn1"
vim.opt["foldenable"] = true
vim.opt["foldlevel"] = 0
vim.opt["foldnestmax"] = 20
vim.opt["foldmethod"] = "indent"
nvim.ex.set = "wildignore+=*/.git/*,*/tmp/*,*.swp"
nvim.ex.set = "sessioniptions+=tabpages,globals"
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
  _G.assert((nil ~= to), "Missing argument to on /home/colin/.config/nvim/fnl/init.fnl:98")
  _G.assert((nil ~= from), "Missing argument from on /home/colin/.config/nvim/fnl/init.fnl:98")
  _G.assert((nil ~= mode), "Missing argument mode on /home/colin/.config/nvim/fnl/init.fnl:98")
  local defaultOptions = {noremap = true}
  return vim.keymap.set(mode, from, to, mergeRight(defaultOptions, _3foptions))
end
local function noremap(mode, from, to, _3foptions)
  _G.assert((nil ~= to), "Missing argument to on /home/colin/.config/nvim/fnl/init.fnl:109")
  _G.assert((nil ~= from), "Missing argument from on /home/colin/.config/nvim/fnl/init.fnl:109")
  _G.assert((nil ~= mode), "Missing argument mode on /home/colin/.config/nvim/fnl/init.fnl:109")
  local defaultOptions = {noremap = true}
  return vim.keymap.set(mode, from, to, mergeRight(defaultOptions, _3foptions))
end
vim.g["mapleader"] = ","
vim.g["maplocalleader"] = "-"
specs.setup({show_jumps = true, min_jumps = 30, popup = {delay_ms = 0, inc_ms = 10, belend = 10, width = 10, winhl = "PMenu", fader = specs.linear_fader, resizer = specs.shrink_resizer}, ignore_filetypes = {}, ignore_buftypes = {nofile = true}})
do end (vim.g)["coc_root_patterns"] = {".git", ".env"}
colorizer.setup()
telescope.load_extension("coc")
nvim.g["conjure#client#fennel#aniseed#aniseed_module_prefix"] = "aniseed."
nvim.g.oscyank_max_length = 2000000
nvim.g.EasyMotion_do_mapping = 0
nvim.b.lion_sqeeze_spaces = 1
nvim.g.dashboard_default_executive = "telescope"
nvim.g.gitgutter_max_signs = 1200
nvim.g.gitgutter_diff_args = "-w"
nvim.g.surround_indent = 0
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
nvim.g.ale_fix_on_save = 0
nvim.g.ale_disable_lsp = 1
nvim.g.ale_linters = {php = {"php", "phpcs", "phpmd", "phpstan", "php-cs-fixer", "phan"}, javascript = {"flow", "tsserver"}, ["javascript.jsx"] = {"flow", "tsserver"}, python = {"flake8", "black"}, flow = {"flow", "tsserver"}, json = {}, elm = {"elm_ls"}, jsx = {"flow", "tsserver"}, cs = {"OmniSharp"}}
nvim.g.ale_fixers = {php = {"phpcbf", "php_cs_fixer"}, python = {"autopep8", "isort", "black"}, css = {"prettier"}, sass = {"prettier"}, scss = {"prettier"}, javascript = {"importjs", "prettier"}, ["javascript.jsx"] = {"importjs", "prettier"}, jsx = {"importjs"}}
vim.g["UltiSnipsExpandTrigger"] = "<leader>e"
vim.g["UltiSnipsJumpForwardTrigger"] = "<c-j>"
vim.g["UltiSnipsJumpBackwardTrigger"] = "<c-k>"
vim.g["UltiSnipsSnippetsDir"] = (nvim.env.HOME .. "/.vim/snippets/UltiSnips")
do end (vim.g)["UltiSnipsSnippetDirectories"] = {"UltiSnips", (nvim.env.HOME .. "/.vim/snippets/UltiSnips")}
vim.g["UltiSnipsEditSplit"] = "vertical"
vim.g["closetag_filenames"] = "*.html,*.xhtml,*.phtml,*.js"
vim.g["closetag_xhtml_filenames"] = "*.xhtml,*.jsx,*.js"
vim.g["closetag_filetypes"] = "html,xhtml,phtml,js"
vim.g["closetag_xhtml_filetypes"] = "xhtml,jsx,js"
vim.g["closetag_emptyTags_caseSensitive"] = 1
vim.g["closetag_shortcut"] = ">"
vim.g["closetag_close_shortcut"] = "<leader>>"
vim.g["skeletons#skeletonsDir"] = "~/.config/nvim/skeletons"
vim.g["skeletons#autoRegister"] = 1
vim.g["test#strategy"] = "neovim"
vim.g["loaded_python_provider"] = 1
vim.g["python_host_skip_check"] = 1
vim.g["python_host_prog"] = "/usr/bin/python"
vim.g["python3_host_skip_check"] = 1
vim.g["python3_host_prog"] = "/usr/bin/python3"
vim.g["javascript_plugin_flow"] = 1
vim.g["ctrlp_max_files"] = 30001
vim.g["ctrlp_clear_cache_on_exit"] = 0
vim.g["ctrlp_working_path_mode"] = "wr"
vim.g["ctrlp_cmdg"] = "CtrlPTag"
vim.g["ctrlp_lazy_update"] = 1
vim.g["ctrlp_by_filename"] = 1
vim.g["ctrlp_match_window"] = "bottom,order:ttb"
vim.g["ctrlp_root_markers"] = {"composer.json", ".gitignore"}
vim.g["ctrlp_open_func"] = {files = "GoToMostImportantPlace"}
vim.g["taggatron_verbose"] = 0
vim.g["tagbar_autoclose"] = 1
vim.g["tagbar_autofocus"] = 1
vim.g["tagbar_show_linenumbers"] = 2
vim.g["tagbar_compact"] = 2
vim.g["NERDTreeShowLineNumbers"] = 1
vim.g["VimuxUseNearest"] = 1
vim.g["test#strategy"] = "vimux"
vim.fn["textobj#user#plugin"]("selfclosingtag", {tag = {pattern = {"<", "/>"}, ["select-a"] = "aT", ["select-i"] = "iT"}})
vim.fn["denite#custom#map"]("insert", "<C-j>", "<denite:move_to_next_line>", "noremap")
vim.fn["denite#custom#map"]("insert", "Up", "<denite:move_to_next_line>", "noremap")
vim.fn["denite#custom#map"]("insert", "<C-k>", "<denite:move_to_previous_line>", "noremap")
vim.fn["denite#custom#map"]("insert", "Down", "<denite:move_to_previous_line>", "noremap")
noremap("n", "<leader>q", ":if bufname('%') == '' <bar> :q <bar> else <bar> :wq <bar> endif<cr>")
noremap("v", "dc", ":g/console/d<cr>")
noremap("v", "dd", ":g/./d<cr>")
noremap("n", "<leader>x", ":ArgWrap<cr>")
local function _3_()
  return nvim_window.pick()
end
remap("n", "gw", _3_)
noremap("n", "<leader>tl", "<Plug>TranslateR")
noremap("v", "<leader>tl", "<Plug>TranslateRV")
noremap("n", "<leader>gg", ":Twiggy<cr>")
noremap("n", "<leader>gs", ":vertical Git<cr>")
noremap("n", "<leader>gr", ":Gr<cr>")
noremap("n", "<leader>gw", ":Gw<cr>")
noremap("n", "<leader>nt", ":tabnew<cr>")
noremap("n", "gt", ":Denite tab<cr>")
noremap("n", "<leader>.", ":vsplit ~/.config/nvim/fnl/init.fnl<cr>")
noremap("n", "<leader>,", ":vsplit $MYVIMRC<cr>")
noremap("n", "<leader>;", ":vsplit ~/.config/nvim/lua/init.lua<cr>")
noremap("n", "<leader>v", ":vnew<cr><C-f>")
noremap("v", "<leader>c", ":OSCYank<cr>")
noremap("n", "<C-f>", "<cmd>Telescope find_files<cr>")
noremap("n", "s", "<Plug>(easymotion-s2)", {noremap = false})
noremap("n", "<leader>gb", ":Gblame -w<cr>")
do
  vim.cmd("augroup colorscheme\nautocmd!")
  do
    print("configuring Colorsheme")
    local function _4_()
      return nvim.ex.colorscheme("sin")
    end
    __core_symfn_1 = _4_
    vim.cmd("autocmd FileType * call v:lua.__core_symfn_1()")
  end
  vim.cmd("augroup END")
end
local function configureDeniteBuffer()
  print("configuring Denite")
  noremap("n", "<ESC>", "denite#do_map('quit')", {silent = true, expr = true})
  noremap("n", "q", "denite#do_map('quit')", {silent = true, expr = true})
  noremap("n", "<CR>", "denite#do_map('do_action')", {silent = true, expr = true})
  return noremap("n", "p", "denite#do_map('do_action','preview')", {silent = true, expr = true})
end
local function hasPlugin(name)
  return (1 == vim.fn.has_key(vim.g.plugs, name))
end
local function MakePluginMappings()
  if hasPlugin("denite.nvim") then
    noremap("n", "<leader>eca", ":execute 'Denite -split=floating file/rec:~/.config/nvim/after/ftplugin'<cr>")
    noremap("n", "<leader>ep", ":execute 'Denite -split=floating file/rec:~/.config/nvim/autoload'<cr>")
    noremap("n", "<leader>es", ":execute 'Denite -split=floating file/rec:~/.config/nvim/skeletons'<cr>")
    noremap("n", "<leader>efp", ":execute 'Denite -split=floating file/rec:~/.config/nvim/nvim/fnl'<cr>")
    local function _5_()
      return configureDeniteBuffer()
    end
    __core_symfn_2 = _5_
    vim.cmd("autocmd FileType denite call v:lua.__core_symfn_2()")
  else
  end
  return print("MakePluginMapping")
end
do
  vim.cmd("augroup startup\nautocmd!")
  do
    do
      local function _7_()
        vim.g["std_in"] = 1
        return nil
      end
      __core_symfn_3 = _7_
      vim.cmd("autocmd StdinReadPre * call v:lua.__core_symfn_3()")
    end
    do
      local function _8_()
        return vim.fn["vista#RunForNearestMethodOrFunction"]()
      end
      __core_symfn_4 = _8_
      vim.cmd("autocmd VimEnter * call v:lua.__core_symfn_4()")
    end
    local function _9_()
      return MakePluginMappings()
    end
    __core_symfn_5 = _9_
    vim.cmd("autocmd VimEnter * call v:lua.__core_symfn_5()")
  end
  vim.cmd("augroup END")
end
if (1 == vim.fn.executable("rg")) then
  nvim.g.greprg = "rg --color=never"
  vim.g["ackprg"] = "rg --vimgrep --no-heading"
  vim.g["ctrlp_user_command"] = "rg %s --files --color=never --glob ''"
  vim.g["ctrlp_use_cache"] = 0
  vim.fn["denite#custom#var"]("grep", "command", {"rg"})
  vim.fn["denite#custom#var"]("grep", "default_opts", {"--vimgrep", "--no-heading"})
  vim.fn["denite#custom#var"]("grep", "recursive_opts", {})
  vim.fn["denite#custom#var"]("grep", "pattern_opts", {"--regexp"})
  vim.fn["denite#custom#var"]("grep", "separator", {"--"})
  vim.fn["denite#custom#var"]("grep", "final_opts", {""})
else
end
print(vim.fn.has_key(vim.g.plugs, "denite.nvim"))
return print("complete")
