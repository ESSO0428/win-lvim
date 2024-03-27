--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
]]

-- vim options
vim.opt.guifont = "Hack:h12"
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.relativenumber = true
vim.opt.number = true
lvim.builtin.project.manual_mode = true
-- 摺疊代碼
vim.wo.foldlevel = 99
vim.wo.foldenable = true
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.g.conda_auto_activate_base = 0 -- 关闭base环境的自动激活
-- vim.g.conda_auto_env = 1 -- 开启自动激活环境
-- vim.g.conda_env = 'base' -- 设置自动激活的conda环境

-- signcolumn
vim.wo.signcolumn = "auto:2-6"

-- 取消預覽取代結果
-- vim.o.fileformats = "unix"
-- vim.opt.inccommand = ""
vim.opt.inccommand = "split"
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

vim.opt.list = false
vim.opt.listchars:append "space:·"

vim.g.PythonEnv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")

-- 用於 nvim-navbuddy
-- 更新 core plug 的 nvim-navic
-- (到該目錄下先執行) git fetch; git pull

-- lvim.keys.normal_mode['<F1>'] = ":set relativenumber!<cr>"
lvim.keys.normal_mode['s;'] = ":set relativenumber!<cr>"
lvim.keys.normal_mode["<leader>n"] = "<c-w><c-p>"
lvim.builtin.lir.active = true

-- breadcrumb
-- lvim.builtin.breadcrumbs.active = false
lvim.builtin.breadcrumbs.winbar_filetype_exclude[#lvim.builtin.breadcrumbs.winbar_filetype_exclude + 1] = "dbui"
lvim.builtin.breadcrumbs.winbar_filetype_exclude[#lvim.builtin.breadcrumbs.winbar_filetype_exclude + 1] = "undotree"

-- bufferline offset
lvim.builtin.bufferline.options.offsets[#lvim.builtin.bufferline.options.offsets + 1] = {
  filetype = "dbui",
  text = "DBUI",
  highlight = "PanelHeading",
  padding = 1
}
local dap_filetypes = { "dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches" }

for _, filetype in ipairs(dap_filetypes) do
  table.insert(lvim.builtin.bufferline.options.offsets, {
    filetype = filetype,
    text = "DAP",
    highlight = "PanelHeading",
    padding = 1
  })
end

-- 获取用户主目录
local home = os.getenv("HOME")

-- 构建源和目标路径
-- local sourcePath = home .. "/.local/share/lunarvim/lvim/snapshots/default.json"
-- local targetPath = home .. "/.config/lvim/snapshots/default.json"
-- local targetCopyDefaultSetting = home .. "/.config/lvim/snapshots/backup_default.json"
-- local targetCopyLastSetting = home .. "/.config/lvim/snapshots/backup_last.json"

-- -- 检查目标路径是否存在
-- local file = io.open(targetPath, "r")
-- if file then
--   -- 目标路径已存在，关闭文件句柄
--   os.execute("cp -f " .. sourcePath .. " " .. targetCopyLastSetting)
--   file:close()
-- else
--   -- 目标路径不存在，创建目录并创建符号链接
--   os.execute("mkdir -p " .. home .. "/.config/lvim/snapshots")
--   os.execute("ln -s " .. sourcePath .. " " .. targetPath)
--   os.execute("cp -f " .. sourcePath .. " " .. targetCopyDefaultSetting)
--   os.execute("cp -f " .. sourcePath .. " " .. targetCopyLastSetting)
-- end


-- -- 與 vscode 集成
-- --code --remote ssh-remote+LabServerDP
-- -- default hostname
-- host = "YourVscodeReomoteServerName"
-- function GetServerHostName(host)
--   vim.g.host = host
--   local ip = nil
--   local command = io.popen("hostname -I | awk '{print $1}'")
--   ip = command:read("*line")
--   command:close()

--   -- 使用 Lua 读取 ~/.ssh/host_names 文件获取主机名和对应的 IP
--   local hostnames_file = os.getenv("HOME") .. "/.ssh/host_names"
--   if vim.fn.filereadable(hostnames_file) == 1 then
--     local file = io.open(hostnames_file, "r")
--     if file then
--       for line in file:lines() do
--         local hostname, hostname_ip = line:match("(%S+)%s+(%S+)")
--         if hostname_ip and hostname_ip == ip then
--           host = hostname
--           vim.g.host = host
--           break
--         end
--       end
--       file:close()
--     end
--   end
-- end

-- GetServerHostName(host)

vim.cmd('source $HOME\\AppData\\Local\\lvim\\init.vim')
vim.cmd('source $HOME\\AppData\\Local\\lvim\\keymap.vim')



-- 排除當前使用者或 Andy6, andy6 使用者目錄下的 home 目錄，避免遞迴讀取 home 目錄底下的所有使用者目錄 (root 除外)
local username = vim.fn.system("whoami")
username = username:gsub("\n", "") -- 移除換行符號
if username == "root" then
  username = "_Andy6_"
end
lvim.builtin.nvimtree.setup.filters = {
  dotfiles = false,
  git_clean = false,
  no_buffer = false,
  -- 忽略 User 下的 home link (並建立例外清單，允許 research 底下的 home)
  -- custom = { "node_modules", "\\.cache", "^home$" },
  custom = { "node_modules", "\\.cache", "^home$" },
  exclude = {
    ".*/Andy6/.*/.*home",
    ".*/andy6/.*/.*home",
    string.format(".*/%s/.*/.*home", username),
  },
}
lvim.builtin.nvimtree.setup.actions.change_dir = {
  enable = false,
  global = true,
  restrict_above_cwd = false,
}
-- nvimtree tab sync default is false
lvim.builtin.nvimtree.setup.tab.sync.open = false
-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = {
    "*.lua",
    "*.html",
    "*.css",
    "*.js"
  },
  timeout = 1000,
}


vim.g.move_auto_indent                              = 0
vim.g.move_normal_option                            = 1
vim.g.move_key_modifier                             = 'C'
-- vim.g.move_key_modifier_visualmode = 'S'

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader                                         = "space"
lvim.keys.normal_mode["S"]                          = ":w<cr>"

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active                           = true
lvim.builtin.alpha.mode                             = "dashboard"
lvim.builtin.terminal.active                        = true
lvim.builtin.nvimtree.setup.view.side               = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- git default false
lvim.builtin.gitsigns.opts.current_line_blame       = false
