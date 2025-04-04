local theme = require("my-theme").get_theme()

local M = {}

function M.initial_separator()
  local colors = require("my-lualine.colors")

  return {
    function()
      return " "
    end,
    color = function()
      -- auto change color according to neovims mode
      return { fg = colors.mode_color(vim.fn.mode()) }
    end,
    padding = { left = 0, right = 1 }, -- We don't need space before this

  }
end

function M.devil_logo()
  return {
    function()
      return "󰀵"
    end,
    color = function()
      local colors = require("my-lualine.colors")

      -- auto change color according to neovims mode
      return { fg = colors.mode_color(vim.fn.mode()) }
    end,
    padding = { left = 0, right = 1 }, -- We don't need space before this

  }
end

function M.mode_symbol()
  return {
    function()
      local mode = vim.api.nvim_get_mode()["mode"]
      local symbol = ""

      if vim.startswith(mode, "n") then
        -- symbol = "󰫻"
        symbol = "󰬕"
      elseif vim.startswith(mode, "i") then
        -- symbol = "󰫶"
        symbol = "󰬐"
      elseif vim.startswith(mode, "v") or vim.startswith(mode, "V") or vim.startswith(mode, "CTRL-V") then
        -- symbol = "󰬃"
        symbol = "󰬝"
      elseif vim.startswith(mode, "s") or vim.startswith(mode, "S") or vim.startswith(mode, "CTRL-Vs") then
        -- symbol = "󰬀"
        symbol = "󰬚"
      elseif vim.startswith(mode, "R") then
        -- symbol = "󰫿"
        symbol = "󰬙"
      elseif vim.startswith(mode, "c") then
        -- symbol = "󰫰"
        symbol = "󰬊"
      end
      return symbol
    end,
    color = function()
      local colors = require("my-lualine.colors")

      -- auto change color according to neovims mode
      return { fg = colors.mode_color(vim.fn.mode()) }
    end,
  }
end

function M.location()
  return { 'location', icon = { "󰍒", color = { fg = theme.regular.red }, align = "left" } }
end

function M.mid_section()
  return function()
    return '%='
  end
end

function M.lsp_diagnostics()
  return {
    'diagnostics',
    sources = { 'nvim_lsp' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = theme.diagnostics.error },
      color_warn = { fg = theme.diagnostics.warning },
      color_info = { fg = theme.diagnostics.info },
    },
  }
end

function M.git_branch()
  return {
    "branch",
    icon = { '', color = { fg = theme.regular.red } },
  }
end

function M.git_diff()
  return {
    'diff',
    symbols = { added = ' ', modified = ' ', removed = ' ' },
    diff_color = {
      added = { fg = theme.regular.green },
      modified = { fg = theme.regular.yellow },
      removed = { fg = theme.regular.red },
    },
  }
end

function M.signature_helper()
  return function()
    if not pcall(require, 'lsp_signature') then return "" end
    local text = ""

    local signature = require("lsp_signature").status_line(100)

    if signature.hint ~= "" then
      text =  "󱃹 " .. signature.hint
    end

    return text
  end
end

return M
