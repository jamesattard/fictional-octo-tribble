# This script will run every 30m
# count the number of lines of all .log files /var/log
# append the counts to the file /root/counts.log in the format
# datetime | filename | number of lines

# Standard mode
find /var/log/ -name '*.log' | xargs wc -l | awk '{print strftime("%Y-%m-%d %r") "|" $1 "|" $2}' >> /root/counts.log
