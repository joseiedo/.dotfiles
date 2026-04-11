Config.now(function()
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

  require('mini.surround').setup {
    mappings = {
      add = 'gsa',
      delete = 'gsd',
      find = 'gsf',
      find_left = 'gsF',
      highlight = 'gsh',
      replace = 'gsr',
      update_n_lines = 'gsn',
    },
  }

  require('mini.pairs').setup {}
  require('mini.files').setup {}

  local jump2d = require 'mini.jump2d'
  jump2d.setup {
    mappings = {
      start_jumping = '',
    },
  }
  vim.keymap.set({ 'n', 'x', 'o' }, 's', function() jump2d.start(jump2d.builtin_opts.query) end, { desc = 'Jump to query' })

  local clue = require 'mini.clue'
  clue.setup {
    triggers = {
      { mode = { 'n', 'x' }, keys = '<leader>' },
      { mode = 'n', keys = 'gr' },
    },
    clues = {
      { mode = { 'n', 'x' }, keys = '<leader>s', desc = '+[S]earch' },
      { mode = 'n', keys = '<leader>t', desc = '+[T]oggle' },
      { mode = 'n', keys = '<leader>g', desc = '+[G]it' },
      { mode = { 'n', 'x' }, keys = '<leader>h', desc = '+Git [H]unk' },
      { mode = 'n', keys = 'gr', desc = '+LSP Actions' },
    },
    window = {
      delay = 0,
    },
  }

  local statusline = require 'mini.statusline'
  statusline.setup { use_icons = vim.g.have_nerd_font }

  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function() return '%2l:%-2v' end
end)
