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

# Define text styles
text_styles[bold]='\e[1m'                # Bold
text_styles[italic]='\e[3m'             # Italic
text_styles[underline]='\e[4m'       # Underline
text_styles[blink]='\e[5m'               # Blinking
text_styles[inverted]='\e[7m'          # Inverted colors
text_styles[hidden]='\e[8m'           # Hidden text

print_program_title() {
  echo
  echo -e "\\______   \\_____    _____|  |__   \\_   ___ \\|  |__ _____  |  | |  |   ____   ____    ____   ____   \\_____  \\"
  echo -e " |    |  _/\\__  \\  /  ___/  |  \\  /    \\  \\/|  |  \\\\__  \\ |  | |  | _/ __ \\ /    \\  / ___\\_/ __ \\    _(__  <"
  echo -e " |    |   \\ / __ \\_\\___ \\|   Y  \\ \\     \\___|   Y  \\/ __ \\|  |_|  |_\\  ___/|   |  \\/ /_/  >  ___/   /       \\"
  echo -e " |______  /(____  /____  >___|  /  \\______  /___|  (____  /____/____/\\___  >___|  /\\___  / \\___  > /______  /"
  echo -e "        \\/      \\/     \\/     \\/          \\/     \\/     \\/               \\/     \\/\\/_____/      \\/         \\/"
  echo
}

print_program_title

sleep 3

clear

print_ascii_art() {
  echo "  ____                   _     _      _"
  echo " | __ )  __ _ _ __   __ _| |__ (_)_  _| |_ ___  _ __"
  echo " |  _ \ / _\` | '_ \ / _\` | '_ \| \ \/ / __/ _ \| '_ \\"
  echo " | |_) | (_| | | | | (_| | | | | |>  <| || (_) | | | |"
  echo " |____/ \__,_|_| |_|\__, |_| |_|_/_/\_\\\__\___/|_| |_|"
  echo "                    |___/"
  echo ""
  echo "      ____  _            _   _              _"
  echo "     | __ )| | __ _  ___| |_(_) ___  _ __  | |__"
  echo "     |  _ \| |/ _\` |/ __| __| |/ _ \| '__| | '_ \\"
  echo "     | |_) | | (_| | (__| |_| | (_) | |    | | | |"
  echo "     |____/|_|\__,_|\___|\__|_|\___/|_|    |_| |_|"
  echo ""
}

# Call the function to print the ASCII art
print_ascii_art