#!/usr/bin/env bash

# Define an associative array for text colors and styles
declare -A text_styles

# Define text colors
text_styles[default]='\e[0m'       # Default color (reset)
text_styles[black]='\e[0;30m'       # Black
text_styles[red]='\e[0;31m'         # Red
text_styles[green]='\e[0;32m'     # Green
text_styles[yellow]='\e[0;33m'   # Yellow
text_styles[blue]='\e[0;34m'       # Blue
text_styles[magenta]='\e[0;35m' # Magenta
text_styles[cyan]='\e[0;36m'     # Cyan
text_styles[white]='\e[0;37m'     # White


# Define background colors
text_styles[bg_default]='\e[49m'         # Default background color
text_styles[bg_black]='\e[40m'           # Black background
text_styles[bg_red]='\e[41m'             # Red background
text_styles[bg_green]='\e[42m'         # Green background
text_styles[bg_yellow]='\e[43m'       # Yellow background
text_styles[bg_blue]='\e[44m'           # Blue background
text_styles[bg_magenta]='\e[45m'   # Magenta background
text_styles[bg_cyan]='\e[46m'         # Cyan background
text_styles[bg_white]='\e[47m'         # White background


# Define text styles
text_styles[bold]='\e[1m'                # Bold
text_styles[italic]='\e[3m'             # Italic
text_styles[underline]='\e[4m'       # Underline
text_styles[blink]='\e[5m'               # Blinking
text_styles[inverted]='\e[7m'          # Inverted colors
text_styles[hidden]='\e[8m'

print_title_screen() {
    clear
    echo -e "${text_styles[red]}"
    echo "  ____                   _     _      _"
    echo " | __ )  __ _ _ __   __ _| |__ (_)_  _| |_ ___  _ __"
    echo " |  _ \ / _\` | '_ \ / _\` | '_ \| \ \/ / __/ _ \| '_ \\"
    echo " | |_) | (_| | | | | (_| | | | | |>  <| || (_) | | | |"
    echo " |____/ \__,_|_| |_|\__, |_| |_|_/_/\_\\\__\___/|_| |_|"
    echo "                    |___/"
    echo -e "${text_styles[cyan]}"
    echo "      ____  _            _   _              _"
    echo "     | __ )| | __ _  ___| |_(_) ___  _ __  | |__"
    echo "     |  _ \| |/ _\` |/ __| __| |/ _ \| '__| | '_ \\"
    echo "     | |_) | | (_| | (__| |_| | (_) | |    | | | |"
    echo "     |____/|_|\__,_|\___|\__|_|\___/|_|    |_| |_|"
    echo -e "${text_styles[default]}"
    echo
    echo -e "Press ${text_styles[green]}B${text_styles[default]} to begin or ${text_styles[red]}Q${text_styles[default]} to quit ${text_styles[blink]} ${text_styles[default]}"
    read startgame
    case $startgame in
    B) echo "Starting the game....";;
    Q) echo "Quitting...";;
    *) echo -e "${text_styles[red]}You were destoryed${text_styles[default]}\n"
       echo -e  "\t💀💀💀💀💀💀💀💀💀💀\n"
       sleep 3;
       exit
    esac
}


print_title_screen

declare -A player_tokens
player_tokens[mage]="🧙"
player_tokens[merman]="🧜‍♂️"
player_tokens[genie]="🧞‍♂️"

declare -A level
level[ground]="========================================================================================================"
selected_token=""
# select token in ${player_tokens[genie]} ${player_tokens[merman]} ${player_tokens[mage]}

while [[ -z $selected_token ]]; do
    echo "Available tokens:"

    for token_key in "${!player_tokens[@]}"; do
        echo "${token_key}: ${player_tokens[$token_key]}"
    done

    read -p "Select a token: " token_key

    if [[ -n ${player_tokens[$token_key]} ]]; then
        selected_token="${player_tokens[$token_key]}"
    else 
        echo "💀💀💀💀💀💀💀💀💀💀"
        sleep 3
        exit
    fi
done

selected_token="$selected_token"
space_left="\t"
ground=$level[ground]

for i in {0..6} 
do
    clear
    echo -e "\n\n\n"
    selected_token="$space_left$selected_token"
    echo -e "$selected_token"
    echo -e "${text_styles[magenta]}${level[ground]}${text_styles[default]}"
    sleep 1
done

sleep 2
clear