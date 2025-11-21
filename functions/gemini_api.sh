#!/bin/bash

call_gemini_api() {
    echo "DEBUG: Starting Gemini API call..." >&2
    
    if [ -z "$GEMINI_API_KEY" ]; then
        echo "ERROR: Gemini API key missing." >&2
        return 1
    fi

    local LOG_EXCERPT
    LOG_EXCERPT=$(parse_log | tail -n 20)
    echo "DEBUG: Log excerpt captured (length: ${#LOG_EXCERPT})" >&2
    
    if [ -z "$LOG_EXCERPT" ]; then
        echo "ERROR: No log data to analyze." >&2
        return 1
    fi

    local PROMPT="Analyze these server logs for security anomalies, performance issues, or potential threats. Provide a concise summary: $LOG_EXCERPT"
    echo "DEBUG: Prompt created" >&2

    local RESPONSE
    RESPONSE=$(curl -s -X POST \
        "https://generativelanguage.googleapis.com/v1beta/models/$MODEL:generateContent?key=$GEMINI_API_KEY" \
        -H "Content-Type: application/json" \
        -d "{\"contents\": [{\"parts\": [{\"text\": \"$PROMPT\"}]}]}")
    
    echo "DEBUG: API response received (length: ${#RESPONSE})" >&2

    if [ $? -ne 0 ] || [ -z "$RESPONSE" ]; then
        echo "ERROR: API call failed or empty response." >&2
        return 1
    fi

    local SUMMARY
    SUMMARY=$(echo "$RESPONSE" | grep -o '"text": "[^"]*"' | head -1 | cut -d'"' -f4)
    
    echo "DEBUG: Parsed summary (length: ${#SUMMARY})" >&2
    
    if [ -z "$SUMMARY" ]; then
        echo "ERROR: Could not parse API response." >&2
        return 1
    fi

    echo "DEBUG: API call successful!" >&2
    echo "$SUMMARY"
}
