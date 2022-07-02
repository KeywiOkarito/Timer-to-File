#!/bin/bash
unset mins;
unset timer;
unset hours;
unset minutes;
unset seconds;
filename="./timer-v1.txt"

until [[ $mins == +([0-9]) ]] ; do
    read -r -p "Please enter minutes: " mins
done
until [[ $timer == +([0-9]) ]] ; do
    read -r -p "Please enter seconds: " timer
done
echo $mins $timer

timer=$((mins * 60 + timer));
echo "Running for $timer seconds"

while [[ $timer -gt 0 ]]; do
	sleep 1
	timer=$(( timer - 1 ))
	if (( $timer > 3600 )) ; then
		let "hours=timer/3600"
		let "minutes=(timer%3600)/60"
		let "seconds=(timer%3600)%60"
		echo $hours"h "$minutes"m "$seconds"s" > $filename;
	elif (( $timer > 60 )) ; then
		let "minutes=(timer%3600)/60"
		let "seconds=(timer%3600)%60"
		echo $minutes"m "$seconds"s" > $filename;
	else
		echo $timer"s" > $filename;
	fi
done

echo "" > $filename;
echo "Completed.";