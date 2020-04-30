--NOTE: add 2016 annual JS/interpersonal diversity measure

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

-- INSERT INTO firm_chars(employerid,year,js_500_f_annual_0, num_reviews_0) 
-- SELECT employerid, year, js_500_f_annual_0, num_reviews_0
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET js_500_f_annual_0 = EXCLUDED.js_500_f_annual_0, num_reviews_0 = EXCLUDED.num_reviews_0; 

--DROP TABLE cult_measure;



--NOTE: add 2016 annual herf/intrapersonal diversity measure
--ALTER TABLE firm_chars
--ADD COLUMN h_500_f_ind_annual_0 numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     h_500_f_ind_annual_0 numeric
-- );

-- \copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/h_measures_combined_ind_annual.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,h_500_f_ind_annual_0) 
-- SELECT employerid, year, h_500_f_ind_annual_0
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET h_500_f_ind_annual_0 = EXCLUDED.h_500_f_ind_annual_0; 

-- DROP TABLE cult_measure;



--NOTE: add 2018 annual JS/interpersonal diversity measure
