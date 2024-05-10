lvim.transparent_window               = true
-- vim.cmd "au ColorScheme * hi Visual cterm=reverse gui=reverse"
---[[
-- lvim.colorscheme = "tokyonight-night"
-- lvim.builtin.lualine.options.theme = "tokyonight-night"
vim.g.limelight_conceal_guifg         = '#545763'
lvim.keys.visual_mode['<leader>ta']   = { "<Plug>(Limelight)" }
lvim.builtin.which_key.mappings["ta"] = { "<cmd>Limelight<cr>", "Limelight Close" }
lvim.builtin.which_key.mappings["tA"] = { "<cmd>Limelight!<cr>", "Limelight Close (All)" }
if lvim.transparent_window == true then
  vim.cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * exec 'hi FoldColumn guibg=none guifg=' . synIDattr(synIDtrans(hlID('Folded')), 'fg', 'gui')"
  vim.cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi TelescopeNormal ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi NormalFloat ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi FloatBorder ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi Float ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi NvimFloat ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi NvimTreeNormalNC ctermbg=none guibg=none"
  -- vim.cmd "au ColorScheme * hi WinSeparator cterm=bold gui=bold guifg=#000000"
  vim.cmd "au ColorScheme * hi NvimTreeWinSeparator ctermbg=none guibg=none"
  vim.cmd "au ColorScheme * hi Navbuddy ctermbg=none guibg=none"
end
vim.cmd "let &fcs='eob: '"
-- vim.cmd "au ColorScheme * hi BufferLineSeparator guifg=#504945"
-- vim.cmd "au ColorScheme * hi BufferLineSeparatorSelected guifg=#504945"
-- vim.cmd "au ColorScheme * hi BufferLineSeparatorVisible guifg=#504945"

-- vim.cmd "au ColorScheme * hi BufferLineSeparator guifg=#000000"
-- vim.cmd "au ColorScheme * hi BufferLineSeparatorSelected guifg=#000000"
-- vim.cmd "au ColorScheme * hi BufferLineSeparatorVisible guifg=#000000"
-- vim.cmd "au ColorScheme * hi BufferLineTabSeparator guifg=#000000"

vim.cmd "au ColorScheme * hi @include.python guifg=#c586c0"
vim.cmd "au ColorScheme * hi @variable guifg=#9cdcfe"
vim.cmd "au ColorScheme * hi @conditional.python guifg=#c586c0"
vim.cmd "au ColorScheme * hi @exception.python guifg=#c586c0"
vim.cmd "au ColorScheme * hi @method.call.python guifg=#daccaa"
vim.cmd "au ColorScheme * hi @function.python guifg=#daccaa"
vim.cmd "au ColorScheme * hi @function.call.python guifg=#daccaa"
vim.cmd "au ColorScheme * hi @field.python guifg=#d19a66"
vim.cmd "au ColorScheme * hi @boolean.python guifg=#3ab6f0"
vim.cmd "au ColorScheme * hi @operator guifg=#ffffff"
vim.cmd "au ColorScheme * hi @text.reference guifg=#3794ff"
vim.cmd "au ColorScheme * hi @punctuation.special.markdown guifg=#9d7cd8"
vim.cmd "au ColorScheme * hi @number.python guifg=#b5cea8"
vim.cmd "au ColorScheme * hi @float.python guifg=#b5cea8"
vim.cmd "au ColorScheme * hi @string.python guifg=#ce9178"
vim.cmd "au ColorScheme * hi @parameter.python guifg=#68b2c8"
vim.cmd "au ColorScheme * hi @field.python guifg=#4ec9b0"
vim.cmd "au ColorScheme * hi @type.python guifg=#4ec9b0"
vim.cmd "au ColorScheme * hi @constant.python guifg=#4fceff"

if lvim.transparent_window == true then
  vim.cmd "au ColorScheme * hi BufferLineBufferSelected guifg=#3ab6f0"

  vim.cmd "au ColorScheme * hi BufferLineTabSelected guifg=#3ab6f0"
  vim.cmd "au ColorScheme * hi BufferLineNumbersSelected cterm=bold,italic gui=bold,italic guifg=#3ab6f0"
  vim.cmd "au ColorScheme * hi LineNr guifg=#71839b"
  vim.cmd "au ColorScheme * hi CursorLineNr cterm=bold gui=bold guifg=#dbc074"
  vim.cmd "au ColorScheme * hi IlluminatedWord guibg=none"
  vim.cmd "au ColorScheme * hi illuminatedCurWord guibg=none"
  vim.cmd "au ColorScheme * hi IlluminatedWordWrite guibg=none"
  vim.cmd "au ColorScheme * hi IlluminatedWordRead guibg=none"
  vim.cmd "au ColorScheme * hi IlluminatedWordText guibg=none"

  vim.cmd "au ColorScheme * highlight IndentBlanklineContextChar guifg=#A184FE gui=nocombine" -- #737aa2
end

vim.cmd "au ColorScheme * hi Todo cterm=bold gui=bold guifg=#71839b guibg=none"
vim.cmd "au BufEnter *.md setlocal syntax=markdown"

-- vim.cmd "au ColorScheme * highlight! @variable guifg=#ba4351"

vim.cmd "au ColorScheme * hi Whitespace guifg=#504945"
if lvim.transparent_window == true then
  vim.cmd "au ColorScheme * hi Comment guifg=#71839b"
end
--]]

