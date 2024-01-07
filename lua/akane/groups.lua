local M = {}

M.set_groups_hl = function(palette)
  local groups = {
    -- Base.
    Normal = { fg = palette.fg, bg = palette.bg },
    NormalNC = { fg = palette.fg, bg = palette.bg },
    NormalFloat = { bg = palette.line },
    FloatBorder = { fg = palette.grey },
    FloatTitle = { fg = palette.fg },
    ColorColumn = { bg = palette.line },
    Cursor = { fg = palette.bg, bg = palette.fg },
    CursorColumn = { bg = palette.line },
    CursorLine = { bg = palette.line },
    CursorLineNr = { fg = palette.cursor_line_nr, bg = palette.line },
    LineNr = { fg = palette.line_nr },

    Directory = { fg = palette.cyan },
    ErrorMsg = { fg = palette.red },
    VertSplit = { fg = palette.cursor_line_nr, bg = palette.bg },
    Folded = { fg = palette.grey, bg = palette.line },
    FoldColumn = { bg = palette.line },
    SignColumn = { bg = palette.bg },

    MatchParen = { underline = true },
    ModeMsg = { fg = palette.green },
    MoreMsg = { fg = palette.green },
    NonText = { fg = palette.grey },

    Pmenu = { fg = palette.line_nr, bg = palette.bg },
    PmenuSel = { fg = "NONE", bg = palette.line },
    PmenuSbar = { fg = palette.bg, bg = palette.bg },
    PmenuThumb = { fg = palette.bg, bg = palette.bg },

    Search = { fg = palette.bg, bg = palette.line_nr },
    CurSearch = { fg = palette.bg, bg = palette.purple },
    IncSearch = { fg = palette.orange, bg = palette.line_nr },

    Question = { fg = palette.green },
    SpecialKey = { fg = palette.pink },
    SpellCap = { sp = palette.cyan, undercurl = true },
    SpellLocal = { sp = palette.orange, undercurl = true },
    SpellBad = { sp = palette.red, undercurl = true },
    SpellRare = { sp = palette.green, undercurl = true },
    StatusLine = { fg = palette.fg, bg = palette.bg },
    StatusLineNC = { fg = palette.grey, bg = palette.bg },
    WildMenu = { fg = palette.fg, bg = palette.line },
    TabLine = { fg = palette.grey, bg = palette.bg },
    TabLineFill = { fg = palette.fg },
    TabLineSel = { fg = palette.fg, bg = palette.bg },
    Title = { fg = palette.orange },
    Visual = { fg = palette.bg, bg = palette.pink },
    WarningMsg = { fg = palette.orange },

    comment = { fg = palette.grey, italic = true },
    constant = { fg = palette.purple },
    string = { fg = palette.green },
    Identifier = { fg = palette.blue },
    Function = { fg = palette.green },
    Statement = { fg = palette.indian_red },
    Operator = { fg = palette.orange },
    Exception = { fg = palette.indian_red, italic = true },
    PreProc = { fg = palette.orange },
    Type = { fg = palette.cyan },
    TypeDef = { fg = palette.yellow },
    Macro = { fg = palette.blue },
    Structure = { fg = palette.indian_red },
    Special = { fg = palette.grey },
    Delimiter = { fg = palette.indian_red },
    Underlined = { sp = palette.cyan, underline = true },
    Ignore = { fg = palette.fg },
    Error = { fg = palette.white, bg = palette.red },
    Todo = { fg = palette.indian_red, italic = true },
    qfLineNr = { fg = palette.orange },
    qfError = { fg = palette.red },
    Conceal = { fg = palette.grey },
    CursorLineConceal = { fg = palette.grey, bg = palette.line },

    DiffAdd = { fg = palette.green },
    DiffChange = { fg = palette.blue },
    DiffDelete = { fg = palette.indian_red },
    DiffText = { fg = palette.dark_purple },

    -- LSP.
    DiagnosticError = { fg = palette.red },
    DiagnosticWarn = { fg = palette.yellow },
    DiagnosticHint = { fg = palette.grey },
    DiagnosticInfo = { fg = palette.blue },
    DiagnosticVirtualTextError = { fg = palette.red },
    DiagnosticVirtualTextWarn = { fg = palette.yellow },
    DiagnosticVirtualTextHint = { fg = palette.grey },
    DiagnosticVirtualTextInfo = { fg = palette.blue },
    DiagnosticUnderlineError = { sp = palette.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = palette.yellow, undercurl = true },
    DiagnosticUnderlineHint = { sp = palette.grey, undercurl = true, italic = true },
    DiagnosticUnderlineInfo = { sp = palette.blue, undercurl = true, italic = true },
    DiagnosticSignError = { fg = palette.red },
    DiagnosticSignWarn = { fg = palette.yellow },
    DiagnosticSignHint = { fg = palette.grey },
    DiagnosticSignInfo = { fg = palette.blue },
    DiagnosticDeprecated = { sp = palette.grey, strikethrough = true, italic = true },

    -- Markdown.
    markdownCode = { fg = palette.green },

    -- TreeSitter.
    ["@property"] = { fg = palette.pink },
    ["@field"] = { fg = palette.blue },
    ["@parameter"] = { fg = palette.fg },
    ["@namespace"] = { fg = palette.cyan },
    ["@variable.builtin"] = { fg = palette.green },
    ["@text.title"] = { fg = palette.indian_red },
    ["@type.qualifier"] = { fg = palette.orange },
    ["@storageclass"] = { fg = palette.orange },
    ["@tag"] = { fg = palette.yellow },
    ["@tag.attribute"] = { fg = palette.cyan },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@variable"] = { fg = palette.yellow },

    -- SemanticToken
    ["@lsp.type.class"] = { fg = palette.yellow },
    ["@lsp.type.decorator"] = { fg = palette.dark_purple },
    ["@lsp.type.enum"] = { fg = palette.purple },
    ["@lsp.type.enumMember"] = { link = "constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { fg = palette.blue },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { fg = palette.orange },
    ["@lsp.type.parameter"] = { fg = palette.line_nr },
    ["@lsp.type.property"] = { fg = palette.pink },
    ["@lsp.type.struct"] = { link = "Structure" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { fg = palette.green },
    ["@lsp.type.variable"] = { link = "Identifier" },

    -- Gitsigns.
    GitSignsAddLn = { fg = palette.green },
    GitSignsDeleteLn = { fg = palette.yellow },
    GitSignsChange = { fg = palette.indian_red },

    -- Telescope.
    TelescopeNormal = { fg = palette.grey },
    TelescopeBorder = { fg = palette.grey },
    TelescopePrompt = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeBorder" },
    TelescopePromptPrefix = { fg = palette.blue },
    TelescopeResultsBorder = { link = "TelescopeBorder" },
    TelescopePreviewBorder = { link = "TelescopeBorder" },
    TelescopeMatching = { fg = palette.indian_red },
    TelescopeSelection = { fg = palette.blue, bg = palette.line },
    TelescopeSelectionCaret = { fg = palette.indian_red },

    -- Cmp.
    CmpItemAbbrDeprecated = { fg = palette.grey, bg = "NONE", strikethrough = true },
    CmpItemAbbrMatch = { fg = palette.blue, bg = "NONE", bold = true },
    CmpItemAbbrMatchFuzzy = { fg = palette.blue, bg = "NONE", bold = true },
    CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true },

    CmpItemKindField = { fg = palette.bg, bg = palette.indian_red },
    CmpItemKindProperty = { fg = palette.bg, bg = palette.indian_red },
    CmpItemKindEvent = { fg = palette.bg, bg = palette.indian_red },

    CmpItemKindText = { fg = palette.bg, bg = palette.green },
    CmpItemKindEnum = { fg = palette.bg, bg = palette.green },
    CmpItemKindKeyword = { fg = palette.bg, bg = palette.green },

    CmpItemKindConstant = { fg = palette.bg, bg = palette.orange },
    CmpItemKindConstructor = { fg = palette.bg, bg = palette.orange },
    CmpItemKindReference = { fg = palette.bg, bg = palette.orange },

    CmpItemKindFunction = { fg = palette.bg, bg = palette.purple },
    CmpItemKindStruct = { fg = palette.bg, bg = palette.purple },
    CmpItemKindClass = { fg = palette.bg, bg = palette.purple },
    CmpItemKindModule = { fg = palette.bg, bg = palette.purple },
    CmpItemKindOperator = { fg = palette.bg, bg = palette.purple },

    CmpItemKindVariable = { fg = palette.bg, bg = palette.fg },
    CmpItemKindFile = { fg = palette.bg, bg = palette.fg },

    CmpItemKindUnit = { fg = palette.bg, bg = palette.yellow },
    CmpItemKindSnippet = { fg = palette.bg, bg = palette.yellow },
    CmpItemKindFolder = { fg = palette.bg, bg = palette.yellow },

    CmpItemKindMethod = { fg = palette.bg, bg = palette.blue },
    CmpItemKindValue = { fg = palette.bg, bg = palette.blue },
    CmpItemKindEnumMember = { fg = palette.bg, bg = palette.blue },

    CmpItemKindInterface = { fg = palette.bg, bg = palette.cyan },
    CmpItemKindColor = { fg = palette.bg, bg = palette.cyan },
    CmpItemKindTypeParameter = { fg = palette.bg, bg = palette.cyan },

    -- Word under cursor.
    CursorWord = { bg = palette.blue },
    CursorWord0 = { bg = palette.blue },
    CursorWord1 = { bg = palette.blue },

    -- Noice
    NoiceLspProgressTitle = { fg = palette.fg },
    NoiceLspProgressClient = { fg = palette.yellow },
    NoiceMini = { fg = palette.grey, bg = palette.bg },

    -- WhichKey.
    WhichKeyFloat = { bg = palette.bg },

    -- Indent blankline.
    IndentBlanklineContextChar = { fg = palette.grey },

    -- Neogit.
    NeogitDiffContextHighlight = { bg = palette.line },
    NeogitHunkHeader = { fg = palette.pink },
    NeogitHunkHeaderHighlight = { fg = palette.pink, bg = palette.line },
    NeogitDiffAddHighlight = { fg = palette.bg, bg = palette.green },
    NeogitDiffDeleteHighlight = { fg = palette.bg, bg = palette.indian_red },
    NeogitDiffAdd = { fg = palette.green, bg = palette.bg },
    NeogitDiffDelete = { fg = palette.indian_red, bg = palette.bg },
    NeogitDiffContext = { fg = palette.grey, bg = palette.bg },
    NeogitDiffHeader = { fg = palette.grey, bg = palette.bg },

    -- NeoTree.
    NeoTreeFloatBorder = { bg = palette.bg },
    NeoTreeGitIgnored = { fg = palette.grey },

    -- NvimTree.
    NvimTreeSignColumn = { link = "Normal" },
    NvimTreeNormalFloat = { link = "Normal" },

    -- Hop.
    HopNextKey = { fg = palette.orange, bold = true, underline = true },
    HopNextKey1 = { fg = palette.cyan, bold = true, underline = true },
    HopNextKey2 = { fg = palette.pink },
    HopUnmatched = { fg = palette.grey },

    -- Leap.
    LeapMatch = { fg = palette.bg, bg = palette.purple },
    LeapLabelPrimary = { fg = palette.bg, bg = palette.blue },
    LeapLabelSecondary = { fg = palette.bg, bg = palette.cyan },
    LeapLabelSelected = { fg = palette.bg, bg = palette.pink },

    -- LSP Signature.
    LspSignatureActiveParameter = { italic = true },

    -- Notify.
    NotifyERROR = { fg = palette.yellow },
    NotifyWARN = { fg = palette.orange },
    NotifyINFO = { fg = palette.green },
    NotifyDEBUG = { fg = palette.grey },
    NotifyTRACE = { fg = palette.indian_red },
    NotifyERRORTitle = { fg = palette.red },
    NotifyWARNTitle = { fg = palette.orange },
    NotifyINFOTitle = { fg = palette.green },
    NotifyDEBUGTitle = { fg = palette.green },
    NotifyTRACETitle = { fg = palette.green },

    -- Dap.
    NvimDapVirtualText = { fg = palette.green },

    -- DAP UI.
    DapUIScope = { fg = palette.green },
    DapUIType = { fg = palette.cyan },
    DapUIDecoration = { fg = palette.blue },
    DapUIThread = { fg = palette.green },
    DapUIStoppedThread = { fg = palette.orange },
    DapUISource = { fg = palette.green },
    DapUILineNumber = { fg = palette.grey },
    DapUIFloatBorder = { fg = palette.grey },
    DapUIWatchesEmpty = { fg = palette.orange },
    DapUIWatchesValue = { fg = palette.green },
    DapUIWatchesError = { fg = palette.red },
    DapUIBreakpointsPath = { fg = palette.green },
    DapUIBreakpointsInfo = { fg = palette.grey },
    DapUIBreakpointsCurrentLine = { fg = palette.grey, bg = palette.line, bold = true },

    -- mini.nvim
    MiniIndentscopeSymbol = { fg = palette.blue },

    -- Hydra
    HydraRed = { fg = palette.red },
    HydraBlue = { fg = palette.blue },
    HydraAmaranth = { fg = palette.green },
    HydraTeal = { fg = palette.cyan },
    HydraPink = { fg = palette.pink },
    HydraBorder = { link = "NormalFloat" },

    -- Dashboard-nvim.
    DashboardHeader = { fg = palette.line_nr },
    DashboardFooter = { fg = palette.grey },

    -- Fidget.nvim
    Fidgettitle = { fg = palette.blue, bg = palette.bg },
    Fidgettask = { fg = palette.grey, bg = palette.bg },

    -- Visual Multi.
    VM_Extend = { bg = palette.line },
    VM_Cursor = { bg = palette.line, sp = palette.fg, underline = true },
    VM_Insert = { sp = palette.fg, underline = true },
    VM_Mono = { fg = palette.bg, bg = palette.grey },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return M
