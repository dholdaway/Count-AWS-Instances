#!/usr/bin/python

import csv
import MySQLdb

mydb = MySQLdb.connect(host='localhost',
    user='root',
    passwd='3upHEf2c',
    db='aws')
cursor = mydb.cursor()
cursor.execute("TRUNCATE TABLE `total`")

csv_client = csv.reader(file('/tmp/account_profile.csv'))
for row in csv_client:
	cursor.execute('INSERT INTO total(aws_profile_name, client, account_number, date)''VALUES("%s", "%s", "%s", current_date)',row)
mydb.commit()
	
csv_data = csv.reader(file('/tmp/daily_count.csv'))
for row in csv_data:
       cursor.execute('UPDATE total SET instances = COALESCE(instances, 0) + %s where aws_profile_name = "%s"',row)
mydb.commit()
cursor.close()
print "Done"
