##### This file details the structure of the Glassdoor sql database.

1. run preprocess_csv.py to remove problematic characters (ex. line breaks) from the csv file.

2. run create_db.sql.
  * uploads the columns I need to a placeholder sql table (raw)
  * test  


###### Cleaning notes: there are a few reviewId==-1 that need to be removed, as well as some duplicates reviewIds

##### review_pro_con

reviewid numeric NOT NULL

userid numeric NOT NULL

pros TEXT

cons TEXT



##### review_ratings

reviewid numeric NOT NULL

userid numeric NOT NULL

overallrating numeric

careeropps numeric

compensationbenefits numeric

seniorleadership numeric

worklife numeric

culturevalues numeric



##### user_chars

reviewid numeric

userid numeric

gender text

birthyear text

highesteducation text

jobtitleid numeric

jobtitle text

goc text

gocconfidence numeric

mgoc text

mgocconfidence numeric

iscurrentjobflag smallint

jobendingyear smallint



##### firm_chars

employerid numeric

year date

employername text

employertypecode text

numberemployees numeric

annualrevenue numeric

industry text

sector text


##### crosswalk

employerid numeric

reviewid numeric

userid numeric

