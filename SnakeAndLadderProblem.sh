#!/bin/bash -x

echo "Welcome To Snake And Ladder Problem"
#start game with single player at position 0
startPosition=0

#roll the dice
function rollingDie() {
	result=$((RANDOM%6 + 1))
}

rollingDie
echo $result
