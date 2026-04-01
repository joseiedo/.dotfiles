vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

require 'options'
require 'keymaps'

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/mason-org/mason.nvim',
}
require('mason').setup {}

-- Load each plugin file
local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  local mod = file:match '(.+)%.lua$'
  if mod then
    local ok, err = pcall(require, 'plugins.' .. mod)
    if not ok then vim.notify('plugins.' .. mod .. ': ' .. err, vim.log.levels.WARN) end
  end
end
