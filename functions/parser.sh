#!/bin/bash

parse_log() {
    # Read from the configured LOG_FILE only
    grep -i "error\|fail\|exception\|denied\|warning" "$LOG_FILE" | \
    # Anonymize IP addresses
    sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[REDACTED_IP]/g' | \
    # Anonymize passwords
    sed 's/password=[^ ]*/password=[REDACTED]/g' | \
    # Anonymize usernames
    sed 's/user=[^ ]*/user=[REDACTED]/g'
}
