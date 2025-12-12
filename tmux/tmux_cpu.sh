#!/usr/bin/env bash

# Get overall CPU usage (% user + % sys) on macOS
ps -A -o %cpu | awk 'NR>1 {s+=$1} END {printf "%.1f", s}'
