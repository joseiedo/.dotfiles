local M = {}

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
