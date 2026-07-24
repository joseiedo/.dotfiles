vim.o.termguicolors = true

Config.now(function()
  vim.pack.add { 'https://github.com/sainnhe/gruvbox-material' }
  -- require('gruvbox-material').setup {}

  vim.g.gruvbox_material_enable_italic = true
  vim.g.gruvbox_material_background = 'hard'
  vim.cmd.colorscheme 'gruvbox-material'
end)
--
-- vim.cmd.colorscheme 'default'

-- Comments should be more visible. Copilot suggestions should be more subtle.
vim.api.nvim_set_hl(0, 'Comment', { fg = '#f05330' })
vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = '#6e6e6e', italic = true })
