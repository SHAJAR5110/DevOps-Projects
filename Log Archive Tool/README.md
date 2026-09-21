# Log Archive Tool

A simple Bash CLI tool designed to archive and compress log directories. This tool helps keep your system clean by moving and compressing old logs into a dedicated archive directory, which is especially useful for managing heavily populated directories like `/var/log`.

## Features

* **Automated Compression:** Compresses the target log directory into a `.tar.gz` format.
* **Timestamped Archives:** Automatically names the archive file with the current date and time (e.g., `logs_archive_YYYYMMDD_HHMMSS.tar.gz`).
* **Live File Support:** Gracefully handles system log files that are actively being written to during the compression process.
* **Archive Logging:** Maintains a record of all archiving activities in a dedicated `archive_record.log` file.

## Setup & Installation

1. Create the script file in your project directory:
   ```bash
   nano log-archive
   ```
2. Paste the script code into the file and save it.
3. Make the script executable:
   ```bash
   chmod +x log-archive
   ```
4. *(Optional)* Move the script to your system's binaries folder to run it globally from anywhere:
   ```bash
   sudo mv log-archive /usr/local/bin/
   ```

## Usage

Run the tool by providing the path to the directory you want to archive as an argument. 

**Basic Usage:**
```bash
./log-archive <log-directory>
```

**Archiving System Logs (Requires `sudo`):**
Because system log files in `/var/log` are often restricted to the root user, you should run the script with `sudo`:
```bash
sudo ./log-archive /var/log
```

## Output Structure

Running the script will generate an `archived_logs` directory in your current working directory (or where the script is executed). Inside, you will find:
1. The compressed archive: `logs_archive_20260921_135000.tar.gz`
2. The log file keeping track of history: `archive_record.log`
