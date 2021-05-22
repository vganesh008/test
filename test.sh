#!/bin/bash
#################################################################
#Created by:=Ganesh Reddy                                       #
#Date on created=$(daate)
#Date on Modified =$(date)

echo "Creating Test script"
================================================================
echo -p "Provide File name="
read -r file
if [ -n $file ];
then
echo "provide valied input"
cd test
elif [ -f /root/test/test.txt ];
then
echo "file is avilable on path"
else "let me create new file"
fi


