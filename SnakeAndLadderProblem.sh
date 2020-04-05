#!/bin/bash -x

echo "Welcome To Snake And Ladder Problem"
#CONSTANTS
NO_PLAY=0
LADDER=1
SNAKE=2
#VARIABLE
playerPosition=0

#roll the die
function rollingDie() {
	result=$((RANDOM%6 + 1))
	echo $result
}

#cheking player options
function checkOptions() {
	option=$((RANDOM%3))
	case $option in
		$NO_Play)
			playerPosition=$playerPosition
			;;
		$LADDER)
			playerPosition=$(( $playerPosition + $( rollingDie ) ))
			;;
		$SNAKE)
			if [ $playerPosition -ne 0 ];
			then
				playerPosition=$(( $playerPosition - $( rollingDie ) ))
			else
				playerPosition=0
			fi
			;;
	esac
}

rollingDie
echo $result
#start Playing first player
echo "Player Position:" $playerPosition
checkOptions
echo "Player Position:"$playerPosition
