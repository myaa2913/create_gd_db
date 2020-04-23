DROP TABLE raw;

CREATE TABLE raw
(
    reviewID numeric, 
    employerID numeric,
    userID numeric,
    gender TEXT,
    birthYear numeric,
    highestEducation TEXT,
    metroID numeric,
    metroName TEXT,
    stateID numeric,
    stateName varchar(2),
    countryID numeric,
    jobTitleID numeric,
    JobTitle TEXT,
    GOC TEXT,
    GOCconfidence numeric,
    MGOC TEXT,
    MGOCconfidence numeric,
    reviewDateTime timestamp,
    isCurrentJobFlag smallint,
    jobEndingYear smallint,
    OverallRating numeric,
    CareerOpps numeric,
    CompensationBenefits numeric,
    SeniorLeadership numeric,
    Worklife numeric,
    CultureValues numeric,
    RecommendFriend varchar(3),
    BusinessOutlook TEXT,
    CEO TEXT,
    employerName TEXT,
    websiteURL TEXT,
    employerTypeCode varchar,
    numberEmployees numeric,
    annualRevenue numeric,
    industry TEXT,
    sector TEXT,
    pros TEXT,
    cons TEXT,
    feedback TEXT    
);

\copy raw FROM '~/projects/def-mcorrito/mcorrito/reviews_external_stanford.csv' DELIMITER ',' quote '''' CSV HEADER;

