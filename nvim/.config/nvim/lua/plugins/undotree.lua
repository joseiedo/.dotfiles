local M = {}

function M.setup()
  vim.cmd 'packadd nvim.undotree'
  vim.keymap.set('n', '<leader>u', require('undotree').open, { desc = 'Open [U]ndotree' })
end

return M
