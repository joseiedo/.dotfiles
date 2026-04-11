Config.now_if_args(function()
  local pick = require 'mini.pick'
  local extra = require 'mini.extra'

  pick.setup {
    source = {
      show = pick.default_show,
    },
  }
  extra.setup {}

  local grep_word = function() pick.builtin.grep { pattern = vim.fn.expand '<cword>' } end
  local pick_registry = function()
    local items = vim.tbl_keys(pick.registry)
    table.sort(items)

    local chosen = pick.start { source = { items = items, name = 'Pickers', choose = function() end } }
    if chosen then pick.registry[chosen]() end
  end

  local find_config = function() pick.builtin.files(nil, { source = { cwd = vim.fn.stdpath 'config' } }) end
  local grep_open_files = function()
    local paths = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local path = vim.api.nvim_buf_get_name(buf)
      if path ~= '' and vim.api.nvim_buf_is_loaded(buf) then
        paths[vim.fs.normalize(path)] = true
      end
    end

    local globs = vim.tbl_keys(paths)
    if #globs == 0 then return end
    pick.builtin.grep_live({ globs = globs }, { source = { name = 'Grep open files' } })
  end

  vim.keymap.set('n', '<leader>sh', pick.builtin.help, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', extra.pickers.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>sf', pick.builtin.files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>ss', pick_registry, { desc = '[S]earch [S]elect picker' })
  vim.keymap.set({ 'n', 'v' }, '<leader>sw', grep_word, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', extra.pickers.diagnostic, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', pick.builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', extra.pickers.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sc', extra.pickers.commands, { desc = '[S]earch [C]ommands' })
  vim.keymap.set('n', '<leader>so', function() extra.pickers.lsp { scope = 'document_symbol' } end, { desc = '[S]earch Document Symb[o]ls' })
  vim.keymap.set('n', '<leader>sW', function() extra.pickers.lsp { scope = 'workspace_symbol_live' } end, { desc = '[S]earch [W]orkspace Symbols' })
  vim.keymap.set('n', '<leader>gf', extra.pickers.git_files, { desc = '[G]it [F]iles' })
  vim.keymap.set('n', '<leader>gb', extra.pickers.git_branches, { desc = '[G]it [B]ranches' })
  vim.keymap.set('n', '<leader>gc', extra.pickers.git_commits, { desc = '[G]it [C]ommits' })
  vim.keymap.set('n', '<leader>gs', function() extra.pickers.git_files { scope = 'modified' } end, { desc = '[G]it [S]tatus' })
  vim.keymap.set('n', '<leader><leader>', pick.builtin.buffers, { desc = '[ ] Find existing buffers' })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('mini-pick-lsp-attach', { clear = true }),
    callback = function(event)
      local buf = event.buf

      vim.keymap.set('n', 'grr', function() extra.pickers.lsp { scope = 'references' } end, { buffer = buf, desc = '[G]oto [R]eferences' })
      vim.keymap.set('n', 'gri', function() extra.pickers.lsp { scope = 'implementation' } end, { buffer = buf, desc = '[G]oto [I]mplementation' })
      vim.keymap.set('n', 'grd', function() extra.pickers.lsp { scope = 'definition' } end, { buffer = buf, desc = '[G]oto [D]efinition' })
      vim.keymap.set('n', 'gO', function() extra.pickers.lsp { scope = 'document_symbol' } end, { buffer = buf, desc = 'Open Document Symbols' })
      vim.keymap.set('n', 'gW', function() extra.pickers.lsp { scope = 'workspace_symbol_live' } end, { buffer = buf, desc = 'Open Workspace Symbols' })
      vim.keymap.set('n', 'grt', function() extra.pickers.lsp { scope = 'type_definition' } end, { buffer = buf, desc = '[G]oto [T]ype Definition' })
    end,
  })

  vim.keymap.set('n', '<leader>/', function() extra.pickers.buf_lines { scope = 'current' } end, { desc = '[/] Fuzzily search in current buffer' })
  vim.keymap.set('n', '<leader>s/', grep_open_files, { desc = '[S]earch [/] in Open Files' })
  vim.keymap.set('n', '<leader>sn', find_config, { desc = '[S]earch [N]eovim files' })
end)
