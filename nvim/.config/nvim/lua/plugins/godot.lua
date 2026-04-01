vim.pack.add { 'https://github.com/lommix/godot.nvim' }

require('godot.lsp').setup = function() end

require('godot').setup {
  bin = 'godot',
  dap = {
    host = '127.0.0.1',
    port = 6006,
  },
  gui = {
    console_config = {
      anchor = 'SW',
      border = 'double',
      col = 1,
      height = 10,
      relative = 'editor',
      row = 99999,
      style = 'minimal',
      width = 99999,
    },
  },
  expose_commands = true,
}

vim.lsp.config('gdscript', {})
vim.lsp.enable 'gdscript'
