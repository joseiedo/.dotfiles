vim.o.termguicolors = true

local ok, hues = pcall(require, 'mini.hues')
if not ok then
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
  hues = require 'mini.hues'
end

hues.setup {
  background = '#2b2b2b',
  foreground = '#e2e2e2',
  saturation = 'high',
  accent = 'cyan',
  plugins = { default = true },
}

vim.g.colors_name = 'opalineish'

local p = hues.get_palette()
local C = {
  bg = p.bg,
  bg_float = p.bg_edge,
  selection = p.bg_mid2,
  fg = p.fg,
  muted = p.fg_mid,
  dim = p.fg_mid2,
  keyword = '#b7b7b7',
  literal = '#eb96f8',
  callable = '#68d99d',
  attention = '#ff7588',
  warn = '#ffd166',
  info = '#7cc7ff',
}

local function hi(group, hl) vim.api.nvim_set_hl(0, group, hl) end

local function set(groups, hl)
  for _, group in ipairs(groups) do
    hi(group, hl)
  end
end

local overrides = {
  plain = {
    'Operator',
    'Delimiter',
    '@attribute',
    '@constructor',
    '@field',
    '@none',
    '@operator',
    '@parameter',
    '@property',
    '@punctuation',
    '@punctuation.bracket',
    '@punctuation.delimiter',
    '@punctuation.special',
    '@tag.attribute',
    '@tag.delimiter',
    '@text',
    '@variable',
    '@variable.builtin',
    '@variable.member',
    '@variable.parameter',
    '@lsp.mod.declaration',
    '@lsp.type.member',
    '@lsp.type.parameter',
    '@lsp.type.property',
    '@lsp.type.variable',
    '@lsp.typemod.member.declaration',
    '@lsp.typemod.parameter.declaration',
    '@lsp.typemod.property.declaration',
    '@lsp.typemod.variable.declaration',
    '@lsp.typemod.variable.definition',
  },
  comment = {
    'Comment',
    'SpecialComment',
    'Debug',
    'Error',
    'ErrorMsg',
    '@comment',
    '@comment.documentation',
    '@comment.error',
    '@comment.note',
    '@comment.warning',
    '@lsp.type.comment',
  },
  keyword = {
    'Keyword',
    'Conditional',
    'Define',
    'Exception',
    'Include',
    'Macro',
    'PreCondit',
    'PreProc',
    'Repeat',
    'Statement',
    'StorageClass',
    '@conditional',
    '@exception',
    '@include',
    '@keyword',
    '@keyword.conditional',
    '@keyword.coroutine',
    '@keyword.directive',
    '@keyword.directive.define',
    '@keyword.exception',
    '@keyword.function',
    '@keyword.import',
    '@keyword.operator',
    '@keyword.repeat',
    '@keyword.return',
    '@repeat',
    '@lsp.type.keyword',
    '@lsp.type.modifier',
    '@lsp.type.operator',
  },
  literal = {
    'Boolean',
    'Character',
    'Constant',
    'Float',
    'Number',
    'String',
    '@boolean',
    '@character',
    '@character.special',
    '@constant',
    '@constant.builtin',
    '@constant.macro',
    '@number',
    '@number.float',
    '@string',
    '@string.escape',
    '@string.regexp',
    '@string.regex',
    '@string.special',
    '@string.special.symbol',
    '@text.literal',
    '@lsp.type.enumMember',
    '@lsp.type.number',
    '@lsp.type.string',
  },
  callable = {
    'Directory',
    'Function',
    'Label',
    'Structure',
    'Title',
    'Type',
    'Typedef',
    '@function',
    '@function.builtin',
    '@function.call',
    '@function.macro',
    '@function.method',
    '@function.method.call',
    '@label',
    '@method',
    '@method.call',
    '@module',
    '@namespace',
    '@tag',
    '@type',
    '@type.builtin',
    '@type.definition',
    '@lsp.type.class',
    '@lsp.type.decorator',
    '@lsp.type.enum',
    '@lsp.type.function',
    '@lsp.type.interface',
    '@lsp.type.macro',
    '@lsp.type.method',
    '@lsp.type.namespace',
    '@lsp.type.struct',
    '@lsp.type.type',
    '@lsp.type.typeParameter',
    '@lsp.typemod.class.declaration',
    '@lsp.typemod.class.definition',
    '@lsp.typemod.enum.declaration',
    '@lsp.typemod.function.declaration',
    '@lsp.typemod.function.defaultLibrary',
    '@lsp.typemod.function.definition',
    '@lsp.typemod.macro.declaration',
    '@lsp.typemod.member.defaultLibrary',
    '@lsp.typemod.method.declaration',
    '@lsp.typemod.method.defaultLibrary',
    '@lsp.typemod.struct.declaration',
    '@lsp.typemod.type.declaration',
  },
}

