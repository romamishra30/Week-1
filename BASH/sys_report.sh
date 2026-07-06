#!/bin/bash

start=$SECONDS
timestamp=$(date +%Y%m%d_%H%M%S)
file="sys_report_${timestamp}.txt"

{
echo "System Health Report"
echo "Generated on: $(date)"
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo

echo "System Uptime"
uptime
echo

echo "Disk Usage"
df -h "$HOME"
echo

echo "Memory Usage"
free -h
echo

echo "Running Processes"
echo "Total processes: $(ps aux | wc -l)"
echo
echo "Top 5 processes by CPU usage:"
ps aux --sort=-%cpu | head -6
echo

echo "Active Network Connections"
if command -v ss >/dev/null 2>&1; then
    ss -tulnp
else
    netstat -tulnp
fi
echo

echo "Recent Logins"
last | head -5
echo

end=$SECONDS
echo "End of Report"
echo "Generation time: $((end - start)) seconds"
} > "$file"

echo "System report saved as $file"