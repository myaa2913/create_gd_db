This file details the structure of the Glassdoor sql database.

Cleaning notes: there are a few reviewId==-1 that need to be removed, as well as some duplicates reviewIds

..* reviewProCon
reviewId, numeric
pros, varchar
cons, varchar

..* reviewFeedback
reviewId, numeric
feedback, varchar

..* reviewRatings
reviewId, numeric


