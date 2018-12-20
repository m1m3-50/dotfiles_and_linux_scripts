xrandr --newmode "1504x1000_60.00"  124.25  1504 1600 1752 2000  1000 1003 1013 1038 -hsync +vsync
xrandr --addmode $1 1504x1000_60.00
xrandr --output $1 --mode 1504x1000_60.00

