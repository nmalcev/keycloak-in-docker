#!/bin/env sh
# This script is for ash/alpine.

strindex() { 
  x="${1%%$2*}"
  [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

input=$1
dest=$2
SPL=":"

echo -n > $dest
while IFS= read -r line
do
  pos=$(strindex $line $SPL)

  if [ "$pos" -gt 1 ]; then
    login=${line:0:pos}
    passwd=${line:pos+1}
    echo $(echo -e $passwd | htpasswd -nbsi $login) >> $dest
  fi
done < $input


