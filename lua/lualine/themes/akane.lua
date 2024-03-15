local palette = require("akane.palette")["light"]

if vim.api.nvim_get_hl(0, { name = "Normal", id = 0 }).bg == nil then
  palette.bg = "None"
else
  palette.bg = vim.o.background == "light" and "#fafafa" or "#1E1E2E"
end

return {
  normal = {
    a = { bg = palette.bg, fg = palette.blue, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
  insert = {
    a = { bg = palette.bg, fg = palette.green, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
  replace = {
    a = { bg = palette.bg, fg = palette.orange, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
  visual = {
    a = { bg = palette.bg, fg = palette.pink, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
  command = {
    a = { bg = palette.bg, fg = palette.purple, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
  terminal = {
    a = { bg = palette.bg, fg = palette.purple, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
  inactive = {
    a = { bg = palette.bg, fg = palette.blue, gui = "bold" },
    b = { bg = palette.bg, fg = palette.cyan },
    c = { bg = palette.bg, fg = palette.green },
  },
}
