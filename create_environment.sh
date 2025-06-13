#!/bin/bash

# Prompts the user for their name
read -p "What is your name? " name

# Creates the directory name according to the username
echo "name=$name" > name.txt # stores the app name into an external file
parent_dir="submission_reminder_$name"

dir_list=("app" "modules" "assets" "config")
file_name=("reminder.sh" "functions.sh" "submissions.txt" "config.env")

for (( i=0 ; i < 4 ; i++ )); do 
    mkdir -p $parent_dir/${dir_list[i]}
done
sleep 1
echo "Parent directories created successfully"
echo "--------------------------------------------"

for (( i=0 ; i < 4 ; i++ )); do 
    echo "Copying ${file_name[i]} to ${parent_dir}/${dir_list[i]}"
    cp files/${file_name[i]} ${parent_dir}/${dir_list[i]}/${file_name[i]}

    if [[ ${file_name[i]} == "functions.sh" || ${file_name[i]} == "reminder.sh" ]]; then
        chmod +x ${parent_dir}/${dir_list[i]}/${file_name[i]}
    fi

    sleep 1
done

cp files/startup.sh ${parent_dir}

{
echo "Isaac, Git, not submitted"
echo "Stephen, Shell Navigation, submitted"
echo "Mark, Shell Basics, submitted"
echo "Albert, Git, not submitted"
echo "Nikola, Shell Navigation, submitted" 
} >> $parent_dir/assets/submissions.txt


echo "The setup files have been created successfully"
echo "--------------------------------------------"
sleep 1


