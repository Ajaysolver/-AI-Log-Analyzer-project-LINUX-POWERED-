#!/bin/bash

send_alert() {
    local MESSAGE="$1"
    local SUBJECT="Log Anomaly Detected on $(hostname)"
    local TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Log the attempt
    echo "[$TIMESTAMP] Attempting to send alert to: $ALERT_EMAIL" >> "$SCRIPT_LOG"
    
    # Try to send email
    if echo "$MESSAGE" | mailx -s "$SUBJECT" "$ALERT_EMAIL" 2>/tmp/email-error.log; then
        echo "[$TIMESTAMP] ✅ Email sent successfully to $ALERT_EMAIL" >> "$SCRIPT_LOG"
        rm -f "alert_fallback.log"
    else
        local ERROR_MSG=$(cat /tmp/email-error.log)
        echo "[$TIMESTAMP] ❌ Email failed: $ERROR_MSG" >> "$SCRIPT_LOG"
        
        # Create fallback file
        echo "ALERT GENERATED: $TIMESTAMP" > "alert_fallback.log"
        echo "SUBJECT: $SUBJECT" >> "alert_fallback.log"
        echo "INTENDED RECIPIENT: $ALERT_EMAIL" >> "alert_fallback.log"
        echo "----------------------------------------" >> "alert_fallback.log"
        echo "$MESSAGE" >> "alert_fallback.log"
        echo "----------------------------------------" >> "alert_fallback.log"
        echo "EMAIL ERROR: $ERROR_MSG" >> "alert_fallback.log"
        
        echo "[$TIMESTAMP] 📁 Alert saved to alert_fallback.log" >> "$SCRIPT_LOG"
    fi
    
    rm -f /tmp/email-error.log
}
