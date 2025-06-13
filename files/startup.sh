#!/bin/bash

source ./name.txt
parent_dir="submission_reminder_$name"
# echo $name

# function to start the app
start_app() {
    echo "Engaging the starting sequence"
    cd $parent_dir

    if [ -f "./config/confing.env" ]; then
        source ./config/confing.env
        echo "Config loaded successfully"
        sleep 1
    else 
        echo "[!] Error: encountered problem with config"
    fi
    
    if [ -f "./modules/functions.sh" ]; then
        source ./modules/functions.sh
        echo "Modules loaded successfully"
        sleep 1
    else 
        echo "[!] Error: encountered problem with modules"
    fi

    if [ -x "./app/reminder.sh" ]; then
        source ./app/reminder.sh
        echo "App loaded successfully"
        sleep 1
    else 
        echo "[!] Error: encountered problem with app"
        echo "Hint: Execution permission not granted"
    fi
}

start_app