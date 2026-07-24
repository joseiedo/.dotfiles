Config.later(function()
  vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

  require('oil').setup {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  }

  vim.keymap.set('n', '<leader>e', function() require('oil').open(vim.fn.getcwd()) end, { desc = '[E]xplorer at workspace root' })
  vim.keymap.set('n', '-', function() require('oil').open(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h')) end, { desc = 'Open parent directory' })
end)
