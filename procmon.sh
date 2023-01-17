#!/bin/bash

# The procmon script is used to monitorize commands that were ran or will run on the system, used for privilege escalation and lateral movement on a Linux target.

old_process=$(ps -eo user,command)

while true; do
        new_process=$(ps -eo user,command)
        diff <(echo "$old_process") <(echo "$new_process") | grep "[\>\<]" | grep -vE "command|procmon|kworker"
        old_process=$new_process
done
