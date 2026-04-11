vim.cmd 'highlight clear'
vim.o.termguicolors = true
vim.g.colors_name = 'opalineish'

local C = {
  bg = '#2b2b2b',
  bg_alt = '#333333',
  bg_float = '#303030',
  selection = '#3a3a3a',
  fg = '#e2e2e2',
  muted = '#b7b7b7',
  dim = '#7f7f7f',
  keyword = '#b7b7b7',
  literal = '#eb96f8',
  callable = '#68d99d',
  attention = '#ff7588',
  warn = '#ffd166',
  info = '#7cc7ff',

  line_nr = '#b7b7b7',
  cursor_nr = '#eaeaea',
}

local theme = {
  -- UI
  Normal = { fg = C.fg, bg = C.bg },
  NormalNC = { fg = C.fg, bg = C.bg },
  NormalFloat = { fg = C.fg, bg = C.bg_float },
  FloatBorder = { fg = C.keyword, bg = C.bg_float },
  FloatTitle = { fg = C.callable, bg = C.bg_float, bold = true },
  WinSeparator = { fg = C.bg_alt, bg = C.bg },
  LineNr = { fg = C.line_nr, bg = C.bg },
  CursorLine = { bg = C.bg_alt },
  CursorColumn = { bg = C.bg_alt },
  CursorLineNr = { fg = C.cursor_nr, bg = C.bg_alt, bold = true },
  ColorColumn = { bg = C.bg_alt },
  SignColumn = { bg = C.bg },
  FoldColumn = { fg = C.dim, bg = C.bg },
  Folded = { fg = C.muted, bg = C.bg_alt },
  EndOfBuffer = { fg = C.bg_alt },
  NonText = { fg = C.dim },
  SpecialKey = { fg = C.dim },
  Conceal = { fg = C.dim },
  Directory = { fg = C.callable },
  Title = { fg = C.callable, bold = true },
  Visual = { bg = C.selection },
  VisualNOS = { bg = C.selection },
  Search = { fg = C.bg, bg = C.warn },
  IncSearch = { fg = C.bg, bg = C.callable },
  CurSearch = { fg = C.bg, bg = C.callable },
  Substitute = { fg = C.bg, bg = C.attention },
  MatchParen = { fg = C.warn, bg = C.selection, bold = true },
  Pmenu = { fg = C.fg, bg = C.bg_float },
  PmenuSel = { fg = C.fg, bg = C.selection },
  PmenuSbar = { bg = C.bg_alt },
  PmenuThumb = { bg = C.muted },
  WildMenu = { fg = C.fg, bg = C.selection },
  StatusLine = { fg = C.fg, bg = C.bg_alt },
  StatusLineNC = { fg = C.dim, bg = C.bg_alt },
  TabLine = { fg = C.muted, bg = C.bg_alt },
  TabLineFill = { bg = C.bg_alt },
  TabLineSel = { fg = C.fg, bg = C.bg },
  WinBar = { fg = C.fg, bg = C.bg, bold = true },
  WinBarNC = { fg = C.dim, bg = C.bg },
  Question = { fg = C.callable },
  MoreMsg = { fg = C.callable },
  ModeMsg = { fg = C.fg },
  MsgArea = { fg = C.fg, bg = C.bg },
  QuickFixLine = { bg = C.selection },

  -- Diff
  DiffAdd = { fg = C.callable, bg = '#26392e' },
  DiffChange = { fg = C.warn, bg = '#3a3328' },
  DiffDelete = { fg = C.attention, bg = '#3a272b' },
  DiffText = { fg = C.bg, bg = C.warn },
  Added = { fg = C.callable },
  Changed = { fg = C.warn },
  Removed = { fg = C.attention },
  diffAdded = { link = 'DiffAdd' },
  diffChanged = { link = 'DiffChange' },
  diffRemoved = { link = 'DiffDelete' },

  -- Diagnostics / LSP
  DiagnosticError = { fg = C.attention },
  DiagnosticWarn = { fg = C.warn },
  DiagnosticInfo = { fg = C.info },
  DiagnosticHint = { fg = C.callable },
  DiagnosticOk = { fg = C.callable },
  DiagnosticVirtualTextError = { fg = C.attention, bg = '#3a272b' },
  DiagnosticVirtualTextWarn = { fg = C.warn, bg = '#3a3328' },
  DiagnosticVirtualTextInfo = { fg = C.info, bg = '#26333a' },
  DiagnosticVirtualTextHint = { fg = C.callable, bg = '#26392e' },
  DiagnosticUnderlineError = { undercurl = true, sp = C.attention },
  DiagnosticUnderlineWarn = { undercurl = true, sp = C.warn },
  DiagnosticUnderlineInfo = { undercurl = true, sp = C.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = C.callable },
  LspReferenceText = { bg = C.selection },
  LspReferenceRead = { bg = C.selection },
  LspReferenceWrite = { bg = C.selection, underline = true, sp = C.warn },
  LspCodeLens = { fg = C.dim },
  LspCodeLensSeparator = { fg = C.dim },
  LspInlayHint = { fg = C.dim, bg = C.bg_alt },

  -- Syntax
  Comment = { fg = C.attention },
  SpecialComment = { fg = C.attention, bg = C.bg_alt },
  Todo = { fg = C.attention, bold = true },
  Debug = { fg = C.attention, bold = true },
  Error = { fg = C.attention, bold = true },
  ErrorMsg = { fg = C.attention, bold = true },
  WarningMsg = { fg = C.warn },
  Identifier = { fg = C.fg },
  Operator = { fg = C.fg },
  Delimiter = { fg = C.fg },
  Special = { fg = C.warn },
  Underlined = { underline = true },
  Italic = { italic = true },

  -- blink.cmp / completion menu
  BlinkCmpMenu = { fg = C.fg, bg = C.bg_float },
  BlinkCmpMenuBorder = { fg = C.keyword, bg = C.bg_float },
  BlinkCmpMenuSelection = { fg = C.fg, bg = C.selection },
  BlinkCmpScrollBarThumb = { bg = C.muted },
  BlinkCmpScrollBarGutter = { bg = C.bg_alt },
  BlinkCmpLabel = { fg = C.fg },
  BlinkCmpLabelDeprecated = { fg = C.dim, strikethrough = true },
  BlinkCmpLabelDetail = { fg = C.dim },
  BlinkCmpLabelDescription = { fg = C.dim },
  BlinkCmpLabelMatch = { fg = C.callable, bold = true },
  BlinkCmpKind = { fg = C.literal },
  BlinkCmpSource = { fg = C.dim },
  BlinkCmpGhostText = { fg = C.dim, italic = true },
  BlinkCmpDoc = { fg = C.fg, bg = C.bg_float },
  BlinkCmpDocBorder = { fg = C.keyword, bg = C.bg_float },
  BlinkCmpDocSeparator = { fg = C.bg_alt, bg = C.bg_float },
  BlinkCmpDocCursorLine = { bg = C.selection },
  BlinkCmpCursorLineMenuHack = { bg = C.selection },
  BlinkCmpCursorLineDocHack = { bg = C.selection },
  BlinkCmpSignatureHelp = { fg = C.fg, bg = C.bg_float },
  BlinkCmpSignatureHelpBorder = { fg = C.keyword, bg = C.bg_float },
  BlinkCmpSignatureHelpActiveParameter = { fg = C.callable, bold = true },

  -- LuaSnip
  SnippetTabstop = { bg = C.selection },

  -- Telescope
  TelescopeNormal = { fg = C.fg, bg = C.bg },
  TelescopeBorder = { fg = C.keyword, bg = C.bg },
  TelescopeTitle = { fg = C.fg, bg = C.bg, bold = true },
  TelescopePromptNormal = { fg = C.fg, bg = C.bg },
  TelescopePromptBorder = { fg = C.keyword, bg = C.bg },
  TelescopePromptTitle = { fg = C.literal, bg = C.bg, bold = true },
  TelescopePromptPrefix = { fg = C.callable },
  TelescopeResultsNormal = { fg = C.fg, bg = C.bg },
  TelescopeResultsBorder = { fg = C.keyword, bg = C.bg },
  TelescopeResultsTitle = { fg = C.fg, bg = C.bg, bold = true },
  TelescopePreviewNormal = { fg = C.fg, bg = C.bg },
  TelescopePreviewBorder = { fg = C.keyword, bg = C.bg },
  TelescopePreviewTitle = { fg = C.fg, bg = C.bg, bold = true },
  TelescopeSelection = { fg = C.fg, bg = C.selection },
  TelescopeSelectionCaret = { fg = C.attention, bg = C.selection },
  TelescopeMatching = { fg = C.callable, bold = true },
  TelescopeMultiSelection = { fg = C.literal },
  TelescopeMultiIcon = { fg = C.literal },

  -- which-key
  WhichKey = { fg = C.callable, bg = C.bg_float },
  WhichKeyGroup = { fg = C.keyword, bg = C.bg_float },
  WhichKeyDesc = { fg = C.fg, bg = C.bg_float },
  WhichKeyIcon = { fg = C.literal, bg = C.bg_float },
  WhichKeySeparator = { fg = C.keyword, bg = C.bg_float },
  WhichKeySeperator = { link = 'WhichKeySeparator' },
  WhichKeyBorder = { fg = C.keyword, bg = C.bg_float },
  WhichKeyFloat = { bg = C.bg_float },
  WhichKeyValue = { fg = C.literal, bg = C.bg_float },
  WhichKeyNormal = { fg = C.fg, bg = C.bg_float },
  WhichKeyTitle = { fg = C.callable, bg = C.bg_float, bold = true },

  -- Gitsigns
  GitSignsAdd = { fg = C.callable },
  GitSignsChange = { fg = C.warn },
  GitSignsDelete = { fg = C.attention },
  GitSignsTopdelete = { fg = C.attention },
  GitSignsChangedelete = { fg = C.warn },
  GitSignsUntracked = { fg = C.callable },
  GitSignsAddLn = { bg = '#26392e' },
  GitSignsChangeLn = { bg = '#3a3328' },
  GitSignsDeleteLn = { bg = '#3a272b' },
  GitSignsAddPreview = { fg = C.callable },
  GitSignsDeletePreview = { fg = C.attention },
  GitSignsCurrentLineBlame = { fg = C.dim, italic = true },

  -- Flash
  FlashBackdrop = { fg = C.dim },
  FlashMatch = { fg = C.bg, bg = C.callable, bold = true },
  FlashCurrent = { fg = C.bg, bg = C.warn, bold = true },
  FlashLabel = { fg = C.bg, bg = C.attention, bold = true },
  FlashPrompt = { fg = C.fg, bg = C.bg_float },
  FlashPromptIcon = { fg = C.attention, bg = C.bg_float },

  -- DAP / DAP UI
  DapBreakpoint = { fg = C.attention },
  DapBreakpointCondition = { fg = C.warn },
  DapLogPoint = { fg = C.info },
  DapStopped = { fg = C.callable },
  DapUINormal = { fg = C.fg, bg = C.bg },
  DapUIEndOfBuffer = { fg = C.bg_alt, bg = C.bg },
  DapUIVariable = { fg = C.fg },
  DapUIScope = { fg = C.callable, bold = true },
  DapUIType = { fg = C.literal },
  DapUIValue = { fg = C.fg },
  DapUIModifiedValue = { fg = C.warn, bold = true },
  DapUIDecoration = { fg = C.keyword },
  DapUIThread = { fg = C.callable },
  DapUIStoppedThread = { fg = C.warn },
  DapUIFrameName = { fg = C.fg },
  DapUISource = { fg = C.literal },
  DapUILineNumber = { fg = C.keyword },
  DapUIFloatBorder = { fg = C.keyword, bg = C.bg_float },
  DapUIWatchesEmpty = { fg = C.dim },
  DapUIWatchesValue = { fg = C.callable },
  DapUIWatchesError = { fg = C.attention },
  DapUIBreakpointsPath = { fg = C.callable },
  DapUIBreakpointsInfo = { fg = C.info },
  DapUIBreakpointsCurrentLine = { fg = C.warn, bold = true },
  DapUIBreakpointsLine = { fg = C.keyword },
  DapUIBreakpointsDisabledLine = { fg = C.dim },
  DapUICurrentFrameName = { fg = C.warn, bold = true },
  DapUIStepOver = { fg = C.info },
  DapUIStepInto = { fg = C.info },
  DapUIStepBack = { fg = C.info },
  DapUIStepOut = { fg = C.info },
  DapUIStop = { fg = C.attention },
  DapUIPlayPause = { fg = C.callable },
  DapUIRestart = { fg = C.callable },
  DapUIUnavailable = { fg = C.dim },
  DapUIWinSelect = { fg = C.warn, bold = true },

  -- Oil
  OilDir = { fg = C.callable },
  OilDirHidden = { fg = C.dim },
  OilDirIcon = { fg = C.callable },
  OilFile = { fg = C.fg },
  OilFileHidden = { fg = C.dim },
  OilEmpty = { fg = C.dim },
  OilHidden = { fg = C.dim },
  OilLink = { fg = C.info },
  OilLinkHidden = { fg = C.dim },
  OilLinkTarget = { fg = C.dim },
  OilOrphanLink = { fg = C.attention },
  OilOrphanLinkHidden = { fg = C.attention },
  OilOrphanLinkTarget = { fg = C.attention },
  OilLinkTargetHidden = { fg = C.dim },
  OilOrphanLinkTargetHidden = { fg = C.attention },
  OilSocket = { fg = C.literal },
  OilSocketHidden = { fg = C.dim },
  OilCreate = { fg = C.callable },
  OilDelete = { fg = C.attention },
  OilMove = { fg = C.warn },
  OilChange = { fg = C.warn },
  OilCopy = { fg = C.info },
  OilRestore = { fg = C.callable },
  OilTrash = { fg = C.attention },
  OilTrashSourcePath = { fg = C.dim },
  OilPurge = { fg = C.attention, bold = true },
  OilPermissionRead = { fg = C.warn },
  OilPermissionWrite = { fg = C.attention },
  OilPermissionExecute = { fg = C.callable },

  -- Mini.nvim
  MiniStatuslineModeNormal = { fg = C.bg, bg = C.callable, bold = true },
  MiniStatuslineModeInsert = { fg = C.bg, bg = C.literal, bold = true },
  MiniStatuslineModeVisual = { fg = C.bg, bg = C.warn, bold = true },
  MiniStatuslineModeReplace = { fg = C.bg, bg = C.attention, bold = true },
  MiniStatuslineModeCommand = { fg = C.bg, bg = C.info, bold = true },
  MiniStatuslineModeOther = { fg = C.bg, bg = C.keyword, bold = true },
  MiniStatuslineDevinfo = { fg = C.muted, bg = C.bg_alt },
  MiniStatuslineFilename = { fg = C.fg, bg = C.bg_alt },
  MiniStatuslineFileinfo = { fg = C.muted, bg = C.bg_alt },
  MiniStatuslineInactive = { fg = C.dim, bg = C.bg_alt },
  MiniSurround = { fg = C.bg, bg = C.warn },

  -- Mason / Fidget / Copilot / health
  MasonBackdrop = { bg = '#000000' },
  MasonNormal = { fg = C.fg, bg = C.bg_float },
  MasonHeader = { fg = C.bg, bg = C.callable, bold = true },
  MasonHeaderSecondary = { fg = C.bg, bg = C.literal, bold = true },
  MasonHighlight = { fg = C.callable },
  MasonHighlightBlock = { fg = C.bg, bg = C.callable },
  MasonHighlightBlockBold = { fg = C.bg, bg = C.callable, bold = true },
  MasonHighlightSecondary = { fg = C.literal },
  MasonHighlightBlockSecondary = { fg = C.bg, bg = C.literal },
  MasonHighlightBlockBoldSecondary = { fg = C.bg, bg = C.literal, bold = true },
  MasonLink = { fg = C.callable, underline = true },
  MasonMuted = { fg = C.dim },
  MasonMutedBlock = { fg = C.dim, bg = C.bg_alt },
  MasonMutedBlockBold = { fg = C.dim, bg = C.bg_alt, bold = true },
  MasonError = { fg = C.attention },
  MasonWarning = { fg = C.warn },
  MasonHeading = { fg = C.fg, bold = true },
  FidgetNoBlend = { fg = C.fg, bg = C.bg },
  FidgetTitle = { fg = C.callable, bg = C.bg_float, bold = true },
  FidgetTask = { fg = C.muted, bg = C.bg_float },
  CopilotSuggestion = { fg = C.dim, italic = true },
  CopilotAnnotation = { fg = C.dim },
  healthSuccess = { fg = C.callable },
  healthWarning = { fg = C.warn },
  healthError = { fg = C.attention },
}

