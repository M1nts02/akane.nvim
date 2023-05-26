local M = {}

M.set_groups_hl = function (groups)
  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

M.set_terminal_hl = function (color)
  vim.g.terminal_color_0 = color[1]
  vim.g.terminal_color_1 = color[2]
  vim.g.terminal_color_2 = color[3]
  vim.g.terminal_color_3 = color[4]
  vim.g.terminal_color_4 = color[5]
  vim.g.terminal_color_5 = color[6]
  vim.g.terminal_color_6 = color[7]
  vim.g.terminal_color_7 = color[8]
  vim.g.terminal_color_8 = color[9]
  vim.g.terminal_color_9 = color[10]
  vim.g.terminal_color_10 = color[11]
  vim.g.terminal_color_11 = color[12]
  vim.g.terminal_color_12 = color[13]
  vim.g.terminal_color_13 = color[14]
  vim.g.terminal_color_14 = color[15]
  vim.g.terminal_color_15 = color[16]
  vim.g.terminal_color_background = color["bg"]
  vim.g.terminal_color_foreground = color["fg"]
end

return M
