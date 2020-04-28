#this file does a subset extract from reviews_external_stanford.csv to clean up the csv
import csv, sys

csv.field_size_limit(sys.maxsize)

def extract():

    header = ['reviewID',
              'employerID',
              'userID',
              'gender',
              'birthYear',
              'highestEducation',
              'jobTitleID',
              'JobTitle',
              'GOC',
              'GOCconfidence',
              'MGOC',
              'MGOCconfidence',
              'reviewDateTime',
              'isCurrentJobFlag',
              'jobEndingYear',
              'OverallRating',
              'CareerOpps',
              'CompensationBenefits',
              'SeniorLeadership',
              'Worklife',
              'CultureValues',
              'employerName',
              'employerTypeCode',
              'numberEmployees',
              'annualRevenue',
              'industry',
              'sector',
              'pros',
              'cons']
    
    masterFile = open("/project/def-mcorrito/mcorrito/reviews_external_stanford.csv",'rU')
    newFile = open("/project/def-mcorrito/mcorrito/gd_preprocess.csv",'w')
    write = csv.writer(newFile)
    write.writerow(header)
    
    filtered = (line.replace('\0',' ') for line in masterFile)
    filtered = (line.replace('\r\n','. ') for line in filtered)
    filtered = (line.replace('\n','. ') for line in filtered)
    read = csv.reader(filtered,delimiter=",")

    next(read)
    
    for row in read:
        if len(row)==39:

            dataRow = [row[0],
                       row[1],
                       row[2],
                       row[3],
                       row[4],
                       row[5],
                       row[11],
                       row[12],
                       row[13],
                       row[14],
                       row[15],
                       row[16],
                       row[17],
                       row[18],
                       row[19],
                       row[20],
                       row[21],
                       row[22],
                       row[23],
                       row[24],
                       row[28],
                       row[29],
                       row[31],
                       row[32],
                       row[33],
                       row[34],
                       row[35],
                       row[36],
                       row[37]]
            
            write.writerow(dataRow)

    masterFile.close()
    newFile.close()

def main():    
    extract()

if __name__ == "__main__":
    main()




