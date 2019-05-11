#!/bin/bash

sleep 1

# Workspace 1
urxvt -T main -e bash -c "tmux new -s main-sess \"neofetch; bash\" \; split-window \"newsboat\" \; select-layout even-horizontal" &
# urxvt -e bash -c 'neofetch && bash' &
# urxvt -e bash -c 'newsboat' &

# Workspace 5
urxvt -T IRC -e bash -c irssi &

# Workspace 9
urxvt -T gotop -e bash -c gotop &

# Workspace 10
urxvt -T matrix -e bash -c cmatrix &
pavucontrol &
pulseeffects &
i3-msg 'workspace 1;' &
