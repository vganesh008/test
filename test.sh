#!/bin/bash
#################################################################
#Created by:=Ganesh Reddy                                       #
#Date on created=
echo "created date=$(date)
#Date on Modified =
echo " modified date =$(date)

echo "Creating Test script"
================================================================
echo "Provide File name"
read -r file
if [ -z $file ]; then
    echo "provide valied input"
fi

cd test/

if [ -f /root/test/$file ]; then
    echo "file is avilable on path"
else
    echo "let me create new file"
    touch $file.sh
fi
echo "code was done"
echo "my name is reddy"