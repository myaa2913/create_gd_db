This file details the structure of the Glassdoor sql database.

Cleaning notes: there are a few reviewId==-1 that need to be removed, as well as some duplicates reviewIds

..* reviewProCon
reviewId numeric,
pros TEXT,
cons TEXT

..* reviewFeedback
reviewId numeric,
feedback TEXT

..* reviewRatings
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

