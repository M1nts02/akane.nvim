local M = {}

M.set_groups_hl = function(palette)
  local bg = palette.bg
  local bg1 = palette.bg1
  local bg2 = palette.bg2
  local fg = palette.fg
  local fg1 = palette.fg1
  local fg2 = palette.fg2
  local fg3 = palette.fg3
  local cyan = palette.cyan
  local blue = palette.blue
  local green = palette.green
  local orange = palette.orange
  local yellow = palette.yellow
  local purple = palette.purple
  local indian_red = palette.indian_red
  local red = palette.red
  local pink = palette.pink

  local transparent = function(bg)
    return palette.transparent == true and "NONE" or bg
  end

  local groups = {
    -- Base.
    Normal = { fg = fg, bg = transparent(bg) },
    NormalNC = { fg = fg, bg = transparent(bg) },
    NormalSB = { fg = fg, bg = bg2 },
    NormalFloat = { bg = transparent(bg1) },
    FloatBorder = { fg = blue, bg = transparent(bg) },
    FloatTitle = { fg = fg1, bg = transparent(bg) },

    Pmenu = { fg = fg1, bg = bg1 },
    PmenuSel = { fg = fg, bg = bg2 },
    PmenuSbar = { fg = fg, bg = bg2 },
    PmenuThumb = { fg = fg1, bg = transparent(bg1) },

    Question = { fg = blue },
    QuickFixLine = { fg = fg1, bold = true },

    Search = { fg = bg2, bg = blue },
    IncSearch = { fg = bg, bg = blue },
    CurSearch = { fg = bg2, bg = pink },

    SpecialKey = { fg = fg2 },
    SnippetTabstop = { bg = bg2 },
    SpellBad = { sp = red, undercurl = true },
    SpellCap = { sp = yellow, undercurl = true },
    SpellLocal = { sp = blue, undercurl = true },
    SpellRare = { sp = green, undercurl = true },

    StatusLine = { fg = fg, bg = transparent(bg1) },
    StatusLineNC = { fg = fg2, bg = transparent(bg1) },
    TabLine = { fg = fg2, bg = transparent(bg1) },
    TabLineFill = {},
    TabLineSel = { fg = green, bg = transparent(bg2) },

    Title = { fg = blue, bold = true },
    Visual = { fg = bg, bg = pink },
    VisualNOS = { fg = bg, bg = pink, bold = true },

    WarningMsg = { fg = yellow },
    Whitespace = { fg = fg3, bg = transparent(bg) },
    WildMenu = { fg = fg, bg = transparent(bg1) },

    WinBar = { fg = orange },
    WinBarNC = { fg = orange },
    WinSeparator = { fg = fg3 },

    ColorColumn = { bg = bg1 },
    Conceal = { fg = fg1 },
    Cursor = { fg = bg1, bg = fg },
    lCursor = { fg = bg, bg = fg },
    CursorIM = { fg = bg, bg = fg },
    CursorColumn = { bg = bg1 },
    CursorLine = { bg = bg1 },

    Directory = { fg = blue },
    EndOfBuffer = { fg = fg },
    ErrorMsg = { fg = red, bold = true, italic = true },
    VertSplit = { fg = blue, bg = transparent(bg) },

    Folded = { fg = blue, bg = transparent(bg1) },
    FoldColumn = { fg = fg2, bg = transparent(bg1) },

    SignColumn = { fg = fg1, bg = transparent(bg) },
    SignColumnSB = { fg = bg2, bg = bg2 },
    Substitute = { fg = pink, bg = fg3 },

    LineNr = { fg = cyan, bg = transparent(bg) },
    CursorLineNr = { fg = blue, bg = bg2 },

    MatchParen = { fg = orange, bg = bg2, bold = true },
    ModeMsg = { fg = fg },
    MsgSeparator = {},
    MoreMsg = { fg = blue },
    NonText = { fg = fg2 },

    Comment = { fg = fg1, italic = true },
    SpecialComment = { fg = pink },
    Constant = { fg = orange },
    String = { fg = green },
    Character = { fg = cyan },
    Number = { fg = orange },

    Float = { fg = orange },
    Boolean = { fg = orange },
    Identifier = { fg = indian_red },
    Function = { fg = blue },
    Statement = { fg = purple },
    Conditional = { fg = purple },
    Repeat = { fg = purple },
    Label = { fg = cyan },
    Operator = { fg = blue },
    Keyword = { fg = purple },
    Exception = { fg = purple, italic = true },
    PreProc = { fg = pink },
    Include = { fg = purple },
    Define = { fg = pink },
    Macro = { fg = purple },
    PreCondit = { fg = pink },
    StorageClass = { fg = yellow },
    Structure = { fg = yellow },
    Special = { fg = pink },
    Type = { fg = yellow },
    TypeDef = { fg = yellow },
    SpecialChar = { fg = pink },
    Tag = { fg = blue, bold = true },
    Delimiter = { fg = fg2 },
    Debug = { fg = pink },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = {},
    Error = { fg = red },

    qfLineNr = { fg = yellow },
    qfFileName = { fg = blue },

    htmlH1 = { fg = pink, bold = true },
    htmlH2 = { fg = blue, bold = true },

    mkdCodeDelimiter = { fg = fg, bg = bg },
    mkdCodeStart = { fg = indian_red, bold = true },
    mkdCodeEnd = { fg = indian_red, bold = true },
    mkdLink = { fg = blue, underline = true },

    debugPC = { bg = bg2 },
    debugBreakpoint = { fg = fg2, bg = bg },

    illuminatedWord = { bg = fg3 },
    illuminatedCurWord = { bg = fg3 },

    diffAdded = { fg = green },
    diffRemoved = { fg = red },
    diffanged = { fg = blue },
    diffOldFile = { fg = yellow },
    diffNewFile = { fg = orange },
    diffFile = { fg = blue },
    diffLine = { fg = fg2 },
    diffIndexLine = { fg = cyan },
    DiffAdd = { fg = bg, bg = green },
    DiffChange = { fg = bg, bg = blue },
    DiffDelete = { fg = bg, bg = red },
    DiffText = { fg = bg, bg = blue },

    healthError = { fg = red },
    healthSuccess = { fg = cyan },
    healthWarning = { fg = yellow },

    GlyphPalette1 = { fg = red },
    GlyphPalette2 = { fg = cyan },
    GlyphPalette3 = { fg = yellow },
    GlyphPalette4 = { fg = blue },
    GlyphPalette6 = { fg = cyan },
    GlyphPalette7 = { fg = fg },
    GlyphPalette9 = { fg = red },

    rainbow1 = { fg = red },
    rainbow2 = { fg = orange },
    rainbow3 = { fg = yellow },
    rainbow4 = { fg = green },
    rainbow5 = { fg = blue },
    rainbow6 = { fg = cyan },

    -- LSP.
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = yellow },
    DiagnosticHint = { fg = fg1 },
    DiagnosticInfo = { fg = blue },
    DiagnosticVirtualTextError = { fg = red },
    DiagnosticVirtualTextWarn = { fg = yellow },
    DiagnosticVirtualTextHint = { fg = fg1 },
    DiagnosticVirtualTextInfo = { fg = blue },
    DiagnosticUnderlineError = { sp = red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = yellow, undercurl = true },
    DiagnosticUnderlineHint = { sp = fg1, undercurl = true, italic = true },
    DiagnosticUnderlineInfo = { sp = blue, undercurl = true, italic = true },
    DiagnosticSignError = { fg = red },
    DiagnosticSignWarn = { fg = yellow },
    DiagnosticSignHint = { fg = fg1 },
    DiagnosticSignInfo = { fg = blue },
    DiagnosticDeprecated = { sp = fg1, strikethrough = true, italic = true },

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
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = indian_red },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "@error" },
    ["@lsp.type.variable"] = {},
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return M
