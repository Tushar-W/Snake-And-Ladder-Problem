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
			playerPosition=$(( $playerPosition - $( rollingDie ) ))
			if [ $playerPosition -lt 0 ];
			then
				playerPosition=0
			fi
			;;
	esac
}

function getPreviousPosition() {
	playerPosition=$(( $playerPosition - $(($result - 1)) ))
}

function getWinningPosition() {
	while [ $playerPosition != 100 ]
	do
		if [ $playerPosition -gt 100 ];
		then
			getPreviousPosition
		fi
		checkOptions
	done
}

rollingDie
echo $result
#start Playing first player
echo "Player Position:" $playerPosition
checkOptions
echo "Player Position:"$playerPosition
#reach winning position
getWinningPosition
echo $result
echo "Player Win.."
echo "Player Position:"$playerPosition
