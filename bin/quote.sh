#!/bin/ash

#quote(){ 
start_space=''
for i; do printf "${start_space}'%s'" "${i//"'"/"'\\''"}"; start_space=' '; done; echo;
# }
