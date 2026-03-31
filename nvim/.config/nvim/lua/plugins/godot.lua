local M = {}

function M.setup()
  -- -- Skip godot.nvim's lspconfig-based LSP setup (deprecated in nvim 0.11+)
  -- -- and configure gdscript LSP ourselves via vim.lsp.config
  -- require('godot.lsp').setup = function() end
  --
  -- require('godot').setup {
  --   bin = 'godot',
  --   dap = {
  --     host = '127.0.0.1',
  --     port = 6006,
  --   },
  --   gui = {
  --     console_config = {
  --       anchor = 'SW',
  --       border = 'double',
  --       col = 1,
  --       height = 10,
  --       relative = 'editor',
  --       row = 99999,
  --       style = 'minimal',
  --       width = 99999,
  --     },
  --   },
  --   expose_commands = true,
  -- }
  --
  -- -- Set up gdscript LSP the modern way
  -- vim.lsp.config('gdscript', {})
  -- vim.lsp.enable 'gdscript'
end

return M
