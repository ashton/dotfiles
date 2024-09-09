local gruvbox_baby_colors = require("gruvbox-baby.colors").config()
local ayu_get_color = vim.fn["ayu#get_color"]
local kanagawa_colors = require("kanagawa.colors").setup({theme = "dragon"}).palette
local onenord_colors = require("onenord.colors").load()

local themes = {
  ayu = {
    bg = ayu_get_color("ui_bg"),
    fg = ayu_get_color("ui_fg"),
    yellow = ayu_get_color("syntax_func"),
    cyan = ayu_get_color("syntax_tag"),
    darkblue = ayu_get_color("editor_bg"),
    green = ayu_get_color("vcs_added"),
    orange = ayu_get_color("syntax_keyword"),
    violet = ayu_get_color("syntax_constant"),
    magenta = ayu_get_color("vcs_removed"),
    blue = ayu_get_color("vcs_modified"),
    red = ayu_get_color("common_error"),
  },
  OceanicNext = {
    bg = "#343d46",
    fg = "#cdd3de",
    yellow = "#fac863",
    cyan = "#62b3b2",
    darkblue = "#1b2b34",
    green = "#99c794",
    orange = "#f99157",
    violet = "#c594c5",
    magenta = "#c594c5",
    blue = "#6699cc",
    red = "#ec5f67"
  },
  ["gruvbox-baby"] = {
    bg = gruvbox_baby_colors.background_dark,
    fg = gruvbox_baby_colors.foreground,
    yellow = gruvbox_baby_colors.bright_yellow,
    cyan = gruvbox_baby_colors.dark_gray,
    darkblue = gruvbox_baby_colors.blue_gray,
    green = gruvbox_baby_colors.clean_green,
    orange = gruvbox_baby_colors.orange,
    violet = gruvbox_baby_colors.magenta,
    magenta = gruvbox_baby_colors.pink,
    blue = gruvbox_baby_colors.light_blue,
    red = gruvbox_baby_colors.error_red
  },
  kanagawa = {
    bg = kanagawa_colors.sumilnk0,
    fg = kanagawa_colors.oldWhite,
    yellow = kanagawa_colors.carpYellow,
    cyan = kanagawa_colors.lightBlue,
    darkblue = kanagawa_colors.waveBlue1,
    green = kanagawa_colors.autumnGreen,
    orange = kanagawa_colors.sumiriOrange,
    violet = kanagawa_colors.oniViolet,
    magenta = kanagawa_colors.waveRed,
    blue = kanagawa_colors.crystalBlue,
    red = kanagawa_colors.peachRed
  },
  onenord = {
    bg = onenord_colors.bg,
    fg = onenord_colors.fg,
    yellow = onenord_colors.yellow,
    cyan = onenord_colors.cyan,
    darkblue = onenord_colors.dark_blue,
    green = onenord_colors.green,
    orange = onenord_colors.orange,
    violet = onenord_colors.light_purple,
    magenta = onenord_colors.dark_pink,
    blue = onenord_colors.blue,
    red = onenord_colors.red
  },
  zephyr = {
    bg = "#262a33",
    fg = "#bbc2cf",
    yellow = "#f7bb3b",
    cyan = "#36d0e0",
    darkblue = "#1B2229",
    green = "#afd700",
    orange = "#FF8700",
    violet = "#CBA6F7",
    magenta = "#c678dd",
    blue = "#61afef",
    red = "#e95678"
  }
}

return themes[vim.g.colors_name]
