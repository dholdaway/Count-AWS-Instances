#!/bin/bash
clear
echo "Getting Profiles"
grep profile ~/.aws/config | sed 's/\[//g;s/\]//g' | sed "s/\profile\b/ /g" > /tmp/profiles.txt
grep Account ~/.aws/config | sed 's/\[//g;s/\]//g' | sed "s/\Account\b/ /g" > /tmp/accounts.txt
grep Name ~/.aws/config | sed 's/\[//g;s/\]//g' | sed "s/\Name\b/ /g"  > /tmp/names.txt
pr -m -t -s\  /tmp/accounts.txt /tmp/profiles.txt /tmp/names.txt | awk '{print $2,","$3,$4,$5,","$6,$1}' | sed 's/ //g' > /tmp/account_profile.csv
#cat /tmp/account_profile.csv
exit 0
