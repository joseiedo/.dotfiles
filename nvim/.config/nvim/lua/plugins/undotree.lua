local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle [U]ndotree' })
end

return M
