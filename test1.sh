output=$(whoami)

#echo "$output"

while read line
do
    if [[ -z $line ]]
    then
         echo "uuuhhuu" # exit
    fi
    echo "hello"
done