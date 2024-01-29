local M = {}
local palette = {}
local options = {}

M.load = function(theme)
  vim.api.nvim_command "hi clear"
  if vim.fn.exists "syntax_on" then
    vim.api.nvim_command "syntax reset"
  end

  vim.g.VM_theme_set_by_colorscheme = true
  vim.o.termguicolors = true
  vim.g.colors_name = "akane"

  palette = require("akane.palette")[theme]
  palette.transparent = options.transparent

  require("akane.terminal").set_terminal_hl(palette)
  require("akane.groups").set_groups_hl(palette)
end

M.setup = function(opts)
  vim.validate { option = { opts, "t" } }
  options.transparent = opts.transparent or false
end

return M
