#!/bin/env sh
# This script is for bash/debian. Ash/alpine does not support arrays

split_line() {
  local list=( $(echo "$1" | tr "$2" '\n') )
  echo "${list[@]}"
}

input=$1
dest=$2
SPL=":"

echo -n > $dest
while IFS= read -r line
do
  items=( $(split_line $line $SPL) )
  ##echo "${#items[@]}"
  ##echo "${items[@]}"
  [ "${#items[@]}" == "2" ] && echo $(echo -e "${items[1]}" | htpasswd -nbsi "${items[0]}") >> $dest
done < $input


