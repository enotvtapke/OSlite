#!/bin/bash

#echo $$ > .pid
#echo $$ > pipe
arr=()
i=1
> report2.log

while true; do
    arr+=($i)
    i=$((($i + 1) % 11))
    if [ $((${#arr[*]} % 100000)) == 0 ]; then
        echo ${#arr[*]} >> report2.log
    fi
done
