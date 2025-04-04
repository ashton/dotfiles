---@class my-theme.providers.gruvbox-baby.GruvboxBabyThemeProvider: my-theme.providers.ThemeProvider
local M = {}

---@class GruvboxBabyDiffColors
---@field add string
---@field change string
---@field delete string
---@field text string

---@class GruvboxBabyColors
---@field dark string
---@field background string
---@field background_dark string
---@field background_light string
---@field foreground string
---@field medium_gray string
---@field comment string
---@field gray string
---@field soft_yellow string
---@field bright_yellow string
---@field soft_green string
---@field orange string
---@field red string
---@field error_red string
---@field magenta string
---@field pink string
---@field light_blue string
---@field dark_gray string
---@field blue_gray string
---@field forest_green string
---@field clean_green string
---@field milk string
---@field none string
---@field diff GruvboxBabyDiffColors

---create a my-theme.colors.NeutralColors palette
---@param colors GruvboxBabyColors
---@return my-theme.colors.NeutralColors
local function make_neutral_colors(colors)
  return {
    background = colors.background,
    foreground = colors.foreground,
    ui = colors.medium_gray,
    selection = colors.medium_gray,
    popup = colors.background_dark,
    comment = colors.comment,
    gutter_normal = colors.dark_gray,
    gutter_active = colors.medium_gray,
    panel = {
      background = colors.background,
      shadow = colors.dark,
      border = colors.medium_gray
    }
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors GruvboxBabyColors
---@return my-theme.colors.TermColors
local function make_bright_colors(colors)
  return {
    red = colors.red,
    yellow = colors.bright_yellow,
    green = colors.clean_green,
    cyan = colors.light_blue,
    blue = colors.blue_gray,
    magenta = colors.pink
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors GruvboxBabyColors
---@return my-theme.colors.TermColors
local function make_dark_colors(colors)
  return {
    red = colors.error_red,
    yellow = colors.soft_yellow,
    green = colors.forest_green,
    cyan = colors.light_blue,
    blue = colors.blue_gray,
    magenta = colors.magenta
  }
end

---Creates a my-theme.colors.VCSColors palette
---@param colors GruvboxBabyDiffColors
---@return my-theme.colors.VCSColors
local function make_vcs_colors(colors)
  return {
    added = colors.add,
    changed = colors.change,
    removed = colors.delete
  }
end

---Creates a my-theme.colors.DiagnosticsColors palette
---@param colors GruvboxBabyColors
---@return my-theme.colors.DiagnosticsColors
local function make_diagnostics_colors(colors)
  return {
    info = colors.light_blue,
    hint = colors.dark_gray,
    warning = colors.soft_yellow,
    error = colors.red
  }
end

---@return my-theme.Theme
function M.get_theme()
  local palette = require("gruvbox-baby.colors").config()

  local neutral = make_neutral_colors(palette)
  local bright = make_bright_colors(palette)
  local dark = make_dark_colors(palette)
  local vcs = make_vcs_colors(palette.diff)
  local diagnostics = make_diagnostics_colors(palette)

  return {
    name = "gruvbox-baby",
    neutrals = neutral,
    regular = bright,
    bright = bright,
    dark = dark,
    vcs = vcs,
    diagnostics = diagnostics
  }
end

return M
