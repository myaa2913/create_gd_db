--ALTER TABLE firm_chars
--ADD COLUMN js_500_f_annual_0 numeric,
--ADD COLUMN num_reviews_0 numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     js_500_f_annual_0 numeric,
--     num_reviews_0 numeric
-- );

--\copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/JS_measures_combined_annual.csv' DELIMITER ',' quote '"' CSV HEADER;

INSERT INTO firm_chars(employerid,year,js_500_f_annual_0, num_reviews_0) 
SELECT employerid, year, js_500_f_annual_0, num_reviews_0
FROM cult_measure 
ON CONFLICT (employerid,year)
DO UPDATE
SET js_500_f_annual_0 = EXCLUDED.js_500_f_annual_0, num_reviews_0 = EXCLUDED.num_reviews_0; 

-- DROP TABLE cult_measure;
