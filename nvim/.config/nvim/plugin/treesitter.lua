Config.now_if_args(function()
  vim.pack.add {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  }

  local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
  require('nvim-treesitter').install(parsers)
  local disable_legacy_syntax = {
    javascript = true,
    tsx = true,
    typescript = true,
  }

  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then return end

      if not vim.treesitter.language.add(language) then return end
      vim.treesitter.start(buf, language)
      if disable_legacy_syntax[language] then vim.bo[buf].syntax = 'off' end

      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- Treesitter textobjects
  vim.g.no_plugin_maps = true
  require('nvim-treesitter-textobjects').setup {
    move = { set_jumps = true },
  }

  local move = require 'nvim-treesitter-textobjects.move'
  local select = require 'nvim-treesitter-textobjects.select'
  local swap = require 'nvim-treesitter-textobjects.swap'
  local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

  -- incremental selection treesitter/lsp
  vim.keymap.set({ 'n', 'x', 'o' }, '<A-o>', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
      require('vim.treesitter._select').select_parent(vim.v.count1)
    else
      vim.lsp.buf.selection_range(vim.v.count1)
    end
  end, { desc = 'Select parent treesitter node or outer incremental lsp selections' })

  vim.keymap.set({ 'n', 'x', 'o' }, '<A-i>', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
      require('vim.treesitter._select').select_child(vim.v.count1)
    else
      vim.lsp.buf.selection_range(-vim.v.count1)
    end
  end, { desc = 'Select child treesitter node or inner incremental lsp selections' })

  vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
  vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
  vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
  vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
  vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
  vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

  vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function' })
  vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Prev function' })
  vim.keymap.set({ 'n', 'x', 'o' }, ']t', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next type definition' })
  vim.keymap.set({ 'n', 'x', 'o' }, '[t', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Prev type definition' })
  vim.keymap.set({ 'n', 'x', 'o' }, ']a', function() move.goto_next_start('@parameter.inner', 'textobjects') end, { desc = 'Next argument/parameter' })
  vim.keymap.set({ 'n', 'x', 'o' }, '[a', function() move.goto_previous_start('@parameter.inner', 'textobjects') end, { desc = 'Prev argument/parameter' })
  -- vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() move.goto_next_start('@comment.outer', 'textobjects') end, { desc = 'Next comment' })
  -- vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() move.goto_previous_start('@comment.outer', 'textobjects') end, { desc = 'Prev comment' })
  vim.keymap.set({ 'n', 'x', 'o' }, ']T', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next test' })
  vim.keymap.set({ 'n', 'x', 'o' }, '[T', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Prev test' })

  vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end, { desc = 'around function' })
  vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end, { desc = 'inside function' })
  vim.keymap.set({ 'x', 'o' }, 'at', function() select.select_textobject('@class.outer', 'textobjects') end, { desc = 'around type/class' })
  vim.keymap.set({ 'x', 'o' }, 'it', function() select.select_textobject('@class.inner', 'textobjects') end, { desc = 'inside type/class' })
  vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end, { desc = 'around argument' })
  vim.keymap.set({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', 'textobjects') end, { desc = 'inside argument' })
  vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@comment.outer', 'textobjects') end, { desc = 'around comment' })
  vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@comment.inner', 'textobjects') end, { desc = 'inside comment' })

  vim.keymap.set('n', '<leader>sa', function() swap.swap_next('@parameter.inner', 'textobjects') end, { desc = 'Swap argument with next' })
  vim.keymap.set('n', '<leader>sA', function() swap.swap_previous('@parameter.inner', 'textobjects') end, { desc = 'Swap argument with prev' })
end)