-- Reference : https://github.com/sindrets/diffview.nvim/issues/241
vim.cmd "au ColorScheme * hi DiffAdd gui=none guifg=none guibg=#2C6468"
vim.cmd "au ColorScheme * hi DiffChange gui=none guifg=none guibg=#272D43"
vim.cmd "au ColorScheme * hi DiffText gui=none guifg=none guibg=#4A5B80"
vim.cmd "au ColorScheme * hi DiffDelete gui=none guifg=none guibg=#5F3D4D"
vim.cmd "au ColorScheme * hi DiffviewDiffAddAsDelete gui=none guifg=none guibg=#5F3D4D"
vim.cmd "au ColorScheme * hi DiffviewDiffDelete gui=none guifg=#3B4252 guibg=none"

-- Left panel
-- "DiffChange:DiffAddAsDelete",
-- "DiffText:DiffDeleteText",
vim.cmd "au ColorScheme * hi DiffAddAsDelete gui=none guifg=none guibg=#5F3D4D"
vim.cmd "au ColorScheme * hi DiffDeleteText gui=none guifg=none guibg=#5A1D1D"

-- Right panel
-- "DiffChange:DiffAdd",
-- "DiffText:DiffAddText",
vim.cmd "au ColorScheme * hi DiffAddText gui=none guifg=none guibg=#2C6468"

-- lvim.builtin.bufferline
vim.g.vim_pid                                          = vim.fn.getpid()
lvim.builtin.lualine.options                           = {
  globalstatus = true,
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' }
}
local components                                       = require "lvim.core.lualine.components"
lvim.builtin.lualine.sections                          = {
  lualine_a = { { 'mode' } },
  lualine_c = {
    components.diff,
    components.python_env,
    components.diagnostics,
    { 'b:jupyter_kernel' }
  },
  lualine_x = {
    { 'vim.api.nvim_call_function("getcwd", {0})' }, { 'encoding' },
    { 'fileformat' },
    { 'filetype',                                 icon_only = false },
    components.lsp,
    {
      'pid',
      fmt = function() return "pid:" .. vim.g.vim_pid end
    }
  }
}
lvim.builtin.telescope.pickers.find_files.find_command = { "fd", "--type", "f" }

lvim.builtin.telescope.defaults.layout_strategy        = "horizontal"
lvim.builtin.telescope.defaults.layout_config          = {
  scroll_speed = 1,
  width = 0.95,
  height = 0.65,
  prompt_position = "top",
  -- preview_width   = 0.50
  horizontal = {
    scroll_speed = 1,
    width = 0.95,
    height = 0.65,
  },
  vertical = {
    scroll_speed = 1,
    width = 0.95,
    height = 0.95,
    preview_height = 0.50,
    mirror = true
  }
}
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
local status_ok, PlugNotify = pcall(require, "notify")
if not status_ok then
  return
else
  local notify = require("notify")
  local message_notifications = {}
  local buffered_messages = {
    "Client %d+ quit",
  }
  vim.notify = function(msg, level, opts)
    opts = opts or {}
    for _, pattern in ipairs(buffered_messages) do
      if string.find(msg, pattern) then
        if message_notifications[pattern] then
          opts.replace = message_notifications[pattern]
        end
        opts.on_close = function()
          message_notifications[pattern] = nil
        end
        message_notifications[pattern] = notify.notify(msg, level, opts)
        return
      end
    end
    notify.notify(msg, level, opts)
  end
end

-- Stolen from Akinsho
local autocommands = {
  {
    "TextYankPost",      -- see `:h autocmd-events`
    {                    -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*" }, -- see `:h autocmd-events`
      command = "silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}",
    }
  },
  {
    "ColorScheme",
    {
      pattern = { "*" },
      callback = function()
        vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.opt.fillchars:append { diff = "╱" }
      end
    }
  },
  {
    "BufReadPost",
    {
      pattern = { "*" },
      callback = function()
        -- NOTE: fix semshi highlighting conflict with treesitter
        if vim.bo.filetype == "python" then
          vim.bo.syntax = "on"
        end
      end
    }
  }
}
for _, autocommand in pairs(autocommands) do
  table.insert(lvim.autocommands, autocommand)
end
