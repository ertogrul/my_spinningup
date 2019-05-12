#!/bin/bash
#
#
# This script enables running fist few commands after clonning the spinningup repo. 
#

# Bash Menu
USERSCHOICE='Please enter your choice: '
options=("1# Train LunarLander" "2# Check Lunarlander's perf" "3# Plot Results" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "1# Train LunarLander")
            echo "you chose choice 1"
            python -m spinup.run ppo --hid "[32,32]" --env LunarLander-v2 --exp_name installtest --gamma 0.999
            ;;
        "2# Check Lunarlander's perf")
            echo "you chose choice 2"
            python -m spinup.run test_policy data/installtest/installtest_s0
            ;;
        "3# Plot Results")
            echo "you chose choice $REPLY which is $opt"
            python -m spinup.run plot data/installtest/installtest_s0
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option: $REPLY";;
    esac
done