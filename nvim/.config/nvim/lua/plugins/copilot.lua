local M = {}

M.source = 'https://github.com/zbirenbaum/copilot.lua'

function M.setup()
  require('copilot').setup {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = '<Tab>',
      },
    },
  }
end

return M
