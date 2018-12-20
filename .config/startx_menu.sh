
#!/bin/bash

if [ "$1" == "nvidia" ]; then
	echo "starting X with nVidia chip"
	sudo cp /etc/X11/xorg.conf-nvidia /etc/X11/xorg.conf
	cp $HOME/.config/i3/config-nvidia $HOME/.config/i3/config
	export MONITOR="eDP-1-1"
	export MONITOR2="DP-1-1"
else
	cp $HOME/.config/i3/config-intel $HOME/.config/i3/config
	sudo cp /etc/X11/xorg.conf-intel /etc/X11/xorg.conf
	echo "starting X with integrated graphics"
	export MONITOR="eDP1"
	export MONITOR2="DP1"
fi

startx

