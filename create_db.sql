--create raw staging table

-- CREATE TABLE raw
-- (
--     reviewID numeric, 
--     employerID numeric,
--     userID numeric,
--     gender TEXT,
--     birthYear numeric,
--     highestEducation TEXT,
--     jobTitleID numeric,
--     JobTitle TEXT,
--     GOC TEXT,
--     GOCconfidence numeric,
--     MGOC TEXT,
--     MGOCconfidence numeric,
--     reviewDateTime timestamp,
--     isCurrentJobFlag smallint,
--     jobEndingYear smallint,
--     OverallRating numeric,
--     CareerOpps numeric,
--     CompensationBenefits numeric,
--     SeniorLeadership numeric,
--     Worklife numeric,
--     CultureValues numeric,
--     employerName TEXT,
--     employerTypeCode varchar,
--     numberEmployees numeric,
--     annualRevenue numeric,
--     industry TEXT,
--     sector TEXT,
--     pros TEXT,
--     cons TEXT
-- );

-- \copy raw FROM '~/projects/def-mcorrito/mcorrito/gd_preprocess.csv' DELIMITER ',' quote '"' CSV HEADER;


-- create review_pro_con table 
CREATE TABLE review_pro_con
(
    reviewid numeric NOT NULL, 
    userid numeric NOT NULL,
    employerid numeric NOT NULL,
    review_date DATE NOT NULL, 
    iscurrentjobflag smallint,
    pros TEXT,
    cons TEXT
);

CREATE UNIQUE INDEX review_pro_con_index ON review_pro_con (reviewid); 

INSERT INTO review_pro_con
SELECT reviewid,
       userid,
       employerid,
       DATE(reviewdatetime) AS review_date,
       iscurrentjobflag,
       pros,
       cons
FROM raw
ON CONFLICT (reviewid) DO NOTHING;


-- create review_ratings table 
CREATE TABLE review_ratings
(
    reviewid numeric NOT NULL, 
    userid numeric NOT NULL,
    employerid numeric NOT NULL,
    review_date DATE NOT NULL,
    iscurrentjobflag smallint,
    overallrating numeric,
    careeropps numeric,
    compensationbenefits numeric,
    seniorleadership numeric,
    worklife numeric,
    culturevalues numeric
);

CREATE UNIQUE INDEX review_ratings_index ON review_ratings (reviewid); 

INSERT INTO review_ratings
SELECT reviewid,
       userid,
       employerid,
       DATE(reviewdatetime) AS review_date,
       iscurrentjobflag,
       overallrating,
       careeropps,
       compensationbenefits,
       seniorleadership,
       worklife,
       culturevalues
FROM raw
ON CONFLICT (reviewid) DO NOTHING;


-- create review_user_chars table 
CREATE TABLE review_user_chars
(
    reviewid numeric NOT NULL, 
    userid numeric NOT NULL,
    gender TEXT,
    birthyear numeric,
    highesteducation TEXT,
    jobtitleid numeric,
    jobtitle TEXT,
    goc TEXT,
    gocconfidence numeric,
    mgoc TEXT,
    mgocconfidence numeric,
    jobendingyear smallint
);

CREATE UNIQUE INDEX review_user_chars_index ON review_user_chars (reviewid); 

INSERT INTO review_user_chars
SELECT reviewid, 
       userid,
       gender,
       birthyear,
       highesteducation,
       jobtitleid,
       jobtitle,
       goc,
       gocconfidence,
       mgoc,
       mgocconfidence,
       jobendingyear
FROM raw
ON CONFLICT (reviewid) DO NOTHING;


-- create firm_chars table 
CREATE TABLE firm_chars
(
    employerid numeric NOT NULL,
    year numeric NOT NULL,
    employerName TEXT,
    employerTypeCode varchar,
    numberEmployees numeric,
    annualRevenue numeric,
    industry TEXT,
    sector TEXT
);

CREATE UNIQUE INDEX firm_chars_index ON firm_chars (employerid,year); 

INSERT INTO firm_chars
SELECT employerid, 
       date_part('year',reviewdatetime) AS year,
       employerName,
       employerTypeCode,
       numberEmployees,
       annualRevenue,
       industry,
       sector
FROM raw
ON CONFLICT (employerid,year) DO NOTHING;
