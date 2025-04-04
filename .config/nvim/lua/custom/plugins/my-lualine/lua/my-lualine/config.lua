local M = {}

---@class my-lualine.config.MyLualineComponentsOption
---@field left any[]
---@field right any[]
---@field top any[]
---@field title any[]

---@class my-lualine.config.MyLualineOptions
---@field components my-lualine.config.MyLualineComponentsOption

local lualine_default_config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {},
    theme = {},
  },

  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },

  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },

  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  }
}

---@param opts my-lualine.config.MyLualineOptions
function M.setup(opts)
  local theme = require("my-lualine.theme").get_theme()
  local lualine_config = vim.deepcopy(lualine_default_config)
  for _, component in ipairs(opts.components.left) do
    table.insert(lualine_config.sections.lualine_c, component)
  end

  for _, component in ipairs(opts.components.right) do
    table.insert(lualine_config.sections.lualine_x, component)
  end

  for _, component in ipairs(opts.components.top) do
    table.insert(lualine_config.tabline.lualine_c, component)
  end

  for _, component in ipairs(opts.components.title) do
    table.insert(lualine_config.winbar.lualine_c, component)
  end

  lualine_config.options.theme = theme.name

  return lualine_config
end

return M