set(overrides.plain, { fg = C.fg })
set(overrides.comment, { fg = C.attention })
set(overrides.keyword, { fg = C.keyword })
set(overrides.literal, { fg = C.literal })
set(overrides.callable, { fg = C.callable })

hi('Normal', { fg = C.fg, bg = C.bg })
hi('NormalNC', { fg = C.fg, bg = C.bg })
hi('NormalFloat', { fg = C.fg, bg = C.bg_float })
hi('FloatBorder', { fg = C.keyword, bg = C.bg_float })
hi('FloatTitle', { fg = C.keyword, bg = C.bg_float })
hi('CursorLine', { bg = C.selection })
hi('StatusLine', { fg = C.muted, bg = p.bg_mid })
hi('StatusLineNC', { fg = C.dim, bg = C.bg_float })
hi('Visual', { bg = C.selection })
hi('VisualNOS', { bg = C.selection })
hi('LspReferenceText', { bg = C.selection })
hi('LspReferenceRead', { bg = C.selection })
hi('LspInlayHint', { fg = C.dim, bg = p.bg_mid })

hi('BlinkCmpMenu', { fg = C.fg, bg = C.bg_float })
hi('BlinkCmpMenuBorder', { fg = C.keyword, bg = C.bg_float })
hi('BlinkCmpMenuSelection', { fg = C.fg, bg = C.selection })
hi('BlinkCmpLabelMatch', { fg = C.callable, bold = true })
hi('BlinkCmpSource', { fg = C.dim })
hi('BlinkCmpGhostText', { fg = C.dim, italic = true })
hi('BlinkCmpDoc', { fg = C.fg, bg = C.bg_float })
hi('BlinkCmpDocBorder', { fg = C.keyword, bg = C.bg_float })
hi('BlinkCmpSignatureHelp', { fg = C.fg, bg = C.bg_float })
hi('BlinkCmpSignatureHelpBorder', { fg = C.keyword, bg = C.bg_float })
hi('BlinkCmpSignatureHelpActiveParameter', { fg = C.callable, bold = true })
set({
  'BlinkCmpKindClass',
  'BlinkCmpKindConstructor',
  'BlinkCmpKindEnum',
  'BlinkCmpKindFolder',
  'BlinkCmpKindFunction',
  'BlinkCmpKindInterface',
  'BlinkCmpKindMethod',
  'BlinkCmpKindModule',
  'BlinkCmpKindStruct',
  'BlinkCmpKindTypeParameter',
}, { fg = C.callable })
set({ 'BlinkCmpKindColor', 'BlinkCmpKindConstant', 'BlinkCmpKindEnumMember', 'BlinkCmpKindSnippet', 'BlinkCmpKindUnit', 'BlinkCmpKindValue' }, { fg = C.literal })
set({ 'BlinkCmpKindField', 'BlinkCmpKindFile', 'BlinkCmpKindOperator', 'BlinkCmpKindProperty', 'BlinkCmpKindText', 'BlinkCmpKindVariable' }, { fg = C.fg })
set({ 'BlinkCmpKindKeyword' }, { fg = C.keyword })
set({ 'BlinkCmpKindReference' }, { fg = C.info })
set({ 'BlinkCmpKindEvent' }, { fg = C.warn })

