#!/bin/bash

# Check if espeak is installed
if ! [ -x "$(command -v espeak)" ]; then
  echo 'Error: espeak is not installed. Please install espeak and run the script again.' >&2
  exit 1
fi

echo "Welcome to the letter game!"
echo "We will be practicing letter recognition today."
read -p "What is your name: " name

# Initialize score
score=0

# Set the number of rounds
rounds=5

# Loop through the rounds
for ((i=1; i<=rounds; i++))
do
  # Generate a random letter
  letter=$(echo {A..Z} | tr " " "\n" | shuf -n 1)
  echo "Round $i: Listen carefully and type the letter you hear."
  espeak "Round $i: Listen carefully and type the letter you hear."
  sleep 1s
  espeak $letter
  read -p "Your answer: " answer
  
  # Check if the answer is correct
  if [ "$answer" == "$letter" ]
  then
    echo "Correct! Good job."
    score=$((score+1))
  else
    echo "Incorrect. The correct answer was $letter."
  fi
done

# Save the score to a text file
echo "$name: $score" >> score.txt

# Show of scoreboard
cat score.txt

echo "Thanks for playing the letter game! Your final score is $score."

