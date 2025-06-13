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
    touch ${parent_dir}/${dir_list[i]}/${file_name[i]}

    if [[ ${file_name[i]} == "functions.sh" || ${file_name[i]} == "reminder.sh" ]]; then
        chmod +x ${parent_dir}/${dir_list[i]}/${file_name[i]}
    fi
done
sleep 1
echo "Parent directories created successfully"
echo "--------------------------------------------"

# Populate the reminder file
echo '#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
' > $parent_dir/app/reminder.sh


# Populate the functions file
echo '#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}' > $parent_dir/modules/functions.sh


# Populate the submissions file
echo 'student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Isaac, Git, not submitted
Stephen, Shell Navigation, submitted
Mark, Shell Basics, submitted
Albert, Git, not submitted
Nikola, Shell Navigation, submitted' > $parent_dir/assets/submissions.txt


# Populate the config file
echo '# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > $parent_dir/config/config.env


# Populate the startup file
#!/bin/bash

# function to start the app
echo 'start_app() {
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

start_app' > $parent_dir/startup.sh

chmod +x $parent_dir/startup.sh


# cp files/startup.sh ${parent_dir}

# {
# echo "Isaac, Git, not submitted"
# echo "Stephen, Shell Navigation, submitted"
# echo "Mark, Shell Basics, submitted"
# echo "Albert, Git, not submitted"
# echo "Nikola, Shell Navigation, submitted" 
# } >> $parent_dir/assets/submissions.txt


echo "The setup files have been created successfully"
echo "--------------------------------------------"