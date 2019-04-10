#!/bin/bash

sleep 1

# Workspace 1
urxvt -e bash -c 'neofetch && bash' &
urxvt -e bash -c 'newsboat' &

# Workspace 5
urxvt -T IRC -e bash -c irssi &

# Workspace 9
urxvt -T gotop -e bash -c gotop &

# Workspace 10
urxvt -T matrix -e bash -c cmatrix &
pavucontrol &
pulseeffects &
i3-msg 'workspace 1;' &
