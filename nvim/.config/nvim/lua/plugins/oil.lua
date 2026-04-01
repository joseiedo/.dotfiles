local M = {}

M.source = 'https://github.com/stevearc/oil.nvim'

function M.setup()
  require('oil').setup {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  }

  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
end

return M
