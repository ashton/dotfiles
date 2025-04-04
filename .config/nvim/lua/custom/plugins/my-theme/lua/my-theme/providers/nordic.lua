---@class my-theme.providers.nordic.NordicThemeProvider: my-theme.providers.ThemeProvider
local M = {}

---@class NordicDiffColors
---@field change0 string
---@field change1 string
---@field add string
---@field delete string

---@class NordicGitColors
---@field add string
---@field delete string
---@field change string

---@class NordicTermColors
---@field base string
---@field bright string
---@field dim string

---@class NordicColors
---@field white0 string
---@field gray0 string
---@field gray1 string
---@field gray2 string
---@field gray3 string
---@field gray4 string
---@field gray5 string
---@field bg string
---@field bg_dark string
---@field bg_sidebar string
---@field bg_statusline string
---@field bg_fold string
---@field border_bg string
---@field border_fg string
---@field fg string
---@field fg_bright string
---@field fg_dark string
---@field fg_sidebar string
---@field fg_fold string
---@field fg_selected string
---@field bg_float string
---@field fg_float string
---@field fg_float_border string
---@field bg_float_border string
---@field bg_popup string
---@field fg_popup string
---@field bg_selected string
---@field bg_popup_border string
---@field fg_popup_border string
---@field diff NordicDiffColors
---@field git NordicGitColors
---@field error string
---@field warning string
---@field hint string
---@field info string
---@field comment string
---@field red NordicTermColors
---@field orange NordicTermColors
---@field yellow NordicTermColors
---@field green NordicTermColors
---@field magenta NordicTermColors
---@field cyan NordicTermColors
---@field blue0 string
---@field blue1 string
---@field blue2 string

---create a my-theme.colors.NeutralColors palette
---@param colors NordicColors
---@return my-theme.colors.NeutralColors
local function make_neutral_colors(colors)
  return {
    background = colors.bg,
    foreground = colors.fg,
    ui = colors.bg_float,
    selection = colors.bg_selected,
    popup = colors.bg_popup,
    comment = colors.comment,
    gutter_normal = colors.gray2,
    gutter_active = colors.gray3,
    panel = {
      background = colors.bg_sidebar,
      shadow = colors.bg_dark,
      border = colors.border_bg
    }
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors NordicColors
---@return my-theme.colors.TermColors
local function make_bright_colors(colors)
  return {
    red = colors.red.bright,
    yellow = colors.yellow.bright,
    green = colors.green.bright,
    cyan = colors.cyan.bright,
    blue = colors.blue2,
    magenta = colors.magenta.bright
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors NordicColors
---@return my-theme.colors.TermColors
local function make_regular_colors(colors)
  return {
    red = colors.red.base,
    yellow = colors.yellow.base,
    green = colors.green.base,
    cyan = colors.cyan.base,
    blue = colors.blue1,
    magenta = colors.magenta.base
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors NordicColors
---@return my-theme.colors.TermColors
local function make_dark_colors(colors)
  return {
    red = colors.red.dim,
    yellow = colors.yellow.dim,
    green = colors.green.dim,
    cyan = colors.cyan.dim,
    blue = colors.blue0,
    magenta = colors.magenta.dim
  }
end

---Creates a my-theme.colors.VCSColors palette
---@param colors NordicColors
---@return my-theme.colors.VCSColors
local function make_vcs_colors(colors)
  return {
    added = colors.add,
    changed = colors.change,
    removed = colors.delete
  }
end

---Creates a my-theme.colors.DiagnosticsColors palette
---@param colors NordicColors
---@return my-theme.colors.DiagnosticsColors
local function make_diagnostics_colors(colors)
  return {
    info = colors.info,
    hint = colors.hint,
    warning = colors.warning,
    error = colors.error
  }
end

---@return my-theme.Theme
function M.get_theme()
  local palette = require("nordic.colors")

  local neutral = make_neutral_colors(palette)
  local bright = make_bright_colors(palette)
  local regular = make_regular_colors(palette)
  local dark = make_dark_colors(palette)
  local vcs = make_vcs_colors(palette.git)
  local diagnostics = make_diagnostics_colors(palette)

  return {
    name = "nordic",
    neutrals = neutral,
    regular = regular,
    bright = bright,
    dark = dark,
    vcs = vcs,
    diagnostics = diagnostics
  }
end

return M
