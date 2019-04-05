
#!/bin/bash

cp $HOME/.config/i3/config-intel $HOME/.config/i3/config
echo "starting X with integrated graphics"
export MONITOR="eDP1"
export MONITOR2="DP1"

cat $HOME/.config/i3/config-common >> $HOME/.config/i3/config
startx
