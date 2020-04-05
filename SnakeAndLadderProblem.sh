#!/bin/bash -x

echo "Welcome To Snake And Ladder Problem"
startPosition=0

#roll the die
function rollingDie() {
	result=$((RANDOM%6 + 1))
}

rollingDie
echo $result
