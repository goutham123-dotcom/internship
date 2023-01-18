#!/bin/bash

while true; do
    RAM=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
    curl -X POST -H 'Content-type: application/json' --data '{"text":"RAM usage: '"$RAM"'"}' https://hooks.slack.com/services/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
    sleep 600
done