#!/usr/bin/env bash 

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &

feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

run vaiety &
run nm-applet &
run pacman-tray &
run xfce4-power-manager &
numlock on &
blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &

