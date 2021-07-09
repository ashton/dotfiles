local colors = require 'statusline/themes'.oceanic_next
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local section = gl.section
local fn = vim.fn
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

section.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.bg}
  },
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.blue, i = colors.green,v=colors.orange,
                          [''] = colors.blue,V=colors.orange,
                          c = colors.magenta,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '     '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
section.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

section.left[4] = {
  FileName = {
    -- provider = 'FileName',
    provider = function ()
      return fn.expand("%:F")
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.violet,colors.bg,'bold'}
  }
}

section.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}
section.right[1] = {
  GitIcon = {
    provider = function()
      return '  ' 
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.orange, colors.line_bg}
  }
}

section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.orange, colors.line_bg, "bold"}
  }
}

section.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

section.right[4] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.gray, colors.line_bg}
  }
}

section.right[5] = {
  FileSize = {
    provider = "FileSize",
    separator = " ",
    condition = buffer_not_empty,
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.fg, colors.line_bg}
  }
}

section.right[6] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {colors.red, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}
section.right[7] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {colors.yellow, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[8] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {colors.green, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[9] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {colors.blue, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[10] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
