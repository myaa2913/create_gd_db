###### This file details the structure of the Glassdoor sql database.

1. run preprocess_csv.py to remove problematic characters (ex. line breaks) from the csv file.

2. run create_db.sql.
  * uploads the columns I need to a placeholder sql table (raw)
  * test  


######Cleaning notes: there are a few reviewId==-1 that need to be removed, as well as some duplicates reviewIds

  * reviewProCon

reviewId numeric,

pros TEXT,

cons TEXT

  * reviewFeedback

reviewId numeric,

feedback TEXT

  * reviewRatings

reviewId numeric,

OverallRating numeric,

CareerOpps numeric,

CompensationBenefits numeric,

SeniorLeadership numeric,

Worklife numeric,

CultureValues numeric,

RecommendFriend varchar(3),

BusinessOutlook 27,

CEO 28,

