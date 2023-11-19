local macro_component = require("lualine.component"):extend()
local colors = require("statusline.themes")


function macro_component:init(options)
  options.symbols = options.symbols or {recording = {"󰑋", color = {fg = colors.red}}, recorded = {"󰑊", color = { fg = colors.green }}}
  options.color = options.color or {fg = "#707a8c"}
  options.cond = options.cond or (function() return (vim.fn.reg_recording() ~= "" or vim.fn.reg_recorded() ~= "") end)

  macro_component.super.init(self, options)
end

function macro_component:create_option_highlights()
  if self.options.color then
    self.options.color_highlight = self:create_hl(self.options.color)
  end

  -- setup icon highlight
  if type(self.options.symbols.recording) == 'table' and self.options.symbols.recording.color then
    self.options.recording_icon_color_highlight = self:create_hl(self.options.symbols.recording.color)
  end

  if type(self.options.symbols.recorded) == 'table' and self.options.symbols.recorded.color then
    self.options.recorded_icon_color_highlight = self:create_hl(self.options.symbols.recorded.color)
  end
end

function macro_component:update_status()
  self.rec_status = vim.fn.reg_recording() ~= "" and "recording" or "recorded"
  local register = vim.fn.reg_recording() ~= "" and vim.fn.reg_recording() or vim.fn.reg_recorded()
  return "on " .. register
end

function macro_component:apply_icon()
  if self.rec_status == "recording" then
    self.options.icon = self.options.symbols.recording
    self.options.icon_color_highlight = self.options.recording_icon_color_highlight
  else
    self.options.icon = self.options.symbols.recorded
    self.options.icon_color_highlight = self.options.recorded_icon_color_highlight
  end

  return macro_component.super.apply_icon(self)
end

return macro_component
