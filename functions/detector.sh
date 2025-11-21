#!/bin/bash

detect_anomaly() {
    local COUNT
    COUNT=$(parse_log | wc -l)
    local SUMMARY_MESSAGE

    echo "Found $COUNT potential issues in logs" >> "$SCRIPT_LOG"

    if $AI_ENABLED && [ $COUNT -gt 0 ]; then
        echo "AI Analysis started..." >> "$SCRIPT_LOG"
        AI_SUMMARY=$(call_gemini_api)
        
        if [ $? -eq 0 ] && [ -n "$AI_SUMMARY" ]; then
            SUMMARY_MESSAGE="🤖 AI Analysis Result:
            $AI_SUMMARY"
            echo "AI analysis completed successfully" >> "$SCRIPT_LOG"
        else
            SUMMARY_MESSAGE="⚠️ Basic Detection: Found $COUNT anomalies
            AI analysis unavailable or failed"
            echo "AI analysis failed, using basic detection" >> "$SCRIPT_LOG"
        fi
    else
        SUMMARY_MESSAGE="⚠️ Basic Detection: Found $COUNT anomalies"
        echo "Basic detection: $COUNT anomalies" >> "$SCRIPT_LOG"
    fi

    if [ $COUNT -gt $THRESHOLD ] || ($AI_ENABLED && [ $COUNT -gt 0 ]); then
        echo "Sending alert via email..." >> "$SCRIPT_LOG"
        send_alert "$SUMMARY_MESSAGE"
    else
        echo "No significant anomalies detected" >> "$SCRIPT_LOG"
    fi
}
