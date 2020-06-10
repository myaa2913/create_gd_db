--NOTE: add corpids from orgid_corpid20062009_cross.csv

-- CREATE TABLE HH_corpids (
--     employerid numeric,
--     corpid numeric
-- );

-- \copy HH_corpids FROM '~/projects/def-mcorrito/mcorrito/HH/hank/temp_data/orgid_corpid20062009_cross.csv' DELIMITER ',' quote '"' CSV HEADER;

-- SELECT firm_chars.*,
--        hh_corpids.corpid
-- INTO firm_chars2
-- FROM firm_chars
-- LEFT JOIN hh_corpids on hh_corpids.employerid = firm_chars.employerid; 

-- DROP TABLE firm_chars;
-- ALTER TABLE firm_chars2 RENAME TO firm_chars;
-- ALTER TABLE firm_chars alter column employerid set not null,
--                        alter column year set not null;

--NOTE: add gvkeys from compustat
-- ALTER TABLE firm_chars
-- ADD COLUMN gvkey numeric;

--CREATE TEMP TABLE W GVKEYS FROM CSV FILE
CREATE TABLE temp_gvkey (
       orgid numeric,
       gvkey numeric,
       orgname text,
       dup numeric
);

\copy temp_gvkey FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/final_orgid_gvkey_02102020.csv' DELIMITER ',' quote '"' CSV HEADER;

UPDATE firm_chars
SET gvkey = temp_gvkey.gvkey
FROM temp_gvkey
WHERE firm_chars.employerid = temp_gvkey.orgid;

DROP TABLE temp_gvkey;
