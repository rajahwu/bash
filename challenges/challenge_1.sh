#!/usr/bin/env bash

declare -u user_uppper=$USER
declare space=$(free)
declare diskfilesystem=$(df -h /)

echo -e -n  "\033[35;3m" $user_uppper "\033[0m| "
printf "%(%Y-%m-%d %H:%M:%S)T\n" $(date +%s)

echo -e -n  "\033[32;3m Free space: \033[0m| "
echo -e "\033[33m"${space}"\033[0m"

echo -e -n  "\033[32;3m" disk filesystem "\033[0m| "
echo -e "\033[33m"${diskfilesystem}"\033[0m"
