#!/bin/bash -x

echo "Welcome To Snake And Ladder Problem"
#CONSTANTS
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
#VARIABLE
playerPosition=0
diceCount=0

#roll the die
function rollingDie() {
	result=$((RANDOM%6 + 1))
	((diceCount++))
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
			playerPosition=$(( $playerPosition + $result ))
			;;
		$SNAKE)
			playerPosition=$(( $playerPosition - $result ))
			if [ $playerPosition -lt 0 ];
			then
				playerPosition=0
			fi
			;;
	esac
}

function getWinningPosition() {
	while [ $playerPosition != $WINNING_POSITION ]
	do
		if [ $playerPosition -gt $WINNING_POSITION ];
		then
			playerPosition=$(( $playerPosition - $result ))
		fi
		rollingDie
		checkOptions
		echo "Player Position:" $playerPosition
	done
}

#rollingDie
#echo $result
#start Playing first player
echo "Player Position:" $playerPosition
checkOptions
echo "Player Position:"$playerPosition
#reach winning position
getWinningPosition
echo "Player Win.."
echo "Player Position:"$playerPosition
echo "Total Dice Roll:"$diceCount
