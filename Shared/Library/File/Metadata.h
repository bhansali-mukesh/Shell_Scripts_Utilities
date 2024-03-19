#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

function Minute_Since_Last_Update()
{
        if [ $# -ge 1 ]
        then
                # Current Time - Last Authenticated, In Minutes
                echo $((($(date +%s)-$(date -r ${1} +%s))/60))
        else
                # Any High Number
                echo 9999999
        fi
}
