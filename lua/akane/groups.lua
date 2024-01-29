local M = {}

M.set_groups_hl = function(palette)
  local bg = palette.bg
  local fg = palette.fg
  local line = palette.line
  local line_nr = palette.line_nr
  local cursor_line_nr = palette.cursor_line_nr
  local white = palette.white
  local black = palette.black
  local cyan = palette.cyan
  local blue = palette.blue
  local green = palette.green
  local light_green = palette.light_green
  local orange = palette.orange
  local yellow = palette.yellow
  local grey = palette.grey
  local purple = palette.purple
  local dark_purple = palette.dark_purple
  local indian_red = palette.indian_red
  local red = palette.red
  local pink = palette.pink
  local light_pink = palette.light_pink

  local transparent = function(bg)
    return palette.transparent == true and "NONE" or bg
  end

  local groups = {
    -- Base.
    Normal = { fg = fg, bg = transparent(bg) },
    NormalNC = { fg = fg, bg = transparent(bg) },
    NormalFloat = { bg = transparent(bg) },
    FloatBorder = { fg = grey, bg = transparent(bg) },
    FloatTitle = { fg = fg, bg = bg },
    ColorColumn = { bg = line },
    Cursor = { fg = bg, bg = fg },
    CursorColumn = { bg = line },
    CursorLine = { bg = line },
    CursorLineNr = { fg = cursor_line_nr, bg = line },
    LineNr = { fg = line_nr },

    Directory = { fg = cyan },
    ErrorMsg = { fg = red },
    VertSplit = { fg = cursor_line_nr, bg = transparent(bg) },
    Folded = { fg = grey, bg = transparent(line) },
    FoldColumn = { bg = transparent(line) },
    SignColumn = { bg = transparent(bg) },

    MatchParen = { underline = true },
    ModeMsg = { fg = green },
    MoreMsg = { fg = green },
    NonText = { fg = grey },

    Pmenu = { fg = line_nr, bg = transparent(bg) },
    PmenuSel = { fg = "NONE", bg = line },
    PmenuSbar = { fg = bg, bg = transparent(bg) },
    PmenuThumb = { fg = bg, bg = transparent(bg) },

    Search = { fg = bg, bg = line_nr },
    CurSearch = { fg = bg, bg = purple },
    IncSearch = { fg = orange, bg = line_nr },

    Question = { fg = green },
    SpecialKey = { fg = pink },
    SpellCap = { sp = cyan, undercurl = true },
    SpellLocal = { sp = orange, undercurl = true },
    SpellBad = { sp = red, undercurl = true },
    SpellRare = { sp = green, undercurl = true },
    StatusLine = { fg = fg, bg = transparent(bg) },
    StatusLineNC = { fg = grey, bg = transparent(bg) },
    WildMenu = { fg = fg, bg = transparent(line) },
    TabLine = { fg = grey, bg = transparent(bg) },
    TabLineFill = { fg = fg },
    TabLineSel = { fg = fg, bg = transparent(bg) },
    Title = { fg = orange },
    Visual = { fg = bg, bg = pink },
    WarningMsg = { fg = orange },

    comment = { fg = grey, italic = true },
    constant = { fg = purple },
    string = { fg = green },
    Identifier = { fg = blue },
    Function = { fg = green },
    Statement = { fg = indian_red },
    Operator = { fg = orange },
    Exception = { fg = indian_red, italic = true },
    PreProc = { fg = orange },
    Type = { fg = cyan },
    TypeDef = { fg = yellow },
    Macro = { fg = blue },
    Structure = { fg = indian_red },
    Special = { fg = grey },
    Delimiter = { fg = indian_red },
    Underlined = { sp = cyan, underline = true },
    Ignore = { fg = fg },
    Error = { fg = white, bg = red },
    Todo = { fg = indian_red, italic = true },
    qfLineNr = { fg = orange },
    qfError = { fg = red },
    Conceal = { fg = grey },
    CursorLineConceal = { fg = grey, bg = line },

    DiffAdd = { fg = green },
    DiffChange = { fg = blue },
    DiffDelete = { fg = indian_red },
    DiffText = { fg = dark_purple },

    -- LSP.
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = yellow },
    DiagnosticHint = { fg = grey },
    DiagnosticInfo = { fg = blue },
    DiagnosticVirtualTextError = { fg = red },
    DiagnosticVirtualTextWarn = { fg = yellow },
    DiagnosticVirtualTextHint = { fg = grey },
    DiagnosticVirtualTextInfo = { fg = blue },
    DiagnosticUnderlineError = { sp = red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = yellow, undercurl = true },
    DiagnosticUnderlineHint = { sp = grey, undercurl = true, italic = true },
    DiagnosticUnderlineInfo = { sp = blue, undercurl = true, italic = true },
    DiagnosticSignError = { fg = red },
    DiagnosticSignWarn = { fg = yellow },
    DiagnosticSignHint = { fg = grey },
    DiagnosticSignInfo = { fg = blue },
    DiagnosticDeprecated = { sp = grey, strikethrough = true, italic = true },

    -- Markdown.
    markdownCode = { fg = green },

    -- TreeSitter.
    ["@property"] = { fg = pink },
    ["@field"] = { fg = blue },
    ["@parameter"] = { fg = fg },
    ["@namespace"] = { fg = cyan },
    ["@variable.builtin"] = { fg = green },
    ["@text.title"] = { fg = indian_red },
    ["@type.qualifier"] = { fg = orange },
    ["@storageclass"] = { fg = orange },
    ["@tag"] = { fg = yellow },
    ["@tag.attribute"] = { fg = cyan },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@variable"] = { fg = yellow },

    -- SemanticToken
    ["@lsp.type.class"] = { fg = yellow },
    ["@lsp.type.decorator"] = { fg = dark_purple },
    ["@lsp.type.enum"] = { fg = purple },
    ["@lsp.type.enumMember"] = { link = "constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { fg = blue },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { fg = orange },
    ["@lsp.type.parameter"] = { fg = line_nr },
    ["@lsp.type.property"] = { fg = pink },
    ["@lsp.type.struct"] = { link = "Structure" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { fg = green },
    ["@lsp.type.variable"] = { link = "Identifier" },

    -- Gitsigns.
    GitSignsAddLn = { fg = green },
    GitSignsDeleteLn = { fg = yellow },
    GitSignsChange = { fg = indian_red },

    -- Telescope.
    TelescopeNormal = { fg = grey, bg = transparent(bg) },
    TelescopeBorder = { fg = grey, bg = transparent(bg) },
    TelescopePrompt = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeBorder" },
    TelescopePromptPrefix = { fg = blue, bg = transparent(bg) },
    TelescopeResultsBorder = { link = "TelescopeBorder" },
    TelescopePreviewBorder = { link = "TelescopeBorder" },
    TelescopeMatching = { fg = indian_red, bg = bg },
    TelescopeSelection = { fg = blue, bg = line },
    TelescopeSelectionCaret = { fg = indian_red, bg = bg },

    -- Cmp.
    CmpItemAbbrDeprecated = { fg = grey, bg = "NONE", strikethrough = true },
    CmpItemAbbrMatch = { fg = blue, bg = "NONE", bold = true },
    CmpItemAbbrMatchFuzzy = { fg = blue, bg = "NONE", bold = true },
    CmpItemMenu = { fg = purple, bg = "NONE", italic = true },

    CmpItemKindField = { fg = bg, bg = indian_red },
    CmpItemKindProperty = { fg = bg, bg = indian_red },
    CmpItemKindEvent = { fg = bg, bg = indian_red },

    CmpItemKindText = { fg = bg, bg = green },
    CmpItemKindEnum = { fg = bg, bg = green },
    CmpItemKindKeyword = { fg = bg, bg = green },

    CmpItemKindConstant = { fg = bg, bg = orange },
    CmpItemKindConstructor = { fg = bg, bg = orange },
    CmpItemKindReference = { fg = bg, bg = orange },

    CmpItemKindFunction = { fg = bg, bg = purple },
    CmpItemKindStruct = { fg = bg, bg = purple },
    CmpItemKindClass = { fg = bg, bg = purple },
    CmpItemKindModule = { fg = bg, bg = purple },
    CmpItemKindOperator = { fg = bg, bg = purple },

    CmpItemKindVariable = { fg = bg, bg = fg },
    CmpItemKindFile = { fg = bg, bg = fg },

    CmpItemKindUnit = { fg = bg, bg = yellow },
    CmpItemKindSnippet = { fg = bg, bg = yellow },
    CmpItemKindFolder = { fg = bg, bg = yellow },

    CmpItemKindMethod = { fg = bg, bg = blue },
    CmpItemKindValue = { fg = bg, bg = blue },
    CmpItemKindEnumMember = { fg = bg, bg = blue },

    CmpItemKindInterface = { fg = bg, bg = cyan },
    CmpItemKindColor = { fg = bg, bg = cyan },
    CmpItemKindTypeParameter = { fg = bg, bg = cyan },

    -- Word under cursor.
    CursorWord = { bg = blue },
    CursorWord0 = { bg = blue },
    CursorWord1 = { bg = blue },

    -- Noice
    NoiceLspProgressTitle = { fg = fg },
    NoiceLspProgressClient = { fg = yellow },
    NoiceMini = { fg = grey, bg = transparent(bg) },

    -- WhichKey.
    WhichKeyFloat = { fg = fg, bg = transparent(bg) },
    WhichKeyBorder = { bg = transparent(bg) },

    -- Indent blankline.
    IndentBlanklineContextChar = { fg = grey },

    -- Neogit.
    NeogitDiffContextHighlight = { bg = line },
    NeogitHunkHeader = { fg = pink },
    NeogitHunkHeaderHighlight = { fg = pink, bg = line },
    NeogitDiffAddHighlight = { fg = line, bg = green },
    NeogitDiffDeleteHighlight = { fg = line, bg = indian_red },
    NeogitDiffAdd = { fg = green, bg = transparent(bg) },
    NeogitDiffDelete = { fg = indian_red, bg = transparent(bg) },
    NeogitDiffContext = { fg = grey, bg = transparent(bg) },
    NeogitDiffHeader = { fg = grey, bg = transparent(bg) },

    -- NeoTree.
    NeoTreeFloatBorder = { bg = bg },
    NeoTreeGitIgnored = { fg = grey, bg = bg },

    -- NvimTree.
    NvimTreeSignColumn = { fg = fg, bg = transparent(bg) },
    NvimTreeNormalFloat = { fg = fg, bg = transparent(bg) },

    -- Hop.
    HopNextKey = { fg = orange, bold = true, underline = true },
    HopNextKey1 = { fg = cyan, bold = true, underline = true },
    HopNextKey2 = { fg = pink },
    HopUnmatched = { fg = grey },

    -- Leap.
    LeapMatch = { fg = bg, bg = purple },
    LeapLabelPrimary = { fg = bg, bg = blue },
    LeapLabelSecondary = { fg = bg, bg = cyan },
    LeapLabelSelected = { fg = bg, bg = pink },

    -- LSP Signature.
    LspSignatureActiveParameter = { italic = true },

    -- Notify.
    NotifyERROR = { fg = yellow },
    NotifyWARN = { fg = orange },
    NotifyINFO = { fg = green },
    NotifyDEBUG = { fg = grey },
    NotifyTRACE = { fg = indian_red },
    NotifyERRORTitle = { fg = red },
    NotifyWARNTitle = { fg = orange },
    NotifyINFOTitle = { fg = green },
    NotifyDEBUGTitle = { fg = green },
    NotifyTRACETitle = { fg = green },

    -- Dap.
    NvimDapVirtualText = { fg = green },

    -- DAP UI.
    DapUIScope = { fg = green },
    DapUIType = { fg = cyan },
    DapUIDecoration = { fg = blue },
    DapUIThread = { fg = green },
    DapUIStoppedThread = { fg = orange },
    DapUISource = { fg = green },
    DapUILineNumber = { fg = grey },
    DapUIFloatBorder = { fg = grey },
    DapUIWatchesEmpty = { fg = orange },
    DapUIWatchesValue = { fg = green },
    DapUIWatchesError = { fg = red },
    DapUIBreakpointsPath = { fg = green },
    DapUIBreakpointsInfo = { fg = grey },
    DapUIBreakpointsCurrentLine = { fg = grey, bg = line, bold = true },

    -- mini.nvim
    MiniIndentscopeSymbol = { fg = blue },

    -- Hydra
    HydraRed = { fg = red },
    HydraBlue = { fg = blue },
    HydraAmaranth = { fg = green },
    HydraTeal = { fg = cyan },
    HydraPink = { fg = pink },
    HydraBorder = { fg = fg, bg = bg },

    -- Dashboard-nvim.
    DashboardHeader = { fg = line_nr },
    DashboardFooter = { fg = grey },

    -- Fidget.nvim
    Fidgettitle = { fg = blue, bg = transparent(bg) },
    Fidgettask = { fg = grey, bg = transparent(bg) },

    -- Visual Multi.
    VM_Extend = { bg = line },
    VM_Cursor = { bg = line, sp = fg, underline = true },
    VM_Insert = { sp = fg, underline = true },
    VM_Mono = { fg = bg, bg = grey },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return M
