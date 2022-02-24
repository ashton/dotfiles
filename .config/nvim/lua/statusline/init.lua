local colors = require "statusline/themes".oceanic_next

local vim = vim
local galaxy = require "galaxyline"
local condition = require "galaxyline/condition"
local vcs = require "galaxyline.providers.vcs"
local file_info = require "galaxyline.providers.fileinfo"
local section = galaxy.section
local utils = require "statusline/utils"

galaxy.short_line_list = {"NvimTree", "packager", "vista"}

-- Colors
-- local colors = {
--   bg = '#282a36',
--   fg = '#f8f8f2',
--   section_bg = '#38393f',
--   yellow = '#f1fa8c',
--   cyan = '#8be9fd',
--   green = '#50fa7b',
--   orange = '#ffb86c',
--   magenta = '#ff79c6',
--   blue = '#8be9fd',
--   red = '#ff5555'
-- }

local in_git_repo = function()
  local branch_name = vcs.get_git_branch()

  return branch_name ~= nil
end

local checkwidth = function()
  return condition.hide_in_width() and in_git_repo()
end

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [""] = colors.magenta,
    v = colors.magenta,
    R = colors.red
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

local section_bg_colors = {
  lsp_module_bg = colors.section_bg
}

-- Left side
section.left[1] = {
  FirstElement = {
    provider = function()
      return " "
    end,
    highlight = {colors.cyan, colors.bg}
  }
}

section.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        R = "REPLACE"
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return "  " .. alias_mode .. " "
    end,
    highlight = {colors.bg, colors.bg},
    separator = " ",
    separator_highlight = {colors.bg, colors.section_bg}
  }
}

section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {file_info.get_file_icon_color, colors.section_bg}
  }
}

section.left[4] = {
  FileName = {
    -- provider = 'FileName',
    provider = function()
      return vim.fn.expand("%:F") .. " "
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

section.left[5] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = in_git_repo,
    highlight = {colors.red, colors.bg}
  }
}

section.left[6] = {
  GitBranch = {
    provider = function()
      return vcs.get_git_branch() .. " "
    end,
    condition = in_git_repo,
    highlight = {colors.fg, colors.bg}
  }
}

section.left[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    icon = " ",
    highlight = {colors.green, colors.bg}
  }
}

section.left[8] = {
  DiffModified = {
    provider = "DiffModified",
    icon = " ",
    highlight = {colors.orange, colors.bg}
  }
}

section.left[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    icon = " ",
    highlight = {colors.red, colors.bg}
  }
}

section.left[10] = {
  LeftEnd = {
    provider = function()
      return " "
    end,
    condition = in_git_repo,
    highlight = {colors.section_bg, colors.bg}
  }
}

section.mid[1] = {
  LspTitle = {
    provider = function()
      return " LSP: "
    end,
    highlight = {colors.fg, section_bg_colors.lsp_module_bg, "bold"}
  }
}

section.mid[2] = {
  LspClient = {
    provider = function()
      vim.api.nvim_command("hi StatusLine guifg=" .. colors.section_bg)
      return require "galaxyline.providers.lsp".get_lsp_client()
    end,
    condition = function()
      local ftypes_to_hide = {["dashboard"] = true, [""] = true}

      return not ftypes_to_hide[vim.bo.filetype]
    end,
    separator_highlight = {nil, colors.section_bg},
    highlight = {file_info.get_file_icon_color, colors.section_bg}
  }
}

section.mid[3] = {
  Space = {
    provider = function()
      return " "
    end,
    highlight = {colors.fg, section_bg_colors.lsp_module_bg}
  }
}

section.mid[4] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, section_bg_colors.lsp_module_bg}
  }
}

section.mid[5] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.orange, section_bg_colors.lsp_module_bg}
  }
}

section.mid[6] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = {colors.cyan, section_bg_colors.lsp_module_bg}
  }
}

-- Right side
section.right[1] = {
  FileFormat = {
    provider = function()
      return utils.get_file_format_icon(string.lower(file_info.get_file_format()))
    end,
    condition = condition.buffer_not_empty,
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

section.right[2] = {
  FileEncoding = {
    provider = function()
      return file_info.get_file_encode()
    end,
    condition = condition.buffer_not_empty,
    separator = " | ",
    separator_highlight = {colors.fg, colors.bg}
  }
}

section.right[3] = {
  LineInfo = {
    provider = "LineColumn",
    highlight = {colors.fg, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

section.right[4] = {
  Heart = {
    provider = function()
      return "ﬦ "
    end,
    highlight = {colors.yellow, colors.section_bg},
    separator = " | ",
    separator_highlight = {colors.bg, colors.section_bg}
  }
}

-- Short status line
section.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    highlight = {colors.fg, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {colors.yellow, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

-- Force manual load so that nvim boots with a status line
galaxy.load_galaxyline()