local function set(groups, hl)
  for _, group in ipairs(groups) do
    theme[group] = hl
  end
end

local function set_todos(names, color)
  for _, name in ipairs(names) do
    theme['TodoFg' .. name] = { fg = color, bold = true }
    theme['TodoBg' .. name] = { fg = C.bg, bg = color, bold = true }
    theme['TodoSign' .. name] = { fg = color }
  end
end

set({ 'Keyword', 'Conditional', 'Repeat', 'Statement', 'Exception', 'Include', 'PreProc', 'Define', 'Macro', 'PreCondit', 'StorageClass' }, { fg = C.keyword })
set(
  {
    '@keyword',
    '@conditional',
    '@repeat',
    '@exception',
    '@include',
    '@keyword.return',
    '@keyword.import',
    '@keyword.function',
    '@keyword.operator',
    '@keyword.conditional',
    '@keyword.repeat',
    '@keyword.exception',
    '@keyword.coroutine',
    '@keyword.directive',
    '@keyword.directive.define',
  },
  { fg = C.keyword }
)
set({ 'String', 'Character', 'Number', 'Float', 'Boolean', 'Constant' }, { fg = C.literal })
set(
  {
    '@string',
    '@string.regex',
    '@string.escape',
    '@string.special',
    '@string.special.symbol',
    '@string.special.url',
    '@character',
    '@character.special',
    '@number',
    '@number.float',
    '@boolean',
    '@constant',
    '@constant.builtin',
    '@constant.macro',
  },
  { fg = C.literal }
)
set({ 'Function', 'Type', 'Typedef', 'Structure', 'Label' }, { fg = C.callable })
set(
  {
    '@function',
    '@function.builtin',
    '@function.call',
    '@function.macro',
    '@method',
    '@method.call',
    '@type',
    '@type.builtin',
    '@type.definition',
    '@module',
    '@namespace',
    '@label',
    '@tag',
  },
  { fg = C.callable }
)
set({ '@comment', '@comment.todo', '@comment.note', '@comment.warning', '@comment.error' }, { fg = C.attention })
set(
  {
    '@constructor',
    '@variable',
    '@variable.builtin',
    '@variable.parameter',
    '@variable.member',
    '@parameter',
    '@property',
    '@field',
    '@operator',
    '@punctuation.delimiter',
    '@punctuation.bracket',
    '@punctuation.special',
    '@punctuation',
    '@attribute',
    '@tag.attribute',
    '@tag.delimiter',
    '@none',
    '@text',
  },
  { fg = C.fg }
)
set(
  {
    '@lsp.type.class',
    '@lsp.type.decorator',
    '@lsp.type.enum',
    '@lsp.type.interface',
    '@lsp.type.namespace',
    '@lsp.type.struct',
    '@lsp.type.type',
    '@lsp.type.typeParameter',
    '@lsp.type.function',
    '@lsp.type.macro',
    '@lsp.type.method',
    '@lsp.typemod.class.declaration',
    '@lsp.typemod.class.definition',
    '@lsp.typemod.enum.declaration',
    '@lsp.typemod.function.declaration',
    '@lsp.typemod.function.definition',
    '@lsp.typemod.macro.declaration',
    '@lsp.typemod.method.declaration',
    '@lsp.typemod.struct.declaration',
    '@lsp.typemod.type.declaration',
    '@lsp.typemod.member.defaultLibrary',
    '@lsp.typemod.method.defaultLibrary',
  },
  { fg = C.callable }
)
set({ '@lsp.type.enumMember', '@lsp.type.number', '@lsp.type.string' }, { fg = C.literal })
set({ '@lsp.type.comment' }, { fg = C.attention })
set({ '@lsp.type.keyword', '@lsp.type.modifier', '@lsp.type.operator' }, { fg = C.keyword })
set(
  {
    '@lsp.mod.declaration',
    '@lsp.type.parameter',
    '@lsp.type.property',
    '@lsp.type.variable',
    '@lsp.type.member',
    '@lsp.typemod.member.declaration',
    '@lsp.typemod.parameter.declaration',
    '@lsp.typemod.property.declaration',
    '@lsp.typemod.variable.declaration',
    '@lsp.typemod.variable.definition',
  },
  { fg = C.fg }
)
set(
  {
    'BlinkCmpKindMethod',
    'BlinkCmpKindFunction',
    'BlinkCmpKindConstructor',
    'BlinkCmpKindClass',
    'BlinkCmpKindInterface',
    'BlinkCmpKindModule',
    'BlinkCmpKindEnum',
    'BlinkCmpKindFolder',
    'BlinkCmpKindStruct',
    'BlinkCmpKindTypeParameter',
  },
  { fg = C.callable }
)
set(
  { 'BlinkCmpKindUnit', 'BlinkCmpKindValue', 'BlinkCmpKindSnippet', 'BlinkCmpKindColor', 'BlinkCmpKindEnumMember', 'BlinkCmpKindConstant' },
  { fg = C.literal }
)
set({ 'BlinkCmpKindText', 'BlinkCmpKindField', 'BlinkCmpKindVariable', 'BlinkCmpKindProperty', 'BlinkCmpKindFile', 'BlinkCmpKindOperator' }, { fg = C.fg })
set({ 'BlinkCmpKindReference' }, { fg = C.info })
set({ 'BlinkCmpKindKeyword' }, { fg = C.keyword })
set({ 'BlinkCmpKindEvent' }, { fg = C.warn })
set({ 'DapUIUnavailableNC', 'DapUIPlayPauseNC', 'DapUIRestartNC', 'DapUIStopNC', 'DapUIStepOverNC', 'DapUIStepIntoNC', 'DapUIStepBackNC', 'DapUIStepOutNC' }, { fg = C.dim })

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
  theme['WhichKeyIcon' .. name] = { fg = color, bg = C.bg_float }
end

set_todos({ 'TODO', 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'HACK', 'PERF', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' }, C.attention)
set_todos({ 'WARN', 'WARNING', 'XXX' }, C.warn)
set_todos({ 'NOTE', 'INFO' }, C.info)
set_todos({ 'TEST', 'TESTING', 'PASSED', 'FAILED' }, C.callable)

for group, hl in pairs(theme) do
  vim.api.nvim_set_hl(0, group, hl)
end
