local lsp_signature_component = require("lualine.component"):extend()
local colors = require("statusline.themes")

function lsp_signature_component:init(options)
  options.current_arg_icon = options.current_arg_icon or { '', color = { fg = colors.blue } }

  lsp_signature_component.super.init(self, options)
end

function lsp_signature_component:create_option_highlights()
  lsp_signature_component.super.create_option_highlights(self)

  -- setup separator icon highlight
  if type(self.options.current_arg_icon) == 'table' and self.options.current_arg_icon.color then
    self.options.current_arg_icon_color_highlight = self:create_hl(self.options.current_arg_icon.color)
  end
end

function lsp_signature_component:update_status()
  if not pcall(require, "lsp_signature") then
    return ""
  end

  local sig = require("lsp_signature").status_line(100)
  self.current_signature = sig

  local separator_hl
  separator_hl, lsp_signature_component.color_fn_cache = self:format_hl(self.options.current_arg_icon_color_highlight)
  local separator = separator_hl .. self.options.current_arg_icon[1]

  return self:signature(separator)
end

function lsp_signature_component:signature(separator)
  if not self.current_signature then
    return ""
  end

  if self.current_signature.hint == "" then
    return self.current_signature.label
  end

  return self.current_signature.label .. ' ' .. separator .. ' ' .. self.current_signature.hint
end

function lsp_signature_component:apply_highlights(default_highlight)
  local hl_fmt
  local current_arg_icon = self.options.current_arg_icon[1]

  if self.options.color_highlight then
    hl_fmt, lsp_signature_component.color_fn_cache = self:format_hl(self.options.color_highlight)
  end
  local highlight = hl_fmt or default_highlight

  -- adding highlight to the whole status
  self.status = highlight .. self.status

  -- when we create the status the separator icon highlight will also applies to the "hint",
  -- here we fix it applying the default highlight or the custom one after the icon
  self.status = self.status:gsub(current_arg_icon, current_arg_icon .. "%" .. highlight)
end

return lsp_signature_component
