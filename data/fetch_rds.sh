#!/bin/bash
while read Profile; do " $Profile " < /tmp/profiles.txt
    while read line; do 
	aws rds describe-db-instances --query 'DBInstances.[*].DBName' --region "$line" --profile "$Profile" --output text | tee tmp
	sed "s/$/\t$Profile/" tmp >> /tmp/total_rds.txt
	    if [ -s tmp ]; 
		then 
		 wc tmp | sed "s/tmp/$Profile/" | sed -e "s/^/$line/" | awk '{print $3","$5}' | tee --append /tmp/daily_count_rds.csv
	    fi 
    done < data/regions.txt
done < /tmp/profiles.txt
rm tmp
