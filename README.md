##### This repository processes reviews_external_stanford.csv (the 2018 glassdoor pull), and uploads to a PSQL database.

1. run preprocess_csv.py to remove problematic characters (ex. line breaks) from the csv file.

2. run create_db.sql.