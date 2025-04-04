---@class my-theme.providers.ThemeProvider
---@field get_theme fun(): my-theme.Theme

local available_providers = {
  ["melange"] = require("my-theme.providers.melange"),
  ["gruvbox-baby"] = require("my-theme.providers.gruvbox-baby"),
  ["ayu"] = require("my-theme.providers.ayu"),
  ["nordic"] = require("my-theme.providers.nordic"),
}

return {
  ---@return my-theme.providers.ThemeProvider
  get = function(colorscheme)
    return available_providers[colorscheme]
  end
}
