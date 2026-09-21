# Nginx Log Analyzer

A simple Bash script that automatically downloads a sample Nginx access log and analyzes it to extract useful traffic metrics. This tool is built to demonstrate core shell scripting skills using commands like `awk`, `sort`, `uniq`, and `head`.

## Features

- **Auto-Fetch:** Automatically downloads the sample log file using `curl` if it is not found locally.
- **Top 5 IP Addresses:** Identifies the most frequent visitors to the server.
- **Top 5 Requested Paths:** Shows the most accessed endpoints and pages.
- **Top 5 Status Codes:** Summarizes server responses (e.g., 200, 404, 500) to help spot errors.
- **Top 5 User Agents:** Displays the most common browsers or clients used by visitors.

## Setup & Usage

1. Create a new file in your project directory:
   ```bash
   nano log-analyzer.sh
   ```

2. Paste the Bash code into the file and save it.

3. Make the script executable:
   ```bash
   chmod +x log-analyzer.sh
   ```

4. Run the script:
   ```bash
   ./log-analyzer.sh
   ```

Upon running, the script will check for the `nginx-access.log` file. If it doesn't exist, it will download it, process the data, and output the top statistics cleanly to your terminal.
