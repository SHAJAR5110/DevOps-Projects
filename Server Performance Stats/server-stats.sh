#!/bin/bash

echo "==============================================="
echo "           SERVER PERFORMANCE STATS            "
echo "==============================================="

# 1. Total CPU usage
echo -e "\n🔹 CPU USAGE:"
grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "Total CPU Usage: %.2f%%\n", usage}'

# 2. Total memory usage (Free vs Used including percentage)
echo -e "\n🔹 MEMORY USAGE:"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%) | Free: %sMB | Total: %sMB\n", $3, $3*100/$2, $4, $2}'

# 3. Total disk usage (Free vs Used including percentage)
echo -e "\n🔹 DISK USAGE:"
df -h --total | awk '/^total/ {printf "Used: %s (%s) | Free: %s | Total: %s\n", $3, $5, $4, $2}'

# 4. Top 5 processes by CPU usage
echo -e "\n🔹 TOP 5 PROCESSES BY CPU:"
ps -eo pid,user,%cpu,cmd --sort=-%cpu | head -n 6

# 5. Top 5 processes by memory usage
echo -e "\n🔹 TOP 5 PROCESSES BY RAM:"
ps -eo pid,user,%mem,cmd --sort=-%mem | head -n 6

# ================= STRETCH GOALS =================
echo -e "\n==============================================="
echo "                 EXTRA STATS                   "
echo "==============================================="

# OS Version
echo -e "\n🔹 OS VERSION:"
cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '"' -f 2

# Uptime & Load Average
echo -e "\n🔹 SYSTEM UPTIME & LOAD AVERAGE:"
uptime

# Logged in users
echo -e "\n🔹 LOGGED IN USERS:"
users_count=$(who | wc -l)
echo "$users_count user(s) currently logged in."

# Failed login attempts (Requires root privileges, usually logs in /var/log/auth.log)
echo -e "\n🔹 FAILED LOGIN ATTEMPTS:"
if [ -r /var/log/auth.log ]; then
    failed_logins=$(grep -c "Failed password" /var/log/auth.log)
    echo "$failed_logins failed login attempt(s) found."
else
    echo "Requires sudo privileges to read auth logs."
fi

echo -e "\n==============================================="
