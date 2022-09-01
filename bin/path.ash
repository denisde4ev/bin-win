#!bin/ash
PATHseparator=$( PATH=1:2 ; printf %c "${PATH#1}" ) # expected Windows to use ';'
echo "${PATH//"$PATHseparator"/$'\n'}"
