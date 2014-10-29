__author__ = 'Olzhas'

import  csv
import  psycopg2.extras
import psycopg2
import pprint



'''
 !



Although it need not happen in a single step, after the script has run,
each row in the pets table should contain values for name, age, and adopted,
as well as foreign key entries for breed, species, and shelter

Missing values in the CSV should go to null in the database.!

Any breeds, species, or shelters that appear in the CSV that are NOT already in the database should be added.

Your script will need to normalize for capitalization. For instance,
if "laBrador Retriever" appeared in the CSV and "labrador retriever" in the DB,
these should be treated as referencing the same thing.

'''


def csv_reader(file_obj):

    '''Read a csv file opens and parses the CSV file, creating a dictionary of items to be inserted into the database.'''
 
    reader=csv.DictReader(file_obj, fieldnames=names)
   
          

     
    '''Here we connect to our database to input our dictionary from csv to db'''
    conn=psycopg2.connect("dbname='pets' user='action'")
    curs=conn.cursor()   
    
    '''curs.execute("SELECT * FROM breed ")# here i want to check if i was able to connect to db
      
    
    for record in curs:
        print "RECORD:", record'''
    
        
    '''inserts a new row in the Pet table for each entry in the dictionary !'''    
    query=('INSERT INTO pet ( adopted,breed_id, name, shelter_id, age, dead) VALUES(%s,(SELECT id from breed WHERE name=%s),%s,(SELECT id from shelter WHERE name=%s),%s,%s)')
                         
      
      
    for key in reader:
        
        print key
        print type(key)
        
        
      
        new_dic = {key: value for key, value in key.items() if key!= ' species name'}     
        #new_dic1 = {key: value for key, value in new_dic.items() if key !=' breed name'}
       # new_dic2 = {key: value for key, value in new_dic1.items() if key !=' shelter name'}
        
        dead = {'dead':False}  # here I am adding a new key:value pair dead:false
        new_dic.update(dead)
        
        
        for k, v in new_dic.items():
        
          if v == ' ':
              new_dic[k] = None    
              print k
              print v
            
        v=new_dic.values()   
        k=new_dic.keys()
        
        print v
        
        '''Here I am commiting my list of values to database adopted, age, name'''
        curs.execute(query, v)
      
        conn.commit()
      
      
    
if __name__=="__main__":

    csv_path="data.csv"
    with open(csv_path, "r") as f_obj:
        names = csv.reader(f_obj).next() 
        csv_reader(f_obj)
        

