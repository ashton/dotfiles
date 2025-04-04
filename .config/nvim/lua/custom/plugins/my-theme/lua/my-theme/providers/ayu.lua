---@class my-theme.providers.ayu.AyuThemeProvider: my-theme.providers.ThemeProvider
local M = {}

---@class AyuColors
---@field accent string
---@field bg string
---@field fg string
---@field ui string
---@field tag string
---@field func string
---@field entity string
---@field string string
---@field regexp string
---@field markup string
---@field keyword string
---@field special string
---@field comment string
---@field constant string
---@field operator string
---@field error string
---@field lsp_parameter string
---@field line string
---@field panel_bg string
---@field panel_shadow string
---@field panel_border string
---@field gutter_normal string
---@field gutter_active string
---@field selection_bg string
---@field selection_fg string
---@field selection_inactive string
---@field selection_border string
---@field guide_active string
---@field guide_normal string
---@field vcs_added string
---@field vcs_modified string
---@field vcs_removed string
---@field vcs_added_bg string
---@field vcs_removed_bg string
---@field fg_idle string
---@field warning string

---create a my-theme.colors.NeutralColors palette
---@param colors AyuColors
---@return my-theme.colors.NeutralColors
local function make_neutral_colors(colors)
  return {
    background = colors.bg,
    foreground = colors.fg,
    ui = colors.ui,
    selection = colors.selection_bg,
    popup = colors.panel_bg,
    comment = colors.comment,
    gutter_normal = colors.gutter_normal,
    gutter_active = colors.gutter_active,
    panel = {
      background = colors.panel_bg,
      shadow = colors.panel_shadow,
      border = colors.panel_border
    }
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors AyuColors
---@return my-theme.colors.TermColors
local function make_bright_colors(colors)
  return {
    red = colors.error,
    yellow = colors.accent,
    green = colors.string,
    cyan = colors.regexp,
    blue = colors.tag,
    magenta = colors.constant
  }
end

---Creates a my-theme.colors.TermColors palette
---@param colors AyuColors
---@return my-theme.colors.TermColors
local function make_dark_colors(colors)
  return {
    red = colors.markup,
    yellow = colors.accent,
    green = colors.string,
    cyan = colors.regexp,
    blue = colors.tag,
    magenta = colors.constant
  }
end

---Creates a my-theme.colors.VCSColors palette
---@param colors AyuColors
---@return my-theme.colors.VCSColors
local function make_vcs_colors(colors)
  return {
    added = colors.vcs_added,
    changed = colors.vcs_modified,
    removed = colors.vcs_removed
  }
end

---Creates a my-theme.colors.DiagnosticsColors palette
---@param colors AyuColors
---@return my-theme.colors.DiagnosticsColors
local function make_diagnostics_colors(colors)
  return {
    info = colors.tag,
    hint = colors.regexp,
    warning = colors.keyword,
    error = colors.error
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
    name = "ayu",
    neutrals = neutral,
    regular = bright,
    bright = bright,
    dark = dark,
    vcs = vcs,
    diagnostics = diagnostics
  }
end

return M
