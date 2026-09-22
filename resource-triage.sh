#!/usr/bin/env bash
# Live Performance & Connection Triage

echo "=================================================="
echo "       TOP PERFORMANCE & NETWORK CONSUMERS        "
echo "=================================================="

# 1. Top 5 CPU Consuming Processes
echo "[+] Top 5 CPU Consuming Processes:"
ps -eo pid,ppid,%cpu,%mem,comm --sort=-%cpu | head -n 6 | sed 's/^/  /'

# 2. Top 5 Memory Consuming Processes
echo -e "\n[+] Top 5 Memory Consuming Processes:"
ps -eo pid,ppid,%cpu,%mem,comm --sort=-%mem | head -n 6 | sed 's/^/  /'

# 3. Active External Outbound Connections Summary
echo -e "\n[+] Active ESTABLISHED Outbound Connections:"
# Uses 'ss' (modern replacement for netstat) to find established internet connections
ss -tunp state established 2>/dev/null | grep -v "127.0.0.1" | sed 's/^/  /' || echo "  No established external connections."

echo "=================================================="
