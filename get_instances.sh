#!/bin/bash

echo "removing old data"
rm /tmp/totalinstances.txt &> /dev/null 
rm /tmp/daily_count.csv &> /dev/null
echo "Getting Profiles"
grep profile ~/.aws/config | sed 's/\[//g;s/\]//g' | sed "s/\profile\b/ /g" > /tmp/profiles.txt

echo "Generating data"
./data/fetch.sh &> /dev/null && python data/loaddata.py &> /dev/null
echo "Uploading"
echo "Data Updated"
exit 0
