-- 使用 cfile 就可以用讀取檔案路徑的功能了
-- set isfname +=32
vim.opt.isfname:append { 32 }

function XOpenFileOrFold()
  local line = vim.fn.expand('<cfile>')
  local path = line:gsub("^%s*(.-)%s*$", "%1")

  -- 展开路径中的 '~' 符号
  if path:sub(1, 1) == '~' then
    path = vim.fn.expand('~') .. path:sub(2)
  end

  -- 如果路径是一个 HTTP 链接，则使用系统默认浏览器打开
  if path:sub(1, 4) == 'http' then
    local command = string.format("silent !xdg-open '%s'", path)
    vim.api.nvim_command(command)
  else
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
    local explorer_exists = vim.fn.executable("explorer.exe") == 1
    local command = string.format("silent !explorer.exe `wslpath -w '%s'`", path)

    if explorer_exists then
      if is_windows then
        -- 在 Windows 环境下，直接使用 explorer.exe 打开，注意路径转换
        local windows_path = path:gsub("/", "\\") -- 转换路径分隔符
        local command = string.format("silent !explorer.exe '%s'", windows_path)
        vim.api.nvim_command(command)
      else
        -- 在 WSL 环境下使用 explorer.exe，通过 wslpath 转换路径
        local command = string.format("silent !explorer.exe `wslpath -w '%s'`", path)
        vim.api.nvim_command(command)
      end
    else
      -- 在非 Windows 环境下，使用 xdg-open
      local command = string.format("silent !xdg-open '%s'", path)
      vim.api.nvim_command(command)
    end
  end
end

vim.api.nvim_create_augroup("text_file_custom", {})
vim.api.nvim_create_autocmd({
  "BufWinEnter"
}, {
  -- pattern = { "*.txt", "*.log" },
  group = "text_file_custom",
  callback = function()
    vim.keymap.set('n', 'go', '<cmd>lua XOpenFileOrFold()<cr>', { silent = true, buffer = true })
  end
})
