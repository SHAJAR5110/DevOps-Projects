# Server Performance Stats

A simple Bash script to quickly analyze and display basic server performance statistics. It can be run on any Linux machine to get an immediate overview of system resource utilization.

## Features

The script provides the following metrics:
- **Total CPU usage**
- **Total Memory (RAM) usage** (Used vs. Free, including percentages)
- **Total Disk usage** (Used vs. Free, including percentages)
- **Top 5 Processes** by CPU usage
- **Top 5 Processes** by Memory usage

**Extra Stats Included:**
- OS Version
- System Uptime and Load Average
- Currently Logged-in Users
- Failed Login Attempts (Requires `sudo` privileges)

## How to Run

1. Clone this repository or copy the `server-stats.sh` script to your Linux machine.
2. Make the script executable by running:
   ```bash
   chmod +x server-stats.sh
   ```
3. Execute the script:
   ```bash
   ./server-stats.sh
   ```

*Note: To view the "Failed Login Attempts" stat, you must run the script with root privileges (e.g., `sudo ./server-stats.sh`).*
