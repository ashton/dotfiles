local M = require("lualine.component"):extend()

local function is_new_file()
  local filename = vim.fn.expand('%')
  return filename ~= '' and vim.bo.buftype == '' and vim.fn.filereadable(filename) == 0
end

function M:init(options)
  M.super.init(self, options)

  self.options.icons_enabled = true
  self.options.default_icons = {
    new_file = " ",
    modified = " 󰷫",
    readonly = " 󰌾"
  }
end

function M:update_status()
  local result = vim.fn.expand("%:~:h")
  local home = os.getenv("HOME")

  if home and vim.startswith(result, home) then
    result = "~" .. result:sub(home:len() + 1)
  end

  if is_new_file() then
    self.status = "new_file"
  elseif vim.bo.modified then
    self.status = "modified"
  elseif vim.bo.readonly then
    self.status = "readonly"
  end

  return result
end

function M:apply_icon()
  self.options.icon = self.options.default_icons[self.status]
  M.super.apply_icon(self)
end

return M
