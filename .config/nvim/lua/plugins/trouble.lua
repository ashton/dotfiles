vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      scope = 'line',
    }
    vim.diagnostic.open_float(opts)
  end
})

return {
  config = function()
    return {
      signs = {
        -- icons / text used for a diagnostic
        error = "󰅙",
        warning = "",
        hint = "󱌹",
        information = "󰋼",
        other = "󰒔"
      },
      action_keys = {
        jump = { "<tab>", "<2-leftmouse>" },
        jump_close = { "<cr>" },
        switch_severity = {},
        open_split = "s",
        open_vsplit = "v"
      }
    }
  end
}
