#!/bin/bash
clear
echo "removing old data"
rm /tmp/totalinstances.txt &> /dev/null 
rm /tmp/daily_count.csv &> /dev/null
rm /tmp/total_rds.txt &> /dev/null
rm /tmp/daily_count_rds.csv &> /dev/null
echo "Getting Profiles"
grep profile ~/.aws/config | sed 's/\[//g;s/\]//g' | sed "s/\profile\b/ /g" > /tmp/profiles.txt
./get_account.sh &> /dev/null
echo "Generating Instance Total"
./data/fetch.sh &> /dev/null && 
python data/loaddata.py &> /dev/null
echo "Generating Rds Total"
./data/fetch_rds.sh &> /dev/null && 
python data/loadrds.py &> /dev/null
echo "Uploading"
echo "Data Updated"
exit 0
