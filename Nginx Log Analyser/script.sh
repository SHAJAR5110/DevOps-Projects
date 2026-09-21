#!/bin/bash

LOG_FILE="nginx-access.log"
LOG_URL="https://gist.githubusercontent.com/nilbuild/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log"

# 1. Auto-download if the file does not exist
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found locally. Downloading..."
    curl -s "$LOG_URL" -o "$LOG_FILE"
    echo "Logs downloaded and saved to $LOG_FILE"
    echo "----------------------------------------"
fi

# 2. Helper function to format output
format_output() {
    while read count value; do
        echo "$value - $count requests"
    done
}

# 3. Analyze the logs
echo -e "\nTop 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | format_output

echo -e "\nTop 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | format_output

echo -e "\nTop 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | format_output

echo -e "\nTop 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | format_output
