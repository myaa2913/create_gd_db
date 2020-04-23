#this file does a subset extract from reviews_external_stanford.csv to clean up the csv
import csv, sys

csv.field_size_limit(sys.maxsize)

def extract():

    masterFile = open("/project/def-mcorrito/mcorrito/reviews_external_stanford.csv",'rU')
    newFile = open("/project/def-mcorrito/mcorrito/gd_preprocess.csv",'w')
    write = csv.writer(newFile)

    filtered = (line.replace('\0',' ') for line in masterFile)
    filtered = (line.replace('\r\n','. ') for line in filtered)
    filtered = (line.replace('\n','. ') for line in filtered)
    read = csv.reader(filtered,delimiter=",")

    header = next(read)
    write.writerow(header)
    
    for row in read:
        if len(row)==39:

            write.writerow(row)

    masterFile.close()
    newFile.close()

extract()
