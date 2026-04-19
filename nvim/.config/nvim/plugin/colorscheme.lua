vim.o.termguicolors = true

vim.cmd.colorscheme 'default'

-- Comments should be more visible. Copilot suggestions should be more subtle.
vim.api.nvim_set_hl(0, 'Comment', { fg = '#c4a96b' })
vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = '#6e6e6e', italic = true })
