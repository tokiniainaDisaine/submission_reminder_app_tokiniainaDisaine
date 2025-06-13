#!/bin/bash

source ./name.txt

read -p "Which assignment are you looking for? " assignment

{
echo "# This is the config file"
echo "ASSIGNMENT=\"$assignment\""
echo "DAYS_REMAINING=2"
} > submission_reminder_$name/config/config.env