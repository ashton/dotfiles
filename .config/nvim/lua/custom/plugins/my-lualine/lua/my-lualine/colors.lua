local M = {}

function M.mode_color(vim_mode)
  local theme = require("my-lualine.theme").get_theme()

  local mode_colors = {
    n = theme.regular.blue,
    i = theme.regular.green,
    v = theme.regular.cyan,
    V = theme.regular.cyan,
    c = theme.regular.magenta,
    no = theme.regular.cyan,
    s = theme.regular.yellow,
    S = theme.regular.yellow,
    [''] = theme.neutrals.ui,
    ic = theme.regular.green,
    R = theme.regular.red,
    Rv = theme.regular.red,
    cv = theme.regular.cyan,
    ce = theme.regular.cyan,
    r = theme.regular.magenta,
    rm = theme.regular.magenta,
    ['r?'] = theme.regular.magenta,
    ['!'] = theme.regular.yellow,
    t = theme.regular.yellow,
  }

  return mode_colors[vim_mode]
end

return M
