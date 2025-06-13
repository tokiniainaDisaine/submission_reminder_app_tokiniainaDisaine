#!/bin/bash

# function to start the app
start_app() {
    echo "Engaging the starting sequence"

    if [ -f "./config/config.env" ]; then
        source ./config/config.env
        # echo "Config loaded successfully"
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
        echo "App loaded successfully"
        sleep 1
    else 
        echo "[!] Error: encountered problem with app"
        echo "Hint: Execution permission not granted"
    fi

    echo "--------------------------------------------"

    source ./app/reminder.sh
}

start_app