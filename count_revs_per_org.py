import pandas as pd
import psycopg2, sys

# define a function that handles and parses psycopg2 exceptions
def print_psycopg2_exception(err):
    # get details about the exception
    err_type, err_obj, traceback = sys.exc_info()

    # get the line number when exception occured
    line_num = traceback.tb_lineno

    # print the connect() error
    print ("\npsycopg2 ERROR:", err, "on line number:", line_num)
    print ("psycopg2 traceback:", traceback, "-- type:", err_type)

    # psycopg2 extensions.Diagnostics object attribute
    print ("\nextensions.Diagnostics:", err.diag)

    # print the pgcode and pgerror exceptions
    print ("pgerror:", err.pgerror)
    print ("pgcode:", err.pgcode, "\n")
    

try:
    conn = psycopg2.connect(database="mcorrito_db",
                            host="cedar-pgsql-vm",
                            user="mcorrito")

except OperationalError as err:
    print_psycopg2_exception(err)
    conn = None

   
if conn!=None:
    cur = conn.cursor()

    try:
        # cur.execute("""CREATE TABLE temp_num_reviews (\
        #               num_reviews numeric,\
        #               year numeric,\
        #               employerid numeric)""")
        # conn.commit()
        
        cur.execute("""SELECT COUNT(reviewid) AS num_reviews,
                              date_part('year',review_date) AS year,\
                              employerid\
                       INTO temp_num_reviews\
                       FROM review_pro_con\
                       GROUP BY employerid,
                                year""")
        conn.commit()
        
        cur.execute("""ALTER TABLE firm_chars ADD COLUMN num_reviews numeric""")
        conn.commit()
        
        cur.execute("""UPDATE firm_chars\
                       SET num_reviews = temp_num_reviews.num_reviews\
                       FROM temp_num_reviews\
                       WHERE firm_chars.employerid = temp_num_reviews.employerid\
                             AND firm_chars.year = temp_num_reviews.year""")
        conn.commit()
        
        cur.execute("""DROP TABLE temp_num_reviews""")
        conn.commit()
        
    except Exception as err:
        print_psycopg2_exception(err)

    cur.close()
conn.close()


#                       WHERE NULLIF(trim(from pros),'') IS NOT NULL\
