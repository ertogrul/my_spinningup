#!/bin/bash
#
#
# This script enables running fist few commands from spinning-up tutorial. 
#

#set the right conda environment
command_string="source activate spinningup"
eval "$command_string"
output=$(eval "$command_string")
echo "$output"

# Bash Menu
USERSCHOICE='Please enter your choice: '
options=("Train LunarLander" "Check Lunarlander's perf" "Plot Results" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Train LunarLander")
            echo "OK, set's train Lunarlander"
            python -m spinup.run ppo --hid "[32,32]" --env LunarLander-v2 --exp_name installtest --gamma 0.999
            ;;
        "Check Lunarlander's perf")
            echo "OK, let's check LunarLander's performance"
            python -m spinup.run test_policy data/installtest/installtest_s0
            ;;
        "Plot Results")
            echo "OK, let's see plot results"
            python -m spinup.run plot data/installtest/installtest_s0
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option: $REPLY";;
    esac
done