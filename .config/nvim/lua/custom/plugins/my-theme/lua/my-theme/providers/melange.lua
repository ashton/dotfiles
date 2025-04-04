---@class my-theme.providers.melange.MelangeThemeProvider: my-theme.providers.ThemeProvider
local M = {}

---@class MelangeGrays
---@field bg string bg color
---@field fg string fg color
---@field ui string ui color
---@field sel string selection color
---@field com string comments color
---@field float string floating windows color

---@class MelangeColors
---@field red string
---@field yellow string
---@field green string
---@field cyan string
---@field blue string
---@field magenta string

---create a my-theme.colors.NeutralColors palette
---@param grays_palette MelangeGrays
---@return my-theme.colors.NeutralColors
local function make_neutral_colors(grays_palette)
  return {
    background = grays_palette.bg,
    foreground = grays_palette.fg,
    ui = grays_palette.ui,
    selection = grays_palette.sel,
    popup = grays_palette.float,
    comment = grays_palette.com,
    gutter_normal = grays_palette.bg,
    gutter_active = grays_palette.ui,
    panel = {
      background = grays_palette.bg,
      shadow = grays_palette.bg,
      border = grays_palette.ui
    }
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors MelangeColors
---@return my-theme.colors.TermColors
local function make_term_colors(colors)
  return {
    red = colors.red,
    yellow = colors.yellow,
    green = colors.green,
    cyan = colors.cyan,
    blue = colors.blue,
    magenta = colors.magenta
  }
end

---Creates a my-theme.colors.VCSColors palette
---@param colors MelangeColors
---@return my-theme.colors.VCSColors
local function make_vcs_colors(colors)
  return {
    added = colors.green,
    changed = colors.magenta,
    removed = colors.red
  }
end

---Creates a my-theme.colors.DiagnosticsColors palette
---@param colors MelangeColors
---@return my-theme.colors.DiagnosticsColors
local function make_diagnostics_colors(colors)
  return {
    info = colors.blue,
    hint = colors.cyan,
    warning = colors.yellow,
    error = colors.red
  }
end

---@return my-theme.Theme
function M.get_theme()
  local bg = vim.opt.background:get()
  local palette = require("melange.palettes." .. bg)

  local grays_palette = palette.a
  local bright_palette = palette.b
  local normal_palette = palette.c
  local dark_palette = palette.d

  local neutral = make_neutral_colors(grays_palette)
  local bright = make_term_colors(bright_palette)
  local dark = make_term_colors(dark_palette)
  local regular = make_term_colors(normal_palette)
  local vcs = make_vcs_colors(normal_palette)
  local diagnostics = make_diagnostics_colors(bright_palette)

  return {
    name = "melange",
    neutrals = neutral,
    regular = regular,
    bright = bright,
    dark = dark,
    vcs = vcs,
    diagnostics = diagnostics
  }
end

return M
