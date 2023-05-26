local M = {}
local palette = {}

local set_terminal_hl = function ()
  vim.g.terminal_color_0 = palette.bg
  vim.g.terminal_color_1 = palette.indian_red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.orange
  vim.g.terminal_color_4 = palette.cyan
  vim.g.terminal_color_5 = palette.purple
  vim.g.terminal_color_6 = palette.green
  vim.g.terminal_color_7 = palette.fg
  vim.g.terminal_color_8 = palette.fg_idle
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.orange
  vim.g.terminal_color_12 = palette.cyan
  vim.g.terminal_color_13 = palette.purple
  vim.g.terminal_color_14 = palette.green
  vim.g.terminal_color_15 = palette.grey
  vim.g.terminal_color_background = palette.bg
  vim.g.terminal_color_foreground = palette.fg
end

local set_groups_hl = function ()
  local groups = {
    -- Base.
    Normal       = { fg = palette.fg,             bg = palette.bg },
    NormalFloat  = {                              bg = palette.bg },
    FloatBorder  = { fg = palette.grey },
    FloatTitle   = { fg = palette.fg },
    ColorColumn  = {                              bg = palette.line },
    Cursor       = { fg = palette.bg,             bg = palette.fg },
    CursorColumn = {                              bg = palette.line },
    CursorLine   = {                              bg = palette.line },
    CursorLineNr = { fg = palette.cursor_line_nr, bg = palette.line },
    LineNr       = { fg = palette.line_nr },

    Directory  = { fg = palette.cyan },
    ErrorMsg   = { fg = palette.red },
    VertSplit  = { fg = palette.line_nr,  bg = palette.bg },
    Folded     = { fg = palette.grey,     bg = palette.line },
    FoldColumn = {                        bg = palette.line },
    SignColumn = {                        bg = palette.bg },

    MatchParen   = { underline = true },
    ModeMsg      = { fg = palette.green },
    MoreMsg      = { fg = palette.green },
    NonText      = { fg = palette.grey },

    Pmenu        = { fg = palette.fg,     bg = palette.line },
    PmenuSel     = { fg = palette.bg,     bg = palette.line_nr },
    Search       = { fg = palette.bg,     bg = palette.line_nr },
    CurSearch    = { fg = palette.bg,     bg = palette.purple },
    IncSearch    = { fg = palette.orange, bg = palette.line_nr },

    Question     = { fg = palette.green },
    SpecialKey   = { fg = palette.pink },
    SpellCap     = { sp = palette.cyan,        undercurl = true },
    SpellLocal   = { sp = palette.orange,      undercurl = true },
    SpellBad     = { sp = palette.red,         undercurl = true },
    SpellRare    = { sp = palette.green,       undercurl = true },
    StatusLine   = { fg = palette.fg,          bg = palette.bg },
    StatusLineNC = { fg = palette.grey,        bg = palette.bg },
    WildMenu     = { fg = palette.fg,          bg = palette.line },
    TabLine      = { fg = palette.grey,        bg = palette.bg },
    TabLineFill  = { fg = palette.fg },
    TabLineSel   = { fg = palette.fg,          bg = palette.bg },
    Title        = { fg = palette.orange },
    Visual       = { fg = palette.bg,          bg = palette.pink },
    WarningMsg   = { fg = palette.orange },

    comment           = { fg = palette.grey },
    constant          = { fg = palette.purple },
    string            = { fg = palette.green },
    Identifier        = { fg = palette.blue },
    Function          = { fg = palette.green },
    Statement         = { fg = palette.indian_red },
    Operator          = { fg = palette.orange },
    Exception         = { fg = palette.indian_red },
    PreProc           = { fg = palette.orange },
    Type              = { fg = palette.cyan },
    Structure         = { fg = palette.indian_red },
    Special           = { fg = palette.grey },
    Delimiter         = { fg = palette.indian_red },
    Underlined        = { sp = palette.cyan,        underline = true },
    Ignore            = { fg = palette.fg },
    Error             = { fg = palette.white,       bg = palette.red },
    Todo              = { fg = palette.indian_red },
    qfLineNr          = { fg = palette.orange },
    qfError           = { fg = palette.red },
    Conceal           = { fg = palette.grey },
    CursorLineConceal = { fg = palette.grey,        bg = palette.line },

    DiffAdd     = { fg = palette.green },
    DiffChange  = { fg = palette.blue },
    DiffDelete  = { fg = palette.indian_red },
    DiffText    = { fg = palette.dark_purple },

    -- Markdown.
    markdownCode = { fg = palette.green },

    -- TreeSitter.
    ['@property']         = { fg = palette.pink },
    ['@field']            = { fg = palette.blue },
    ['@parameter']        = { fg = palette.fg },
    ['@namespace']        = { fg = palette.cyan },
    ['@variable.builtin'] = { fg = palette.green },
    ['@text.title']       = { fg = palette.indian_red },
    ['@type.qualifier']   = { fg = palette.orange },
    ['@storageclass']     = { fg = palette.orange },
    ['@tag']              = { fg = palette.yellow },
    ['@tag.attribute']    = { fg = palette.cyan },
    ['@tag.delimiter']    = { link = 'Delimiter' },
    ['@variable']         = { fg = palette.yellow },

    -- SemanticToken
    LspNamespace      = { fg = palette.cyan },
    LspType           = { link = 'Type' },
    LspClass          = { link = 'Structure' },
    LspEnum           = { link = 'Identifier' },
    LspInterface      = { fg = palette.cyan },
    LspStruct         = { fg = palette.cyan },
    LspTypeParameter  = { link = 'Type' },
    LspParameter      = { fg = palette.fg },
    LspVariable       = { fg = palette.yellow },
    LspProperty       = { fg = palette.pink },
    LspEnumMember     = { fg = palette.purple },
    LspEvent          = { fg = palette.pink },
    LspFunction       = { link = 'Function' },
    LspMethod         = { fg = palette.indian_red },
    LspMacro          = { link = 'string' },
    LspKeyword        = { fg = palette.cyan },
    LspComment        = { link = 'comment' },
    LspString         = { link = 'string' },
    LspNumber         = { fg = palette.grey },
    LspRegexp         = { fg = palette.blue },
    LspOperator       = { link = 'Operator' },
    LspDeclaration    = { fg = palette.entity },
    LspDefinition     = { fg = palette.yellow },
    LspStatic         = { fg = palette.cyan },
    LspDeprecated     = { fg = palette.fg_idle },
    LspAbstract       = { fg = palette.indian_red },
    LspAsync          = { fg = palette.cyan },
    LspModification   = { link = 'DiffChange' },
    LspDocumentation  = { link = 'Identifier' },
    LspDefaultLibrary = { fg = palette.entity },

    -- Gitsigns.
    GitSignsAddLn     = { fg = palette.green },
    GitSignsDeleteLn  = { fg = palette.yellow },
    GitSignsChange    = { fg = palette.indian_red },

    -- Telescope.
    TelescopeNormal           = { fg = palette.grey },
    TelescopeBorder           = { fg = palette.grey },
    TelescopePrompt           = { link = "TelescopeNormal" },
    TelescopePromptBorder     = { link = "TelescopeBorder" },
    TelescopePromptPrefix     = { fg = palette.blue },
    TelescopeResultsBorder    = { link = "TelescopeBorder" },
    TelescopePreviewBorder    = { link = "TelescopeBorder" },
    TelescopeMatching         = { fg = palette.indian_red },
    TelescopeSelection        = { fg = palette.blue, bg = palette.line },
    TelescopeSelectionCaret   = { fg = palette.indian_red },

    -- Cmp.
    CmpItemAbbrMatch          = { fg = palette.cyan },
    CmpItemAbbrMatchFuzzy     = { fg = palette.indian_red },
    CmpItemKindText           = { fg = palette.cyan },
    CmpItemKindMethod         = { fg = palette.cyan },
    CmpItemKindFunction       = { fg = palette.indian_red },
    CmpItemKindConstructor    = { fg = palette.cyan },
    CmpItemKindField          = { fg = palette.purple },
    CmpItemKindVariable       = { fg = palette.blue },
    CmpItemKindClass          = { fg = palette.indian_red },
    CmpItemKindInterface      = { fg = palette.indian_red },
    CmpItemKindModule         = { fg = palette.cyan },
    CmpItemKindProperty       = { fg = palette.cyan },
    CmpItemKindUnit           = { fg = palette.purple },
    CmpItemKindValue          = { fg = palette.purple },
    CmpItemKindEnum           = { fg = palette.indian_red },
    CmpItemKindKeyword        = { fg = palette.cyan },
    CmpItemKindSnippet        = { fg = palette.indian_red },
    CmpItemKindColor          = { fg = palette.grey },
    CmpItemKindFile           = { fg = palette.grey },
    CmpItemKindReference      = { fg = palette.grey },
    CmpItemKindFolder         = { fg = palette.grey },
    CmpItemKindEnumMember     = { fg = palette.purple },
    CmpItemKindConstant       = { fg = palette.purple },
    CmpItemKindStruct         = { fg = palette.entity },
    CmpItemKindEvent          = { fg = palette.pink },
    CmpItemKindOperator       = { fg = palette.orange },
    CmpItemKindTypeParameter  = { fg = palette.pink },
    CmpItemMenu               = { fg = palette.grey },

    -- Word under cursor.
    CursorWord  = { bg = palette.blue },
    CursorWord0 = { bg = palette.blue },
    CursorWord1 = { bg = palette.blue },

    -- Noice
    NoiceLspProgressTitle =  { fg = palette.fg },
    NoiceLspProgressClient = { fg = palette.yellow },

    -- WhichKey.
    WhichKeyFloat = { bg = palette.bg },

    -- Indent blankline.
    IndentBlanklineContextChar = { fg = palette.grey },

    -- Neogit.
    NeogitDiffContextHighlight  = { bg = palette.line },
    NeogitHunkHeader            = { fg = palette.pink },
    NeogitHunkHeaderHighlight   = { fg = palette.pink, bg = palette.line },
    NeogitDiffAddHighlight      = { fg = palette.fg,   bg = palette.green },
    NeogitDiffDeleteHighlight   = { fg = palette.fg,   bg = palette.indian_red },

    -- Hop.
    HopNextKey    = { fg = palette.orange, bold = true, underline = true },
    HopNextKey1   = { fg = palette.cyan,   bold = true, underline = true },
    HopNextKey2   = { fg = palette.pink },
    HopUnmatched  = { fg = palette.grey },

    -- Leap.
    LeapMatch           = { fg = palette.green, underline = true },
    LeapLabelPrimary    = { fg = palette.bg,    bg = palette.indian_red },
    LeapLabelSecondary  = { fg = palette.bg,    bg = palette.cyan },
    LeapLabelSelected   = { fg = palette.bg,    bg = palette.pink },

    -- LSP Signature.
    LspSignatureActiveParameter = { italic = true },

    -- Notify.
    NotifyERROR       = { fg = palette.yellow },
    NotifyWARN        = { fg = palette.orange },
    NotifyINFO        = { fg = palette.green },
    NotifyDEBUG       = { fg = palette.grey },
    NotifyTRACE       = { fg = palette.indian_red },
    NotifyERRORTitle  = { fg = palette.red },
    NotifyWARNTitle   = { fg = palette.orange },
    NotifyINFOTitle   = { fg = palette.green },
    NotifyDEBUGTitle  = { fg = palette.green },
    NotifyTRACETitle  = { fg = palette.green },

    -- Dap.
    NvimDapVirtualText = { fg = palette.green },

    -- DAP UI.
    DapUIScope                  = { fg = palette.green },
    DapUIType                   = { fg = palette.cyan },
    DapUIDecoration             = { fg = palette.blue },
    DapUIThread                 = { fg = palette.green },
    DapUIStoppedThread          = { fg = palette.orange },
    DapUISource                 = { fg = palette.green },
    DapUILineNumber             = { fg = palette.grey },
    DapUIFloatBorder            = { fg = palette.grey },
    DapUIWatchesEmpty           = { fg = palette.orange },
    DapUIWatchesValue           = { fg = palette.green },
    DapUIWatchesError           = { fg = palette.red },
    DapUIBreakpointsPath        = { fg = palette.green },
    DapUIBreakpointsInfo        = { fg = palette.grey },
    DapUIBreakpointsCurrentLine = { fg = palette.grey, bg = palette.line, bold = true },

    -- Hydra
    HydraRed       = { fg = palette.red },
    HydraBlue      = { fg = palette.blue },
    HydraAmaranth  = { fg = palette.green },
    HydraTeal      = { fg = palette.cyan },
    HydraPink      = { fg = palette.pink },

    -- Dashboard-nvim.
    DashboardHeader = { fg = palette.line_nr },
    DashboardFooter = { fg = palette.grey },

    -- Visual Multi.
    VM_Extend = { bg = palette.line },
    VM_Cursor = { bg = palette.line,  sp = palette.fg, underline = true },
    VM_Insert = { sp = palette.fg,    underline = true },
    VM_Mono   = { fg = palette.bg,    bg = palette.grey },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

M.load = function (theme)
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.g.VM_theme_set_by_colorscheme = true
  vim.o.termguicolors = true
  vim.g.colors_name = "akane"

  palette = require("akane." .. theme)
  set_terminal_hl()
  set_groups_hl()
end

return M
