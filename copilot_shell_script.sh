#!/bin/bash

# Takes prompted name 
source ./name.txt 

# Prompts the user for the wanted assignment
read -p "Which assignment are you looking for? " assignment

# Writes the assignment to the config file
{
echo "# This is the config file"
echo "ASSIGNMENT=\"$assignment\""
echo "DAYS_REMAINING=2"
} > submission_reminder_$name/config/config.env