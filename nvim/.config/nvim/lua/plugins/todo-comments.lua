local M = {}

M.source = 'https://github.com/folke/todo-comments.nvim'

function M.setup()
  require('todo-comments').setup { signs = false }
end

return M
