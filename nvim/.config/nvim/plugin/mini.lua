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
  statusline.setup {
    use_icons = vim.g.have_nerd_font,
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
        local git = MiniStatusline.section_git { trunc_width = 40 }
        local diff = MiniStatusline.section_diff { trunc_width = 75 }
        local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
        local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
        local filename = MiniStatusline.section_filename { trunc_width = 140 }
        local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
        local location = MiniStatusline.section_location { trunc_width = 75 }
        local search = MiniStatusline.section_searchcount { trunc_width = 75 }

        return MiniStatusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
          '%<',
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=',
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, search, location } },
        }
      end,
    },
  }

  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function() return '%2l:%-2v' end
end)
