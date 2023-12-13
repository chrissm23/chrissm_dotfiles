#!/bin/bash

# Find the kitty window ID in hex using wmctrl
window_id_hex=$(wmctrl -lx | awk '/main.kitty/ {print $1; exit}')

# Check if kitty window was found
if [ -n "$window_id_hex" ]; then
	# Convert the hexadecimal window ID to decimal for xdotool
	window_id_dec=$((16#${window_id_hex:2}))

	# Get the active window ID in decimal format
	active_window_id_dec=$(xdotool getactivewindow)

	if [ "$window_id_dec" -eq "$active_window_id_dec" ]; then
		# If kitty is the active window, minimize it
		xdotool windowminimize "$window_id_dec"
	else
		# If kitty is not active, activate it
		xdotool windowactivate --sync "$window_id_dec"
		wmctrl -i -r "$window_id_hex" -b add,maximized_vert,maximized_horz
	fi
else
	# If no kitty window is open, start it and maximize it
	kitty --class kitty --name main &

	# Wait for kitty to open
	sleep 0.25

	# Find the window ID in hex using the PID and maximize it
	kitty_window_id_hex=$(wmctrl -lx | awk '/main.kitty/ {print $1; exit}')
	if [ -n "$kitty_window_id_hex" ]; then
		# Convert the hexadecimal window ID to decimal for xdotool
		kitty_window_id_dec=$((16#${kitty_window_id_hex:2}))
		# Maximize the kitty window
		wmctrl -i -r "$kitty_window_id_hex" -b add,maximized_vert,maximized_horz
	fi
fi
