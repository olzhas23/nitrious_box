__author__ = 'Olzhas'

import  csv
import  psycopg2.extras
import psycopg2
import pprint



'''
opens and parses the CSV file, creating a dictionary of items to be inserted into the database. !

inserts a new row in the Pet table for each entry in the dictionary

Although it need not happen in a single step, after the script has run,
each row in the pets table should contain values for name, age, and adopted,
as well as foreign key entries for breed, species, and shelter

Missing values in the CSV should go to null in the database.

Any breeds, species, or shelters that appear in the CSV that are NOT already in the database should be added.

Your script will need to normalize for capitalization. For instance,
if "laBrador Retriever" appeared in the CSV and "labrador retriever" in the DB,
these should be treated as referencing the same thing.

There are multiple ways to achieve this. Try to think about what will be
the most efficient in terms of making the fewest queries to the database.'''


def csv_reader(file_obj):

    '''Read a csv file'''
    reader=csv.DictReader(file_obj)
    print (type(reader))
     
    '''Here we connect to our database to input our dictionary from csv to db'''
    conn=psycopg2.connect("dbname='pets' user='action'")
    curs=conn.cursor()   
    curs.execute("SELECT * FROM breed ")# here i want to check if i was able to connect to db
      
    for record in curs:
        print "RECORD:", record
        
    query=('INSERT INTO pet ( adopted ,name, shelter_id, age ,breed_id, name) VALUES(%s,%s,%s,%s,%s,%s)')
      
      
      
    for row in reader:
        print (row)  
        print type(row)
        print query
        print row
        curs.executemany(query,row)
      
        conn.commit()
      
        conn.close()
    
if __name__=="__main__":

    csv_path="data.csv"
    with open(csv_path, "r") as f_obj:
        csv_reader(f_obj)

