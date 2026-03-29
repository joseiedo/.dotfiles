local check_version = function()
  local verstr = tostring(vim.version())
  if not vim.version.ge then
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
    return
  end

  if vim.version.ge(vim.version(), '0.11') then
    vim.health.ok(string.format("Neovim version is: '%s'", verstr))
  else
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
  end
end

local check_executables = function()
  vim.health.start 'Required tools'
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg', 'fd' } do
    if vim.fn.executable(exe) == 1 then
      vim.health.ok(string.format("Found: '%s'", exe))
    else
      vim.health.error(string.format("Missing: '%s'", exe))
    end
  end
end

local check_mason_tools = function()
  vim.health.start 'Mason tools'
  local ok, registry = pcall(require, 'mason-registry')
  if not ok then
    vim.health.warn 'mason-registry not available'
    return
  end

  for _, pkg in ipairs(registry.get_installed_packages()) do
    vim.health.ok(pkg.name)
  end

  local ok2, installer = pcall(require, 'mason-tool-installer')
  if ok2 and installer.settings and installer.settings.ensure_installed then
    for _, tool in ipairs(installer.settings.ensure_installed) do
      local name = type(tool) == 'table' and tool[1] or tool
      if not registry.is_installed(name) then vim.health.warn(string.format("Expected but not installed: '%s'", name)) end
    end
  end
end

local check_plugins = function()
  vim.health.start 'Plugins'
  local ok, lazy = pcall(require, 'lazy')
  if not ok then
    vim.health.error 'lazy.nvim not found'
    return
  end

  for _, plugin in ipairs(lazy.plugins()) do
    if plugin._.installed then
      vim.health.ok(plugin.name)
    else
      vim.health.error(string.format('%s (not installed)', plugin.name))
    end
  end
end

return {
  check = function()
    vim.health.start 'nvim'
    local uv = vim.uv or vim.loop
    vim.health.info('System Information: ' .. vim.inspect(uv.os_uname()))

    check_version()
    check_executables()
    check_mason_tools()
    check_plugins()
  end,
}
