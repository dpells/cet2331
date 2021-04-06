#!/bin/bash
# Assignment 09

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Assignment 09

# Question 1

echo '/etc/crontab' | tee -a $outfile
tail /etc/crontab | tee -a $outfile
blank_line


echo '/var/spool/cron/crontabs/linuxuser' | tee -a $outfile
tail /var/spool/cron/crontabs/linuxuser | tee -a $outfile
blank_line


echo '/var/spool/cron/crontabs/root' | tee -a $outfile
tail /var/spool/cron/crontabs/root | tee -a $outfile
blank_line


mail_out Assignment 09
