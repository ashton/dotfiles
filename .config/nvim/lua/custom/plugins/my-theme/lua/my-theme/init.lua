---@class my-theme.Theme
---@field name string theme name, the colorscheme being used
---@field neutrals my-theme.colors.NeutralColors
---@field regular my-theme.colors.TermColors regular colors
---@field bright my-theme.colors.TermColors bright colors
---@field dark my-theme.colors.TermColors dark colors
---@field vcs my-theme.colors.VCSColors
---@field diagnostics my-theme.colors.DiagnosticsColors

local M = {}

---@return my-theme.Theme
function M.get_theme()
  local colorscheme = vim.g.colors_name
  local provider_factory = require("my-theme.providers")
  local theme_provider = provider_factory.get(colorscheme)

  return theme_provider.get_theme()
end

return M
