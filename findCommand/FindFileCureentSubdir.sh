#!/bin/bash


read -p "Enter the file name: " fileName

echo "Searching for Directories containing '$fileName' ........."

find . -type d -iname "*$fileName*"

echo "Done"