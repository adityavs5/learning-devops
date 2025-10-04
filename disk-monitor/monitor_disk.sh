#!/bin/bash

# Disk Monitoring Script
# Purpose: Check disk usage and alert if above threshold

THRESHOLD=80
EMAIL="admin@example.com"

echo "=== Disk Usage Monitor ==="
echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# Check disk usage
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usage=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
  partition=$(echo $output | awk '{ print $2 }')
  
  if [ $usage -ge $THRESHOLD ]; then
    echo "⚠️  WARNING: Disk usage on $partition is at ${usage}%"
    # In production, send email alert here
    # echo "High disk usage on $partition: ${usage}%" | mail -s "Disk Alert" $EMAIL
  else
    echo "✅ OK: Disk usage on $partition is at ${usage}%"
  fi
done

echo ""
echo "=== Detailed Disk Usage ==="
df -h