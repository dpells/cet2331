#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info_midterm Final Exam

# Question 1

entity_exists 1 falcon group
entity_exists 1 speeder group
entity_exists 1 rebel group
entity_exists 1 desert group
entity_exists 1 deathstar group
blank_line
entity_exists 1 luke passwd
user_param 1 comment luke "Mark Hammill"
user_param 1 user_in_group luke speeder
user_param 1 user_in_group luke rebel
user_param 1 user_in_group luke falcon
user_param 1 pass_exists luke
blank_line
entity_exists 1 han passwd
user_param 1 comment han "Harrison Ford"
user_param 1 user_in_group han falcon
user_param 1 user_in_group han speeder
user_param 1 user_in_group han rebel
user_param 1 pass_exists han
blank_line
entity_exists 1 leia passwd
user_param 1 comment leia "Carrie Fisher"
user_param 1 user_in_group leia falcon
user_param 1 account_expiry leia 2125-01-01
user_param 1 pass_exists leia
blank_line
entity_exists 1 obiwan passwd
user_param 1 comment obiwan "Alec Guiness"
user_param 1 user_in_group obiwan desert
user_param 1 account_expiry obiwan 2125-01-01
user_param 1 pass_exists obiwan
blank_line
entity_exists 1 vader passwd
user_param 1 comment vader "James Earl Jones"
user_param 1 user_in_group vader deathstar
user_param 1 account_expiry vader 2125-01-01
user_param 1 pass_exists vader
blank_line

check_existence 2 /home/StarWars d
check_existence 2 /home/StarWars/Tatooine d
check_existence 2 /home/StarWars/Falcon d
check_existence 2 /home/StarWars/Falcon/Smuggler d
check_existence 2 /home/StarWars/Falcon/Blaster f
check_existence 2 /home/StarWars/Destroyer d
check_existence 2 /home/StarWars/Destroyer/MoffTarkin f
check_existence 2 /home/StarWars/Destroyer/DetentionLevel d
blank_line

check_owner 4 /home/StarWars root
check_group 4 /home/StarWars root
check_permissions 4 /home/StarWars drwxrwxr-x
check_owner 4 /home/StarWars/Falcon han
check_group 4 /home/StarWars/Falcon rebel
check_permissions 4 /home/StarWars/Falcon drwxrwx---
check_owner 4 /home/StarWars/Destroyer root
check_group 4 /home/StarWars/Destroyer deathstar
check_permissions 4 /home/StarWars/Destroyer drwxrwxr-x
check_owner 4 /home/StarWars/Falcon/Blaster han
check_group 4 /home/StarWars/Falcon/Blaster falcon
check_permissions 4 /home/StarWars/Falcon/Blaster -r-xr-x---
check_owner 4 /home/StarWars/Destroyer/MoffTarkin vader
check_group 4 /home/StarWars/Destroyer/MoffTarkin deathstar
check_permissions 4 /home/StarWars/Destroyer/MoffTarkin -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
check_existence 5 /home/StarWars/warpowers f
ls -l /home/StarWars/warpowers | tee -a $outfile
blank_line
echo -e "find Command contents of /home/StarWars/warp.txt" | tee -a $outfile
check_existence 5 /home/StarWars/warp.txt f
tail -5 /home/StarWars/warp.txt | tee -a $outfile
blank_line
echo -e "grep:" | tee -a $outfile
check_existence 6 /home/StarWars/host.txt f
tail -5 /home/StarWars/host.txt | tee -a $outfile
blank_line

check_existence 7 /tmp/StarWars.tar.gz f
tar -tzvf /tmp/StarWars.tar.gz | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | sed '/^$/d' |  tee -a $outfile
blank_line

package_check 10 moon-buggy
dpkg --list moon-buggy | tee -a $outfile
blank_line

package_check 10 nmap
blank_line
mail_out_test Final Exam
