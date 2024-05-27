#!/bin/bash

# Set the threshold for CPU usage to trigger adjustments
THRESHOLD=80

# Get the current CPU usage percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

echo "Current CPU Usage: $CPU_USAGE%"

# Check if CPU usage exceeds the threshold
if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
    echo "High CPU usage detected. Adjusting CPU governor."

    # Set CPU governor to performance for better performance
    echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
else
    echo "CPU usage is within acceptable limits."
    
    # Set CPU governor to ondemand for power savings
    echo "ondemand" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
fi

=============================================================================
#!/bin/bash
# This script monitors CPU and memory usage

while :
do 
  # Get the current usage of CPU and memory
  cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
  memUsage=$(free -m | awk '/Mem/{print $3}')

  # Print the usage
  echo "CPU Usage: $cpuUsage%"
  echo "Memory Usage: $memUsage MB"
 
  # Sleep for 1 second
  sleep 1
done