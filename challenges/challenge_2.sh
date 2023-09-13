#!/usr/bin/env bash
rolldie() {

  declare -i dice=$1
  declare -i roll=0

  declare -i i=0

  echo "Rolling $dice dice"; echo "...";
  sleep 1s
  echo "..."
  sleep 1s
  while ((i<$dice))
  do
  declare -i diecount=$(( 1 + $RANDOM %  6))
  sleep 1s
  echo "Die $(($i + 1)) rolled $diecount"
  ((roll += diecount))
  ((i++))
  done
  sleep 1s
  echo "Score $roll"
  sleep 1s
}

rolldie 2

