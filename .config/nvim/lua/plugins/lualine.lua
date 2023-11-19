local colors = require("statusline.themes")
local macro_component = require "statusline.components.macro"
local scrollbar_component = require "statusline.components.scrollbar"
local lsp_server_component = require "statusline.components.lsp"
local lsp_signature_component = require "statusline.components.lsp_signature"
local lsp_breadcrumbs_component = require "statusline.components.breadcrumbs"
local fancy_cwd_component = require "statusline.components.fancy_cwd"

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local mode_color = {
  n = colors.blue,
  i = colors.green,
  v = colors.violet,
  V = colors.violet,
  c = colors.magenta,
  no = colors.cyan,
  s = colors.orange,
  S = colors.orange,
  [''] = colors.orange,
  ic = colors.green,
  R = colors.red,
  Rv = colors.red,
  cv = colors.darkblue,
  ce = colors.darkblue,
  r = colors.magenta,
  rm = colors.magenta,
  ['r?'] = colors.magenta,
  ['!'] = colors.yellow,
  t = colors.yellow,
}

local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    disabled_filetypes = { -- Filetypes to disable lualine for.
      winbar = { "css" },  -- only ignores the ft for winbar.
    },
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
      inactive = { b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
    },
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
    lualine_b = { { 'filetype', colored = true, icon_only = true, icon = { align = 'left' } } },
    lualine_c = { { 'filename' } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  winbar = {
    lualine_a = { lsp_breadcrumbs_component },
    lualine_b = { { lsp_signature_component, icon = { "", color = { fg = colors.blue } } } },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  fancy_cwd_component,
  icon = { " ", color = { fg = "SkyBlue3" } },
  cond = conditions.buffer_not_empty,
}

ins_left { 'location', icon = { "󰍒", color = { fg = "#fc5603" }, align = "left" } }

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  'diagnostics',
  sources = { 'nvim_lsp' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_left {
  lsp_server_component
}

ins_right {
  "branch",
  icon = '',
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right { macro_component }

ins_right {
  scrollbar_component,
  padding = { left = 1 },
}

return config
