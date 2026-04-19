Config.later(function()
  vim.pack.add {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/stevearc/dressing.nvim',
    'https://github.com/nvim-flutter/flutter-tools.nvim',
  }

  require('flutter-tools').setup {}
end)
