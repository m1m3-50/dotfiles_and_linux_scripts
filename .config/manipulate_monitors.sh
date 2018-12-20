MONITORS=`xrandr --listactivemonitors | grep -v 'Monitors:' | awk -F' ' '{print $2};' | sed 's/[\+\*]//g'`

MONITOR_COUNT=`xrandr --listactivemonitors | grep -v 'Monitors:' | awk -F' ' '{print $2};' | sed 's/[\+\*]//g' | wc -l`


organize_two_displays_left_to_right() {
	echo $1 $2
        MON1=false
	MON2=false
	if [[ $MONITOR_COUNT -ne 2 ]]; then
		echo "Some monitors not specified!"
		exit 1
	fi
	for monitor in $MONITORS; do
		echo $monitor
		if [[ $monitor == "$1" ]]; then
			MON1=true
			echo $1 exists
		fi
		if [[ $monitor == "$2" ]]; then
			MON2=true
			echo $2 exists
		fi
	done
	echo $MON1 $MON2
	if [ $MON1 != true ] || [ $MON2 != true ]; then
		echo Didn\'t find at least one monitor
		exit 1
	fi
	xrandr --output $2 --right-of $1
	xrandr --output $1 --primary

}

organize_displays_right_to_left() {
	if [ -z $1 ]; then
		echo "No primary display provided. . ."
		exit 1
	fi
	if [[ $MONITORS != *"$1"* ]]; then
		echo "Provided primary display does not exist"
       		exit 1
 	fi		
	RIGHT_NEIGHBOUR=$1
	for monitor in $MONITORS; do
		if [ $monitor != $RIGHT_NEIGHBOUR ]; then
			xrandr --output $monitor --left-of $RIGHT_NEIGHBOUR
			RIGHT_NEIGHBOUR=$monitor
		fi
	done
	xrandr --output $1 --primary
}

organize_displays_left_to_right() {
	if [ -z $1 ]; then
		echo "No primary display provided. . ."
		exit 1
	fi
	if [[ $MONITORS != *"$1"* ]]; then
		echo "Provided primary display does not exist"
       		exit 1
 	fi		
	LEFT_NEIGHBOUR=$1
	for monitor in $MONITORS; do
		if [ $monitor != $LEFT_NEIGHBOUR ]; then
			xrandr --output $monitor --right-of $LEFT_NEIGHBOUR
			LEFT_NEIGHBOUR=$monitor
		fi
	done
	xrandr --output $1 --primary
}

if [ -z $1 ]; then
	echo no argument
	exit 1
fi
if [ $MONITOR_COUNT -eq 1 ]; then
	exit 0
fi
# organize_two_displays_left_to_right $1 $2
if [ -z "$2" ] || [ $2 = "ltr" ]; then
	organize_displays_left_to_right $1
elif [ $2 = "rtl" ]; then
	organize_displays_right_to_left $1
else
	echo Second parameter, if specified, must be either ltr or rtl
	exit 1
fi

