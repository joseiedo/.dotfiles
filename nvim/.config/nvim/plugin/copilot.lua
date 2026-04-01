Config.later(function()
  vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

  require('copilot').setup {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = '<Tab>',
      },
    },
  }
end)
