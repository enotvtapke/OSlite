#!/bin/bash

#killall "tracker.sh"
{
    `./tracker.sh mem1.bash`
    `./tracker.sh mem2.bash`
} &
`./mem1.bash` &
`./mem2.bash` &
