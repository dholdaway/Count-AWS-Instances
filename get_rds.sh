#!/bin/bash

echo "removing old data"
rm /tmp/total_rds.txt &> /dev/null 
rm /tmp/daily_count_rds.csv &> /dev/null
echo "Getting Profiles"
grep profile ~/.aws/config | sed 's/\[//g;s/\]//g' | sed "s/\profile\b/ /g" > /tmp/profiles.txt
echo "Generating data"
./data/fetch_rds.sh && python data/loaddata.py #&> /dev/null
echo "Uploading"
echo "Data Updated"
exit 0
