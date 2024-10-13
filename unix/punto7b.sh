#!/bin/sh

LOG_FILE="/var/log/authlog"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file '$LOG_FILE' not found!"
    exit 1
fi

echo "Checking for failed login attempts for user root..."
failed_attempts=$(grep "LOGIN FAILURE" "$LOG_FILE" | grep "root")

if [ -z "$failed_attempts" ]; then
    echo "No failed login attempts for user root found."
    exit 0
fi

echo "Failed login attempts for user root:"
grep "FAILED LOGIN" "$LOG_FILE" | grep "root" | awk '{print $1, $2, $3, $NF}'

total_attempts=$(echo "$failed_attempts" | wc -l)
echo "Total failed login attempts for root: $total_attempts"