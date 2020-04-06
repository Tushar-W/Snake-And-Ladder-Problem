#!/bin/bash -x

echo "Welcome To Snake And Ladder Problem"
#CONSTANTS
PLAYER_1=0
PLAYER_2=1
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
#VARIABLE
playerPosition=0
diceCount=0
playerOnePosition=0
playerTwoPosition=0
turn=0

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
	getPreviousPosition
}

function getPreviousPosition() {
	if [ $playerPosition -gt $WINNING_POSITION ];
	then
		playerPosition=$(( $playerPosition - $result ))
	fi
}

function playerTwo() {
	playerPosition=$playerTwoPosition
	rollingDie
	checkOptions
	playerTwoPosition=$playerPosition
	turn=0
	getWinningPlayer
}

function playerOne() {
	playerPosition=$playerOnePosition
	rollingDie
	checkOptions
	playerOnePosition=$playerPosition
	turn=1
	getWinningPlayer
}

function turnPlayer() {
	if [ $turn -eq 0 ];
	then
		playerOne
	else
		playerTwo
	fi
}

function getWinningPlayer() {
	if [ $playerOnePosition -eq $WINNING_POSITION ];
	then
		echo "Player One Win ..."
	elif [ $playerTwoPosition -eq $WINNING_POSITION ];
	then
		echo "Player Two Win..."
	fi
}

function startGame() {
	while [ $playerPosition != $WINNING_POSITION ]
	do
		turnPlayer
	done
}

#rollingDie
#echo $result
#start Playing first player
echo "Player Position:" $playerPosition
checkOptions
echo "Player Position:"$playerPosition
#Two player Game
startGame
echo "Total Dice Roll:"$diceCount
