#!/bin/bash
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
SLACK_CHANNEL="#cloud"
SLACK_USERNAME="gouthamkrishna860"
SLACK_MESSAGE="Ram Usage Update"

# check status of service or metric
while true; do
    RAM=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
    # send slack message
    curl -X POST -H 'Content-type: application/json' --data "{\"channel\": \"$SLACK_CHANNEL\", \"username\": \"$SLACK_USERNAME\", \"text\": \"$SLACK_MESSAGE\:'"$RAM"'"}" $SLACK_WEBHOOK_URL
    sleep 600
done
