__author__ = 'Olzhas'
import  csv
import psycopg2



def csv_reader(file_obj):

 # '''Read a csv file opens and parses the CSV file, creating a dictionary of items to be inserted into the database'''
    reader=csv.DictReader(file_obj, fieldnames=names)  
    return reader

def normalize(dic):
#  '''Here we normalize our dictionary remove whitespaces and capitalize values'''
    dictionary=dic
    
    dead = {'dead':False}  # here I am adding a new key:value pair dead:false
    dictionary.update(dead)
     
    for k, v in dictionary.items():
    
      if type(v)==str:
        
        n = v.strip()
        n = ' '.join(word[0].upper() + word[1:] for word in v.split())      
        dictionary[k] = n
                     
      if (v == ' ') or (v==''):
        
        dictionary[k] = None    
    
    return dictionary

def push_data(data):

#  '''Connect to our database to input normalized dictionary '''
        conn=psycopg2.connect("dbname='pets' user='action'")
        curs = conn.cursor() 

        query_3 = ('INSERT INTO pet (name, age, adopted, breed_id, shelter_id) VALUES (%(Name)s, %( age)s, %( adopted)s,(SELECT id FROM breed           WHERE (name = %( breed name)s AND species_id = (SELECT id FROM species WHERE name = %( species name)s))), (SELECT id FROM shelter WHERE name = %( shelter name)s))') 

             

        curs.execute(query_3,data)

        conn.commit()
        conn.close()
        


  

      
if __name__=="__main__":

    csv_path="data.csv"
    with open(csv_path, "r") as f_obj:
        names = csv.reader(f_obj).next() 
        dictionary=csv_reader(f_obj)
      
                
        for k in dictionary:
                data=normalize(k)
                push_data(data)


