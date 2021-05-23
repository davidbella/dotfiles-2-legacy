.screenlayout/docked.sh

xset r rate 270 48

xsetroot -cursor_name left_ptr &

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME/.Xresources

bspwm
