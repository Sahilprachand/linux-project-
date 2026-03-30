# Script 4: Log File Analyzer
# Author:SAHIL PRACHAND
#| Course: Open Source Software
echo "   LOG FILE ANALYZER"

LOGFILE=${1:-"/var/log/syslog"}
KEYWORD=${2:-"error"}

echo "Input Settings:"
echo "  Log File: $LOGFILE"
echo "  Keyword: $KEYWORD (case-insensitive)"
echo ""

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found."
    echo ""
    echo "Common log files to analyze:"
    echo "  /var/log/syslog"
    echo "  /var/log/auth.log"
    echo "  /var/log/apt/history.log"
    echo ""
    exit 1
fi

echo "Log file found. Analyzing..."
echo ""

COUNT=0
TOTAL_LINES=0
MATCHES_ARRAY=()

while IFS= read -r LINE; do
    TOTAL_LINES=$((TOTAL_LINES + 1))
    
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        
        MATCHES_ARRAY+=("$LINE")
        if [ ${#MATCHES_ARRAY[@]} -gt 10 ]; then
            MATCHES_ARRAY=("${MATCHES_ARRAY[@]:1}")
        fi
    fi
done < "$LOGFILE"

echo "=== ANALYSIS RESULTS ==="
echo "Total lines in file: $TOTAL_LINES"
echo "Keyword found: $COUNT times"
echo "Match percentage: $(echo "scale=2; $COUNT * 100 / $TOTAL_LINES" | bc)%"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "=== LAST 10 MATCHING LINES ==="
    echo ""
    
    for i in "${!MATCHES_ARRAY[@]}"; do
        MATCH_NUMBER=$((i + 1))
        
        DISPLAY_LINE="${MATCHES_ARRAY[$i]}"
        if [ ${#DISPLAY_LINE} -gt 120 ]; then
            DISPLAY_LINE="${DISPLAY_LINE:0:120}..."
        fi
        
        echo "Match $MATCH_NUMBER:"
        echo "  $DISPLAY_LINE"
        echo ""
    done
else
    echo "No matches found for keyword: '$KEYWORD'"
    echo ""
    echo "Tip: Try searching for common keywords:"
    echo "  error, warning, failed, success, connected"
    echo ""
fi

echo "=== SUMMARY ==="
echo "Analyzed: $LOGFILE"
echo "Keyword: '$KEYWORD'"
echo "Matches: $COUNT out of $TOTAL_LINES lines"
echo "Analysis timestamp: $(date)"
echo ""
echo "===================================="
echo ""