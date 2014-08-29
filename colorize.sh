#!/usr/bin/env bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
BG_SEQ=";01m"

# Adjust the default order of the colors here.
# First highlighted field will be colored in first
# color, second in second and so on.
COLORS=(
31 # RED
32 # GREEN
34 # BLUE
33 # YELLOW
35 # MAGENTA
36 # CYAN
)

############################

COLORS_LEN=${#COLORS[@]}

containsElement () {
  local e
  for e in "${@:2}"
  do
    [[ "$e" == "$1" ]] && return 1
  done
  return 0
}


function colorize {

  # Split the input string into tokens
  IFS=' ' read -ra ARR <<< "$1"

  # Check which field should be colored
  IFS=',' read -ra FIELDS <<< "$2"

  # Define the output
  output=()

  # For each token...
  for i in "${!ARR[@]}"; do 
    token=${ARR[$i]}

    # Is this a field that should be colored?
    containsElement $i "${FIELDS[@]}"
    if [ $? -eq 1 ]
    then
      # Yes. Colorize and store in output array
      color=$(($i % $COLORS_LEN))
      output+=($(echo -e "$ESC_SEQ${COLORS[$color]}$BG_SEQ$token$COL_RESET"))
    else
      # No. Just print the word.
      output+=($(echo $token))
    fi
  done

  # Print joined output array
  ( IFS=$' '; echo "${output[*]}" )
}

colorize "colored noncolored noncolored colored" 0,3

