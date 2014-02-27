#!/usr/bin/python

import csv
import MySQLdb

mydb = MySQLdb.connect(host='localhost',
    user='root',
    passwd='3upHEf2c',
    db='aws')
cursor = mydb.cursor()
#cursor.execute("TRUNCATE TABLE `instances`")
#cursor.execute("ALTER TABLE total rds = NULL;")
#mydb.commit()
csv_data = csv.reader(file('/tmp/daily_count_rds.csv'))
for row in csv_data:
    #cursor.execute('INSERT INTO instances(client, region, number_of_instances, date)''VALUES("%s", "%s", "%s", current_date)', row)
#close the connection to the database.
     cursor.execute('update total set rds = "%s" where client = "%s" and region = "%s"',row)
    # cursor.execute ("UPDATE instances SET rds=%s, WHERE client ='%s' and region ='%s' " % (rds, client, region),row)

mydb.commit()
cursor.close()
print "Done"
