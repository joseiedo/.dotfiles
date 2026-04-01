local M = {}

function M.setup(extras)
  local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
  local plugins = extras or {}
  local modules = {}

  -- Collect sources and modules from lua/plugins/
  for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
    local mod = file:match '(.+)%.lua$'
    if mod then
      local ok, plugin = pcall(require, 'plugins.' .. mod)
      if ok then
        modules[#modules + 1] = { name = mod, mod = plugin }
        if plugin.source then
          if type(plugin.source) == 'string' or plugin.source.src then
            plugins[#plugins + 1] = plugin.source
          else
            vim.list_extend(plugins, plugin.source)
          end
        end
      else
        vim.notify('plugins.' .. mod .. ': ' .. plugin, vim.log.levels.WARN)
      end
    end
  end

  vim.pack.add(plugins)

  -- Build steps via PackChanged
  vim.api.nvim_create_autocmd('User', {
    pattern = 'PackChanged',
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= 'install' and kind ~= 'update' then return end

      if name == 'telescope-fzf-native.nvim' then
        vim.system({ 'make' }, { cwd = ev.data.path }):wait()
      elseif name == 'LuaSnip' then
        if vim.fn.executable 'make' == 1 and vim.fn.has 'win32' == 0 then vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path }):wait() end
      elseif name == 'nvim-treesitter' then
        vim.schedule(function() vim.cmd 'TSUpdate' end)
      end
    end,
  })

  -- Run setup for each plugin module
  for _, entry in ipairs(modules) do
    if entry.mod.setup then
      local ok, err = pcall(entry.mod.setup)
      if not ok then vim.notify('plugins.' .. entry.name .. ': ' .. err, vim.log.levels.WARN) end
    end
  end
end

return M
