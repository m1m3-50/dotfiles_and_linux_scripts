MODELINE="1800x1200_60.00  180.75  1800 1920 2112 2424  1200 1203 1213 1245 -hsync +vsync"
MODENAME=`echo $MODELINE | awk -F' ' '{ print $1 };'`
xrandr --newmode $MODELINE
xrandr --addmode $1 $MODENAME
xrandr --output $1 --mode $MODENAME