hi('FlashBackdrop', { fg = C.dim })
hi('FlashMatch', { fg = C.bg, bg = C.callable, bold = true })
hi('FlashCurrent', { fg = C.bg, bg = C.warn, bold = true })
hi('FlashLabel', { fg = C.bg, bg = C.attention, bold = true })

hi('OilDir', { fg = C.callable })
hi('OilDirIcon', { fg = C.callable })
hi('OilFile', { fg = C.fg })
hi('OilHidden', { fg = C.dim })
hi('OilLink', { fg = C.info })
hi('OilOrphanLink', { fg = C.attention })
hi('OilSocket', { fg = C.literal })
hi('OilCreate', { fg = C.callable })
hi('OilDelete', { fg = C.attention })
hi('OilMove', { fg = C.warn })
hi('OilChange', { fg = C.warn })
hi('OilCopy', { fg = C.info })
hi('OilRestore', { fg = C.callable })
hi('OilTrash', { fg = C.attention })
hi('OilPurge', { fg = C.attention, bold = true })
hi('OilPermissionRead', { fg = C.warn })
hi('OilPermissionWrite', { fg = C.attention })
hi('OilPermissionExecute', { fg = C.callable })

hi('MiniFilesNormal', { fg = C.fg, bg = C.bg_float })
hi('MiniFilesBorder', { fg = C.keyword, bg = C.bg_float })
hi('MiniFilesBorderModified', { fg = C.warn, bg = C.bg_float })
hi('MiniFilesCursorLine', { bg = C.selection })
hi('MiniFilesDirectory', { fg = C.callable, bg = C.bg_float })
hi('MiniFilesFile', { fg = C.fg, bg = C.bg_float })
hi('MiniFilesTitle', { fg = C.keyword, bg = C.bg_float })
hi('MiniFilesTitleFocused', { fg = C.callable, bg = C.bg_float, bold = true })

hi('MiniStatuslineModeNormal', { fg = C.bg, bg = C.callable, bold = true })
hi('MiniStatuslineModeInsert', { fg = C.bg, bg = C.info, bold = true })
hi('MiniStatuslineModeVisual', { fg = C.bg, bg = C.literal, bold = true })
hi('MiniStatuslineModeReplace', { fg = C.bg, bg = C.attention, bold = true })
hi('MiniStatuslineModeCommand', { fg = C.bg, bg = C.warn, bold = true })
hi('MiniStatuslineModeOther', { fg = C.bg, bg = C.keyword, bold = true })
hi('MiniStatuslineDevinfo', { fg = C.muted, bg = p.bg_mid })
hi('MiniStatuslineFilename', { fg = C.fg, bg = p.bg_mid })
hi('MiniStatuslineFileinfo', { fg = C.muted, bg = p.bg_mid })
hi('MiniStatuslineInactive', { fg = C.dim, bg = C.bg_float })

hi('FidgetTitle', { fg = C.callable, bg = C.bg_float, bold = true })
hi('FidgetTask', { fg = C.muted, bg = C.bg_float })
hi('CopilotSuggestion', { fg = C.dim, italic = true })
hi('CopilotAnnotation', { fg = C.dim })
hi('healthSuccess', { fg = C.callable })
hi('healthWarning', { fg = C.warn })
hi('healthError', { fg = C.attention })

for name, color in pairs {
  Azure = C.info,
  Blue = C.info,
  Cyan = C.callable,
  Green = C.callable,
  Grey = C.muted,
  Orange = C.warn,
  Purple = C.literal,
  Red = C.attention,
  Yellow = C.warn,
} do
  hi('MiniIcons' .. name, { fg = color, bg = C.bg_float })
  hi('WhichKeyIcon' .. name, { fg = color, bg = C.bg_float })
end
