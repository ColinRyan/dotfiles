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
local ai, autopairs, core, dap, dap_python, dap_vt, dapui, dressing, entry_display, eyeliner, git_sessions, gitsigns, gpt, hc, hlargs, lualine, nvim, nvim_ts_autotag, nvim_window, os, osc52, sin, smartyank, substitute, tabby, telescope, telescope_sorters, telescope_utils, toggleterm, treesitterConfigs, treesitterParsers, ts_utils, util = require("mini.ai"), require("nvim-autopairs"), require("aniseed.nvim"), require("dap"), require("dap-python"), require("nvim-dap-virtual-text"), require("dapui"), require("dressing"), require("telescope.pickers.entry_display"), require("eyeliner"), require("git-sessions"), require("gitsigns"), require("gpt"), require("nvim-highlight-colors"), require("hlargs"), require("lualine"), require("aniseed.nvim"), require("nvim-ts-autotag"), require("nvim-window"), require("os"), require("osc52"), require("sin"), require("smartyank"), require("substitute"), require("tabby.tabline"), require("telescope"), require("telescope.sorters"), require("telescope.utils"), require("toggleterm"), require("nvim-treesitter.configs"), require("nvim-treesitter.parsers"), require("nvim-treesitter.ts_utils"), require("dotfiles.util")
do end (_2amodule_locals_2a)["ai"] = ai
_2amodule_locals_2a["autopairs"] = autopairs
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["dap"] = dap
_2amodule_locals_2a["dap-python"] = dap_python
_2amodule_locals_2a["dap-vt"] = dap_vt
_2amodule_locals_2a["dapui"] = dapui
_2amodule_locals_2a["dressing"] = dressing
_2amodule_locals_2a["entry-display"] = entry_display
_2amodule_locals_2a["eyeliner"] = eyeliner
_2amodule_locals_2a["git-sessions"] = git_sessions
_2amodule_locals_2a["gitsigns"] = gitsigns
_2amodule_locals_2a["gpt"] = gpt
_2amodule_locals_2a["hc"] = hc
_2amodule_locals_2a["hlargs"] = hlargs
_2amodule_locals_2a["lualine"] = lualine
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["nvim-ts-autotag"] = nvim_ts_autotag
_2amodule_locals_2a["nvim-window"] = nvim_window
_2amodule_locals_2a["os"] = os
_2amodule_locals_2a["osc52"] = osc52
_2amodule_locals_2a["sin"] = sin
_2amodule_locals_2a["smartyank"] = smartyank
_2amodule_locals_2a["substitute"] = substitute
_2amodule_locals_2a["tabby"] = tabby
_2amodule_locals_2a["telescope"] = telescope
_2amodule_locals_2a["telescope-sorters"] = telescope_sorters
_2amodule_locals_2a["telescope-utils"] = telescope_utils
_2amodule_locals_2a["toggleterm"] = toggleterm
_2amodule_locals_2a["treesitterConfigs"] = treesitterConfigs
_2amodule_locals_2a["treesitterParsers"] = treesitterParsers
_2amodule_locals_2a["ts_utils"] = ts_utils
_2amodule_locals_2a["util"] = util
local remap = util.remap
local noremap = util.noremap
print("init.fnl")
do end (vim.opt)["clipboard"] = "unnamed"
vim.opt["termguicolors"] = true
vim.opt["guifont"] = "JetBrainsMono Nerd Font"
vim.opt["signcolumn"] = "yes"
vim.opt["updatetime"] = 300
vim.opt["scrolloff"] = 999
vim.opt["exrc"] = true
vim.opt["shortmess"] = "a"
vim.opt["modelines"] = 0
vim.opt["tabstop"] = 2
vim.opt["shiftwidth"] = 2
vim.opt["softtabstop"] = 2
vim.opt["expandtab"] = true
vim.opt["cino"] = "f.5s"
vim.opt["encoding"] = "utf-8"
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
vim.opt["foldlevel"] = 99
vim.opt["foldlevelstart"] = 0
vim.opt["foldclose"] = "all"
vim.opt["foldnestmax"] = 4
nvim.ex.set = "wildignore+=*/.git/*,*/tmp/*,*.swp"
nvim.ex.set = "sessioniptions+=tabpages,globals"
vim.g["mapleader"] = ","
vim.g["maplocalleader"] = "-"
hlargs.setup({})
git_sessions.setup({})
lualine.setup({})
sin.setup({extensions = {telescope = true}})
eyeliner.setup({highlight_on_key = true, dim = true})
dapui.setup({})
dap_vt.setup({clear_on_continue = false})
dap_python.setup("~/venvs/neovim/bin/python")
dap_python.test_runner = "pytest"
local function _1_()
  return ("~/venvs/neovim/bin/python")()
