#!/bin/bash
NAME=$1
CMD=$2

echo $NAME $CMD
urxvt -e bash -c "echo -en \"\033]0;$NAME\007\"; $CMD"

