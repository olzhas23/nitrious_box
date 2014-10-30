__author__ = 'Olzhas'
import  csv
import psycopg2



def csv_reader(file_obj):
    """Read a csv file opens and parses the CSV file,creating a dictionary of items to be inserted into the database"""

    reader=csv.DictReader(file_obj, fieldnames=names)  
    return reader

def normalize(dic):
    '''Here we normalize our dictionary remove whitespaces, capitalize values and replace empty values with None(null for DB)'''
    dictionary=dic
    
    '''New key:value pair'''
    dead = {'dead':False} 
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
        
        '''Connect to our database to input normalized dictionary '''
        
        conn=psycopg2.connect("dbname='pets' user='action'")
        curs = conn.cursor() 

        query = ('INSERT INTO pet (name, age, adopted, breed_id, shelter_id) VALUES (%(Name)s, %( age)s, %( adopted)s,(SELECT id FROM breed           WHERE (name = %( breed name)s AND species_id = (SELECT id FROM species WHERE name = %( species name)s))), (SELECT id FROM shelter WHERE name = %( shelter name)s))') 

             

        curs.execute(query,data)

        conn.commit()
        conn.close()
        print "Data commited"
        


  

      
if __name__=="__main__":
    
    '''Here we connect to our csv file'''
    csv_path="data.csv"
    '''Read file'''
    with open(csv_path, "r") as f_obj:
        names = csv.reader(f_obj).next() 
        dictionary=csv_reader(f_obj)
      
        '''Here we pass our dictionary to database, we use loop as csv.DicReader returns dictionary(of dictionaries) and we have to iterate'''        
        for k in dictionary:
                data=normalize(k)
                push_data(data)


