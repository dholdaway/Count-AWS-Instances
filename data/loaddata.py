#!/usr/bin/python

import csv
import MySQLdb

mydb = MySQLdb.connect(host='localhost',
    user='root',
    passwd='3upHEf2c',
    db='aws')
cursor = mydb.cursor()
cursor.execute("TRUNCATE TABLE `total`")

csv_data = csv.reader(file('/tmp/daily_count.csv'))
for row in csv_data:
    cursor.execute('INSERT INTO total(client, region, instances, date)''VALUES("%s", "%s", "%s", current_date)', row)
#close the connection to the database.
mydb.commit()
cursor.close()
print "Done"
