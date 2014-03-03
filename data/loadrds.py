#!/usr/bin/python

import csv
import MySQLdb

mydb = MySQLdb.connect(host='localhost',
    user='root',
    passwd='3upHEf2c',
    db='aws')
cursor = mydb.cursor()
#	cursor.execute('alter table total modify rds set default 0')
#mydb.commit()
csv_data = csv.reader(file('/tmp/daily_count_rds.csv'))
for row in csv_data:
	cursor.execute('UPDATE total SET rds = COALESCE (rds, 0) + %s where aws_profile_name = "%s"',row)
mydb.commit()
cursor.close()
print "Done"
