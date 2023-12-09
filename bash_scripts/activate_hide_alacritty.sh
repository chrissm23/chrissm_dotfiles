#!/bin/bash

# Find the Alacritty window ID in hex using wmctrl
window_id_hex=$(wmctrl -lx | awk '/Alacritty.Alacritty/ {print $1; exit}')

# Check if Alacritty window was found
if [ -n "$window_id_hex" ]; then
	# Convert the hexadecimal window ID to decimal for xdotool
	window_id_dec=$((16#${window_id_hex:2}))

	# Get the active window ID in decimal format
	active_window_id_dec=$(xdotool getactivewindow)

	if [ "$window_id_dec" -eq "$active_window_id_dec" ]; then
		# If Alacritty is the active window, minimize it
		xdotool windowminimize "$window_id_dec"
	else
		# If Alacritty is not active, activate it
		xdotool windowactivate --sync "$window_id_dec"
		wmctrl -i -r "$window_id_hex" -b add,maximized_vert,maximized_horz
	fi
else
	# If no Alacritty window is open, start it and maximize it
	alacritty &

	# Wait for Alacritty to open
	sleep 0.25

	# Find the window ID in hex using the PID and maximize it
	alacritty_window_id_hex=$(wmctrl -lx | awk '/Alacritty.Alacritty/ {print $1; exit}')
	if [ -n "$alacritty_window_id_hex" ]; then
		# Convert the hexadecimal window ID to decimal for xdotool
		alacritty_window_id_dec=$((16#${alacritty_window_id_hex:2}))
		# Maximize the Alacritty window
		wmctrl -i -r "$alacritty_window_id_hex" -b add,maximized_vert,maximized_horz
	fi
fi
