#!/bin/bash

# --- Load Configuration ---
source config.sh

# --- Load Function Libraries ---
source functions/parser.sh
source functions/detector.sh
source functions/gemini_api.sh
source functions/alert.sh

# --- Parse Command Line Flags ---
while getopts ":a" opt; do
  case $opt in
    a)
      AI_ENABLED=true
      echo "$(date): AI Analysis enabled." >> "$SCRIPT_LOG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

# --- Start the Main Process ---
echo "$(date): Starting analysis of $LOG_FILE" >> "$SCRIPT_LOG"
detect_anomaly
echo "$(date): Analysis finished." >> "$SCRIPT_LOG"