end
dap_python.resolve_python = _1_
table.insert(dap.configurations.python, {type = "python", request = "attach", name = "Docker: Django Debug", connect = {host = "localhost", port = 5678}, pathMappings = {{localRoot = vim.fn.getcwd(), remoteRoot = "/app"}}, django = true, justMyCode = true})
noremap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
noremap("n", "<leader>dd", ":lua require'dap'.continue()<CR>")
noremap("n", "<leader>dn", ":lua require'dap'.step_over()<CR>")
noremap("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
noremap("n", "<leader>do", ":lua require'dap'.step_out()<CR>")
noremap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
noremap("n", "<leader>dm", ":lua require'dap-python'.test_method()<CR>")
noremap("n", "<leader>dc", ":lua require'dap-python'.test_class()<CR>")
noremap("n", "<leader>ds", ":lua require'dap-python'.debug_selection()<CR>")
noremap("n", "<leader>dt", ":lua require'dapui'.toggle()<CR>")
noremap("n", "<leader>de", ":lua require'dapui'.eval()<CR>")
noremap("v", "<leader>de", ":lua require'dapui'.eval()<CR>")
do end (vim.g)["vimwiki_table_mapping"] = 0
noremap("n", "<leader>wss", ":vsplit ~/vimwiki/Scratchpad.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o")
noremap("n", "<leader>wp", ":vsplit ~/vimwiki/Problems.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o")
noremap("n", "<leader>wl", ":vsplit ~/vimwiki/LessonsLearned.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o")
noremap("n", "<leader>wf", ":vsplit ~/vimwiki/improvements.wiki<CR>O<esc>i<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><CR><Esc>o")
do end (vim.g)["vimwiki_list"] = __fnl_global___3d
noremap("i", "<C-TAB>", "copilot#Accept('<CR>')", {silent = true, expr = true})
hc.setup()
vim.o.showtabline = 2
tabby.use_preset("active_wins_at_tail", {theme = {fill = "TabLineFill", head = "TabLine", current_tab = "TabLineSel"}, nerdfont = true})
local home = vim.fn.expand("$HOME")
toggleterm.setup({open_mapping = "`", direction = "float"})
autopairs.setup({enable_abbr = true, check_ts = true})
do end ((autopairs.get_rule("'"))[1])["not_filetypes"] = {"jsx", "javascript.react", "javascript", "tsx", "typescript", "typescriptreact"}
(autopairs.get_rule("\""))[1]["not_filetypes"] = {"jsx", "javascript.react", "javascript", "tsx", "typescript", "typescriptreact"}
autopairs.get_rule("{")["not_filetypes"] = {"jsx", "javascript.react", "javascript", "tsx", "typescript", "typescriptreact"}
autopairs.get_rule("[")["not_filetypes"] = {"jsx", "javascript.react", "javascript", "tsx", "typescript", "typescriptreact"}
ai.setup()
treesitterConfigs.setup({disable = {"html", "htmldjango"}, matchup = {enable = false, disable = {"html", "htmldjango"}}, textobjects = {disable = {"html", "htmldjango"}, select = {enable = true, lookahead = true, keymaps = {af = "@function.outer", ai = "@function.inner"}}}, highlight = {enable = true, disable = {"html", "htmldjango"}, additional_vim_regex_highlighting = false}, indent = {enable = false, disable = {"html", "htmldjango"}, additional_vim_regex_highlighting = false}, ensure_installed = {"tsx", "typescript", "javascript", "graphql", "python", "fennel", "json", "yaml", "css", "lua", "html", "htmldjango"}, autotag = {enable = true, disable = {"html", "htmldjango"}}, incremental_selection = {enable = true, disable = {"html", "htmldjango"}, keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}}})
local parserConfig = treesitterParsers.get_parser_configs()
parserConfig.tsx.filetype_to_parsername = {"javascript", "typescript.tsx", "typescriptreact", "javascriptreact"}
smartyank.setup({})
substitute.setup({})
gitsigns.setup({signs = {add = {hl = "GitSignsAdd", text = "+"}, change = {hl = "GitSignsChange", text = "~"}}})
do end (vim.g)["coc_root_patterns"] = {".git", ".env"}
telescope.setup({defaults = {sorting_strategy = "descending", preview = false, file_ignore_patterns = {}, vimgrep_arguments = {"rg", "--files", "--hidden", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"}}})
telescope.load_extension("coc")
telescope.load_extension("fzf")
nvim.g["conjure#client#fennel#aniseed#aniseed_module_prefix"] = "aniseed."
osc52.setup({max_length = 0, trim = true, tmux_pass_through = true})
nvim.g.EasyMotion_do_mapping = 0
nvim.b.lion_sqeeze_spaces = 1
nvim.g.dashboard_default_executive = "telescope"
nvim.g.surround_indent = 0
nvim.g["vista#renderer#enable_icon"] = 1
nvim.g.vista_default_executive = "coc"
nvim.g.vista_sidebar_width = 60
nvim.g.tmux_navigator_save_on_switch = 2
vim.g["UltiSnipsExpandTrigger"] = "<leader>e"
vim.g["UltiSnipsJumpForwardTrigger"] = "<c-j>"
vim.g["UltiSnipsJumpBackwardTrigger"] = "<c-k>"
vim.g["UltiSnipsSnippetsDir"] = (nvim.env.HOME .. "/.vim/snippets/UltiSnips")
do end (vim.g)["UltiSnipsSnippetDirectories"] = {"UltiSnips", (nvim.env.HOME .. "/.vim/snippets/UltiSnips")}
vim.g["UltiSnipsEditSplit"] = "vertical"
nvim_ts_autotag.setup({})
do end (vim.g)["closetag_filenames"] = "*.html,*.xhtml,*.phtml,*.js"
vim.g["closetag_xhtml_filenames"] = "*.xhtml,*.jsx,*.js"
vim.g["closetag_filetypes"] = "html,xhtml,phtml,js"
vim.g["closetag_xhtml_filetypes"] = "xhtml,jsx,js"
vim.g["closetag_emptyTags_caseSensitive"] = 1
vim.g["closetag_shortcut"] = ">"
vim.g["closetag_close_shortcut"] = "<leader>>"
vim.g["skeletons#skeletonsDir"] = "~/.config/nvim/skeletons"
vim.g["skeletons#autoRegister"] = 1
vim.g["loaded_python_provider"] = 1
vim.g["python_host_skip_check"] = 1
vim.g["python_host_prog"] = "/usr/bin/python"
vim.g["python3_host_skip_check"] = 1
vim.g["python3_host_prog"] = "~/venvs/neovim/bin/python"
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
vim.fn["textobj#user#plugin"]("selfclosingtag", {tag = {pattern = {"<", "/>"}, ["select-a"] = "aT", ["select-i"] = "iT"}})
vim.fn["denite#custom#map"]("insert", "<C-j>", "<denite:move_to_next_line>", "noremap")
vim.fn["denite#custom#map"]("insert", "Up", "<denite:move_to_next_line>", "noremap")
vim.fn["denite#custom#map"]("insert", "<C-k>", "<denite:move_to_previous_line>", "noremap")
vim.fn["denite#custom#map"]("insert", "Down", "<denite:move_to_previous_line>", "noremap")
local function _2_()
  return translate_word_under_cursor()
end
noremap("n", "<leader>tt", _2_, {silent = true, desc = "Translate words to different forms"})
local function _3_()
  return gpt.replace()
end
noremap("v", "<C-g>r", _3_, {silent = true, desc = "[G]pt [R]eplace"})
local function _4_()
  return gpt.visual_prompt()
end
noremap("v", "<C-g>p", _4_, {silent = true, desc = "[G]pt [P]rompt"})
local function _5_()
  return gpt.prompt()
end
noremap("n", "<C-g>p", _5_, {silent = true, desc = "[G]pt [P]rompt"})
local function _6_()
  return gpt.cancel()
end
noremap("n", "<C-g>c", _6_, {silent = true, desc = "[G]pt [C]ancel"})
local function _7_()
  return gpt.prompt()
end
noremap("i", "<C-g>p", _7_, {silent = true, desc = "[G]pt [P]rompt"})
noremap("n", "<leader>av", ":AV<cr>")
noremap("n", "<leader>aa", ":A<cr>")
local function _8_()
  return substitute.operator()
end
noremap("n", "p", _8_)
noremap("n", "<s-j>", "]m")
noremap("n", "<s-k>", "[m")
noremap("n", "<space>a", ":Telescope coc diagnostics<cr>", {silent = true})
noremap("n", "<space>e", ":Telescope coc extensions<cr>", {silent = true})
noremap("n", "<space>c", ":Telescope coc commands<cr>", {silent = true})
noremap("n", "<space>o", ":Telescope coc outline<cr>", {silent = true})
noremap("n", "<space>s", ":<C-u>CocList -I symbols<cr>", {silent = true})
noremap("n", "<space>j", ":<C-u>CocNext<cr>", {silent = true})
noremap("n", "<space>k", ":<C-u>CocPrev<cr>", {silent = true})
noremap("n", "<space>p", ":<C-u>CocListResume", {silent = true})
noremap("x", "<leader>ac", "<Plug>(coc-codeaction-selected)<cr>")
noremap("n", "<leader>ac", "<Plug>(coc-codeaction)")
noremap("n", "<leader>cl", "<Plug>(coc-codelens-action)")
noremap("n", "ga", "<Plug>(coc-codeaction-cursor)")
noremap("x", "if", "<Plug>(coc-funcobj-i)")
noremap("x", "af", "<Plug>(coc-funcobj-a)")
noremap("o", "if", "<Plug>(coc-funcobj-i)")
noremap("o", "af", "<Plug>(coc-funcobj-a)")
noremap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
noremap("n", "<leader>j", "<Plug>(coc-diagnostic-next)", {silent = true})
noremap("n", "<leader>k", "<Plug>(coc-diagnostic-prev)", {silent = true})
noremap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
noremap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
noremap("n", "gd", "<Plug>(coc-definition)", {silent = true})
noremap("n", "gv", ":vsp<CR><Plug>(coc-definition)", {silent = true})
noremap("n", "gr", "<Plug>(coc-references)", {silent = true})
noremap("n", "<leader>/", ":Denite grep<cr>")
noremap("n", "<space><space>", "zazt")
noremap("n", "<leader>q", ":if bufname('%') == '' <bar> :q <bar> else <bar> :wq <bar> endif<cr>")
noremap("v", "dc", ":g/console/d<cr>")
noremap("v", "dd", ":g/./d<cr>")
noremap("n", "<leader>x", ":ArgWrap<cr>")
local function _9_()
  return nvim_window.pick()
end
remap("n", "gw", _9_)
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
noremap("n", "<C-f>", "<cmd>Telescope find_files<cr>")
noremap("n", "s", "<Plug>(easymotion-s2)", {noremap = false})
noremap("n", "<leader>gb", ":Git blame <cr>")
do
  vim.cmd("augroup colorscheme\nautocmd!")
  do
    print("configuring Colorsheme")
    local function _10_()
      return nvim.ex.colorscheme("sin")
    end
    __core_symfn_1 = _10_
    vim.cmd("autocmd FileType * call v:lua.__core_symfn_1()")
  end
  vim.cmd("augroup END")
end
local function configureDeniteBuffer()
  noremap("n", "<ESC>", "denite#do_map('quit')", {silent = true, expr = true})
  noremap("n", "<CR>", "denite#do_map('do_action')", {silent = true, expr = true})
  return noremap("n", "p", "denite#do_map('do_action','preview')", {silent = true, expr = true})
end
local function hasPlugin(name)
  return (1 == vim.fn.has_key(vim.g.plugs, name))
end
local function MakeFennelPluginMappings()
  if hasPlugin("denite.nvim") then
    noremap("n", "<leader>eca", ":execute 'Denite -split=floating file/rec:~/.config/nvim/after/ftplugin'<cr>")
    noremap("n", "<leader>ep", ":execute 'Denite -split=floating file/rec:~/.config/nvim/autoload'<cr>")
    noremap("n", "<leader>es", ":execute 'Denite -split=floating file/rec:~/.config/nvim/skeletons'<cr>")
    noremap("n", "<leader>efp", ":execute 'Denite -split=floating file/rec:~/.config/nvim/nvim/fnl'<cr>")
    local function _11_()
      return configureDeniteBuffer()
    end
    __core_symfn_2 = _11_
    return vim.cmd("autocmd FileType denite call v:lua.__core_symfn_2()")
  else
    return nil
  end
end
local foldIncrement = 0
local function custom_comment_fold(lnum)
  local line = vim.fn.getline(lnum)
  if string.find(line, "foldstart") then
    foldIncrement = (foldIncrement + 1)
    return "a2"
  elseif string.find(line, "foldend") then
    foldIncrement = (foldIncrement - 1)
    return "s2"
  elseif (foldIncrement > 0) then
    return "="
  else
    return vim.treesitter.foldexpr(lnum)
  end
end
_G.custom_comment_fold = custom_comment_fold
local function StartAvante()
  print("avante starting")
  avante_lib.load()
  return avante.setup()
end
local function ReloadSin()
  vim.cmd("source %")
  return vim.cmd("colorscheme sin")
end
local function getCurrentLineNumber()
  local cursorPos = vim.api.nvim_win_get_cursor(0)
  return cursorPos[1]
end
local function onCursorMove()
  local currentLineNumber = getCurrentLineNumber()
  local myFoldLevel = nvim.fn.foldlevel(currentLineNumber)
  print(currentLineNumber)
  if (myFoldLevel() > 0) then
    return nvim.command("silent! normal! zo")
  else
    return nil
  end
end
local function onCursorMoveUp()
  local nextLineNumber = (getCurrentLineNumber() - 1)
  local myFoldLevel = nvim.fn.foldlevel(nextLineNumber)
  print(("line:" .. nextLineNumber .. " foldlevel:" .. myFoldLevel))
  nvim.command("silent! normal! gk")
  if (myFoldLevel > 0) then
    return nvim.command("silent! normal! zo")
  else
    return nil
  end
end
local function onCursorMoveDown()
  local currentLineNumber = getCurrentLineNumber()
  local nextLineNumber = (currentLineNumber + 1)
  local currentFoldLevel = nvim.fn.foldlevel(currentLineNumber)
  local nextFoldLevel = nvim.fn.foldlevel(nextLineNumber)
  print(("curr line:" .. currentLineNumber .. " foldlevel:" .. currentFoldLevel .. "| next line:" .. nextLineNumber .. " foldlevel:" .. nextFoldLevel))
  nvim.command("silent! normal! gj")
  if (nextFoldLevel > currentFoldLevel) then
    return nvim.command("normal! zo")
  else
    return nil
  end
end
local function _17_()
  return onCursorMoveUp()
end
noremap("n", "k", _17_, {noremap = false})
local function _18_()
  return onCursorMoveDown()
end
noremap("n", "j", _18_, {noremap = false})
do
  vim.cmd("augroup fennelstartup\nautocmd!")
  do
    do
      local function _19_()
        vim.g["std_in"] = 1
        return nil
      end
      __core_symfn_3 = _19_
      vim.cmd("autocmd StdinReadPre * call v:lua.__core_symfn_3()")
    end
    do
      local function _20_()
        return vim.fn["vista#RunForNearestMethodOrFunction"]()
      end
      __core_symfn_4 = _20_
      vim.cmd("autocmd VimEnter * call v:lua.__core_symfn_4()")
    end
    do
      local function _21_()
        return MakeFennelPluginMappings()
      end
      __core_symfn_5 = _21_
      vim.cmd("autocmd VimEnter * call v:lua.__core_symfn_5()")
    end
    vim.cmd("autocmd bufwritepost *.js :TestFile -strategy=vimux")
    vim.cmd("autocmd bufwritepost *.jsx :TestFile -strategy=vimux")
    vim.cmd("autocmd bufwritepost *.ts :TestFile -strategy=vimux")
    vim.cmd("autocmd bufwritepost *.tsx :TestFile -strategy=vimux")
    vim.cmd("autocmd bufwritepost *.py :TestFile -strategy=vimux")
    do
      local function _22_()
        return ReloadSin()
      end
      __core_symfn_6 = _22_
      vim.cmd("autocmd User SinToggleMode call v:lua.__core_symfn_6()")
    end
    vim.cmd("autocmd FileType TelescopeResults setlocal nofoldenable")
    do end (vim.opt)["foldmethod"] = "expr"
    print("meow")
    do end (vim.opt)["foldexpr"] = "v:lua.custom_comment_fold(v:lnum)"
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
local function get_current_buffer_syntax_tree()
  local parser = vim.treesitter.get_parser(0)
  local tree = parser:parse()[1]
  local root = tree:root()
  return root
end
local function print_syntax_tree()
  local root = get_current_buffer_syntax_tree()
  return nil
end
_G.print_syntax_tree = print_syntax_tree
local function getBufferId()
  return vim.api.nvim_buf_get_number(vim.api.nvim_get_current_buf())
end
local function treesitter_node(pos)
  local current_node = vim.treesitter.get_node({pos = pos})
  local root_node = ts_utils.get_root_for_node(current_node)
  local parent_node = current_node:parent()
  if current_node then
    local function _24_()
      if parent_node then
        return parent_node:type()
      else
        return nil
      end
    end
    return {current_node:type(), _24_()}
  else
    return {nil, nil}
  end
end
_G.treesitter_node = treesitter_node
local function is_in_list(value, list)
  local found = false
  for i, v in ipairs(list) do
    if (v == value) then
      found = true
    else
    end
  end
  return found
end
local function is_node_type(node, node_names)
  local node_type = node:type()
  return is_in_list(node_type, node_names)
end
local function is_node_in_path_of(node_names, current_node, generation_count)
  if current_node then
  else
    return false
  end
  local parent_node = current_node:parent()
  if is_node_type(current_node, node_names) then
    return true
  else
    if parent_node then
      if (generation_count == 0) then
        return false
      else
        return is_node_in_path_of(node_names, parent_node, (generation_count - 1))
      end
    else
      return false
    end
  end
end
local function is_node_under_cursor_ancestor_of(props)
  local node_names = props.node_names
  local generation_count = props.generation_count
  local node_under_cursor = vim.treesitter.get_node({pos = props.pos})
  local is_in_path
  if node_under_cursor then
    is_in_path = is_node_in_path_of(node_names, node_under_cursor, generation_count)
  else
    is_in_path = false
  end
  return is_in_path
end
_G.is_node_under_cursor_ancestor_of = is_node_under_cursor_ancestor_of
local function head(list)
  if list then
    return list[1]
  else
    return nil
  end
end
local function tail(list)
  local tbl_14_auto = {}
  local i_15_auto = #tbl_14_auto
  for i, s in ipairs(list) do
    local val_16_auto
    if (1 ~= i) then
      val_16_auto = s
    else
      val_16_auto = nil
    end
    if (nil ~= val_16_auto) then
      i_15_auto = (i_15_auto + 1)
      do end (tbl_14_auto)[i_15_auto] = val_16_auto
    else
    end
  end
  return tbl_14_auto
end
local function get_lineage(node)
  print("-==-=-=-=-=-=-=-=-=--=")
  if node then
    return print(vim.inspect(node:type()))
  else
    local _35_
    do
      local current_type = {node:type()}
      local parent = node:parent()
      if parent then
        _35_ = table.concat(current_type, get_lineage(parent))
      else
        _35_ = current_type
      end
    end
    if _35_ then
      return {}
    else
      return nil
    end
  end
end
local function check_lineage(lineage, node)
  print("-=-=-=-=-=-")
  print(vim.inspect(node))
  if node then
    if (node:type() == lineage[1]) then
      if (#tail(lineage) == 0) then
        return true
      else
        return check_lineage(tail(lineage), node:parent())
      end
    else
      return false
    end
  else
    return false
  end
end
local function has_node_lineage(props)
  local node_names = props.node_names
  local node_under_cursor = vim.treesitter.get_node({pos = props.pos})
  print("node lineage")
  print(get_lineage(node_under_cursor))
  return check_lineage(node_names, node_under_cursor)
end
_G.has_node_lineage = has_node_lineage
local function get_node_lineage(props)
  local node_under_cursor = vim.treesitter.get_node({pos = props.pos})
  return get_lineage(node_under_cursor)
end
_G.get_node_lineage = get_node_lineage
local function custom_sorter(opts)
  local function custom_sorter_impl(entry1, entry2)
    local filename1 = call(get(telescope_utils, "path_tail"), (entry1).value)
    local filename2 = call(get(telescope_utils, "path_tail"), (entry2).value)
    local dir_score1 = (string.match((entry1).ordinal, "(.+)/") or (entry1).ordinal)
    local dir_score2 = (string.match((entry2).ordinal, "(.+)/") or (entry2).ordinal)
    if opts.ignore_case then
      filename1 = string.lower(filename1)
      filename2 = string.lower(filename2)
      dir_score1 = string.lower(dir_score1)
      dir_score2 = string.lower(dir_score2)
    else
    end
    local filename_priority = (filename1 < filename2)
    if (dir_score1 == dir_score2) then
      return filename_priority
    else
      return ((entry1).ordinal < (entry2).ordinal)
    end
  end
  local function _43_(entry1, entry2)
    if (entry1 and entry2) then
      return custom_sorter_impl(entry1, entry2)
    else
      return false
    end
  end
  return _43_
end
local function select_skeleton()
  local function _45_(choice)
    return print(choice)
  end
  return vim.ui.select({"cats", "dogs", "frogs"}, {prompt = "Select Skeleton"}, _45_)
end
_G.select_skeleton = select_skeleton
local function translate_word_under_cursor()
  local word_to_translate = vim.api.nvim_call_function("expand", {"<cword>"})
  local translations = {["end"] = "begin", const = "let", var = "const", let = "var", begin = "end", px = "em", em = "rem", rem = "px", ["false"] = "true", False = "True", ["true"] = "false", True = "False", public = "private", private = "protected", protected = "public", no = "yes", yes = "no", off = "on", on = "off", start = "stop", stop = "start"}
  if translations[word_to_translate] then
    return vim.api.nvim_command(("normal! ciw" .. translations[word_to_translate]))
  else
    return print("word not in translations")
  end
end
_G.translate_word_under_cursor = translate_word_under_cursor
return nil