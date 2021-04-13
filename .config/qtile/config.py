# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import re
import socket
import subprocess

from typing import List  # noqa: F401

from libqtile import layout, bar, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]

groups = [Group(i) for i in ["DEV", "WWW", "CHAT", "MISC"]]

for idx, group in enumerate(groups, start=1):
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(idx), lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], str(idx), lazy.window.togroup(group.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(group.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
                   "border_width": 2,
                   "margin": 4,
                   "border_focus": "5e81ac",
                   "border_normal": "4c566a"
               }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Columns(**layout_theme),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
colors = [["#282c34", "#282c34"], # panel background
                    ["#434c5e", "#4c566a"], # background for current screen tab
                    ["#e5e9f0", "#e5e9f0"], # font color for group names
                    ["#ff5555", "#ff5555"], # border line color for current tab
                    ["#88c0d0", "#88c0d0"], # border line color for 'other tabs' and color for 'odd widgets'
                    ["#5e81ac", "#5e81ac"], # color for the 'even widgets'
                    ["#81a1c1", "#81a1c1"], # window name
         ] # background for inactive screens


##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
        font="Ubuntu Mono",
        fontsize = 12,
        padding = 2,
        background=colors[0]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[2],
        ),
        widget.Image(
            filename = "~/.config/qtile/icons/lambda.png",
            scale = "False",
        ),
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[2],
        ),
        widget.GroupBox(
            font = "Ubuntu Bold",
            fontsize = 9,
            margin_y = 3,
            margin_x = 0,
            padding_y = 5,
            padding_x = 3,
            borderwidth = 3,
            active = colors[6],
            inactive = colors[2],
            rounded = False,
            highlight_color = colors[1],
            highlight_method = "line",
            this_current_screen_border = colors[6],
            this_screen_border = colors [4],
            other_current_screen_border = colors[6],
            other_screen_border = colors[4],
            foreground = colors[2],
        ),
        widget.Prompt(
            prompt = prompt,
            font = "Ubuntu Mono",
            padding = 10,
            foreground = colors[4],
        ),
        widget.Sep(
            linewidth = 0,
            padding = 40,
            foreground = colors[2],
        ),
        widget.WindowName(
            foreground = colors[6],
            background = colors[0],
        ),
        widget.Systray(
            background = colors[0],
        ),
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[0],
        ),
        widget.TextBox(
            text = '',
            background = colors[0],
            foreground = colors[5],
            padding = 0,
            fontsize = 37
        ),
        widget.Net(
            interface = "eno1",
            format = '{down} ↓↑ {up}',
            foreground = colors[2],
            background = colors[5],
        ),
        widget.TextBox(
            text = '',
            background = colors[5],
            foreground = colors[4],
            padding = 0,
            fontsize = 37
        ),
        widget.TextBox(
            text = " ⟳",
            padding = 2,
            foreground = colors[2],
            background = colors[4],
            fontsize = 14
        ),
        widget.CheckUpdates(
            update_interval = 1800,
            distro = "Arch_checkupdates",
            display_format = "{updates} Updates",
            foreground = colors[2],
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
            background = colors[4]
        ),
        widget.TextBox(
            text = '',
            background = colors[4],
            foreground = colors[5],
            padding = 0,
            fontsize = 37
        ),
        widget.TextBox(
            text = " 🖬",
            foreground = colors[2],
            background = colors[5],
            padding = 0,
            fontsize = 14
        ),
        widget.Memory(
            foreground = colors[2],
            background = colors[5],
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
            padding = 5
        ),
        widget.TextBox(
            text='',
            background = colors[5],
            foreground = colors[4],
            padding = 0,
            fontsize = 37
        ),
        widget.TextBox(
            text = " ₿",
            padding = 0,
            foreground = colors[2],
            background = colors[4],
            fontsize = 12
        ),
        widget.BitcoinTicker(
            foreground = colors[2],
            background = colors[4],
            padding = 5
        ),
        widget.TextBox(
            text = '',
            background = colors[4],
            foreground = colors[5],
            padding = 0,
            fontsize = 37
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
            foreground = colors[0],
            background = colors[5],
            padding = 0,
            scale = 0.7
        ),
        widget.CurrentLayout(
            foreground = colors[2],
            background = colors[5],
            padding = 5
        ),
        widget.TextBox(
            text = '',
            background = colors[5],
            foreground = colors[4],
            padding = 0,
            fontsize = 37
        ),
        widget.Clock(
            foreground = colors[2],
            background = colors[4],
            format = "%A, %B %d - %H:%M "
        ),
    ]
    return widgets_list

screens = [
    Screen(
        top=bar.Bar(widgets=init_widgets_list(), opacity=1.0, size=20),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])



# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
