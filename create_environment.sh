#!/bin/bash

# Prompts the user for their name
read -p "What is your name? " name

# Creates the directory name according to the username
parent_dir="submission_reminder_$name"
mkdir -p $parent_dir/app $parent_dir/modules $parent_dir/assets $parent_dir/config
echo "Parent directory created successfully"
sleep 1

# file_name=("reminder.sh" "functions.sh" "submissions.txt" "config.env")
file_name=("reminder.sh" "functions.sh" "submissions.txt" "config.env")
dir_list=("app" "modules" "assets" "config")

for (( i=0 ; i < 4 ; i++ )); do 
    echo $i
    echo files/${file_name[i]} 
    echo ${parent_dir}/${dir_list[i]}

    # cp files/${file_name[i]} ${parent_dir}/${dir_list[i]}
done

echo "The setup files have been created successfully"

cp files/startup.sh ${parent_dir}/startup.sh

chmod -R +x *.sh

