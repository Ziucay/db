# create db
# psql -d template1
import psycopg2
from faker import Faker

con = psycopg2.connect(database="lab5btree", user="postgres",
                       password="lk1js@4fd*GH6", host="127.0.0.1", port="5432")

print("Database opened successfully")
cur = con.cursor()
cur.execute('''CREATE TABLE CUSTOMER
       (ID INT PRIMARY KEY     NOT NULL,
       Name           TEXT    NOT NULL,
       Address            TEXT     NOT NULL,
       Age INT,
       review        TEXT);''')
print("Table created successfully")
fake = Faker()
for i in range(100000):
    print(i)
    cur.execute("INSERT INTO CUSTOMER (ID,Name,Address,Age,review) VALUES ('"+str(i)+"','"+fake.name()+"','"+fake.address()+"','"+str(fake.random_int(min=20, max=50))+"','"+fake.text()+"')")
    con.commit()