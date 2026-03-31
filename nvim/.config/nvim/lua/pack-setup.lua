-- I hope i only need to add or remove plugins from the list below and not have to worry about the rest of the code, but we'll see
local plugins = {
  'https://github.com/rose-pine/neovim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/folke/flash.nvim',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/mfussenegger/nvim-lint',
  'https://github.com/NMAC427/guess-indent.nvim',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/mbbill/undotree',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.*' },
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
  'https://github.com/leoluz/nvim-dap-go',
  'https://github.com/lommix/godot.nvim',
}

----------------------------  autocommands blabla ----------------------------
-- Build steps via PackChanged
vim.api.nvim_create_autocmd('User', {
  pattern = 'PackChanged',
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    elseif name == 'LuaSnip' then
      if vim.fn.executable 'make' == 1 and vim.fn.has 'win32' == 0 then vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path }):wait() end
    elseif name == 'nvim-treesitter' then
      vim.schedule(function() vim.cmd 'TSUpdate' end)
    end
  end,
})

vim.pack.add(plugins)

-- Load all plugin configs from lua/plugins/
local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  local mod = file:match '(.+)%.lua$'
  if mod then
    local ok, err = pcall(function() require('plugins.' .. mod).setup() end)
    if not ok then vim.notify('plugins.' .. mod .. ': ' .. err, vim.log.levels.WARN) end
  end
end
