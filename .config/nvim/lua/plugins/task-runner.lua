return {
  {
    'stevearc/overseer.nvim',
    lazy = true,
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearCache",
    },
    opts = {
      template_dirs = { "overseer.template", "tasks.definitions" },
      templates = { "builtin" },
      dap = true
    },
  }
}
