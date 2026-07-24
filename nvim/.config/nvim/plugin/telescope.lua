Config.later(function()
  vim.pack.add {
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  }

  local fzf_dir = vim.fn.stdpath 'data' .. '/site/pack/core/opt/telescope-fzf-native.nvim'
  if vim.fn.filereadable(fzf_dir .. '/build/libfzf.so') == 0 then
    vim.fn.system { 'make', '-C', fzf_dir, '--silent' }
  end

  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  local builtin = require 'telescope.builtin'

  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
      file_ignore_patterns = { '.git/', 'node_modules/', '__pycache__/' },
    },
    pickers = {
      find_files = { hidden = true },
      live_grep = { additional_args = { '--hidden' } },
      buffers = { sort_mru = true, sort_lastused = true },
    },
  }

  telescope.load_extension 'fzf'

  local function find_files_cwd()
    builtin.find_files { cwd = vim.fn.expand '%:p:h' }
  end
  local function grep_cwd()
    builtin.live_grep { cwd = vim.fn.expand '%:p:h' }
  end
  local function grep_open_files()
    builtin.live_grep { grep_open_files = true }
  end
  local function find_config()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
  end

  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sF', find_files_cwd, { desc = '[S]earch [F]iles (current dir)' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sG', grep_cwd, { desc = '[S]earch by [G]rep (current dir)' })
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = '[S]earch [M]an pages' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>so', builtin.lsp_document_symbols, { desc = '[S]earch Document Symb[o]ls' })
  vim.keymap.set('n', '<leader>sW', builtin.lsp_workspace_symbols, { desc = '[S]earch [W]orkspace Symbols' })
  vim.keymap.set('n', '<leader>sn', find_config, { desc = '[S]earch [N]eovim files' })
  vim.keymap.set('n', '<leader>s/', grep_open_files, { desc = '[S]earch [/] in Open Files' })
  vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Search in current buffer' })
  vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

  vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
  vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })
  vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
  vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
    callback = function(event)
      local buf = event.buf
      vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
      vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
      vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
      vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
      vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })
      vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })
    end,
  })
end)
