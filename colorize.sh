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

function colorize {
  # Define our output
  output=()

  # Split the input string into tokens
  IFS=' ' read -ra ARR <<< "$1"
  # Check which field need to be colored
  IFS=',' read -ra FIELDS <<< "$2"

  # For each token...
  for i in "${!ARR[@]}"; do 
    token=${ARR[$i]}
    color=$(($i % $COLORS_LEN))
    # Colorize and store in output array
    output+=($(echo -e "$ESC_SEQ${COLORS[$color]}$BG_SEQ$token$COL_RESET"))
  done

  # Print joined output array
  ( IFS=$' '; echo "${output[*]}" )
}

colorize "colored noncolored noncolored colored" 0,3

