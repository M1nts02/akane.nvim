local M = {}

M.set_terminal_hl = function(palette)
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

return M
