#!/bin/bash 

# get data usage in day 
DAY=$(vnstat --oneline | awk -F';' '{print $6}')
dayInt=$(echo ${DAY} | awk '{print $1}')

# get data usage of month
MONTH=$(vnstat --oneline | awk -F';' '{print $15}')

# set color level
if [[ $(echo ${dayInt} '>' 1.11 | bc) ]]; then
    if [[ $(echo ${dayInt} '>' 1.70 | bc) ]]; then 
        CLR="%{F#F21919}"
    else 
        CLR="%{F#FBD00F}"
    fi
else
    CLR="%{F#50FA7B}"
fi

# output
echo "${CLR} %{F-}${DAY}" 
