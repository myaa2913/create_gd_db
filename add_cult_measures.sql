--NOTE: add 2016 annual JS/interpersonal diversity measure

--ALTER TABLE firm_chars
--ADD COLUMN js_500_f_annual_old numeric,
--ADD COLUMN nr_500_f_annual_old numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     js_500_f_annual_old numeric,
--     nr_500_f_annual_old numeric
-- );

--\copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/JS_measures_combined_annual.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,js_500_f_annual_old, nr_500_f_annual_old) 
-- SELECT employerid, year, js_500_f_annual_old, nr_500_f_annual_old
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET js_500_f_annual_old = EXCLUDED.js_500_f_annual_old, nr_500_f_annual_old = EXCLUDED.nr_500_f_annual_old; 

--DROP TABLE cult_measure;



--NOTE: add 2016 annual herf/intrapersonal diversity measure
--ALTER TABLE firm_chars
--ADD COLUMN h_500_f_ind_annual_old numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     h_500_f_ind_annual_old numeric
-- );

-- \copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/h_measures_combined_ind_annual.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,h_500_f_ind_annual_old) 
-- SELECT employerid, year, h_500_f_ind_annual_old
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET h_500_f_ind_annual_old = EXCLUDED.h_500_f_ind_annual_old; 

-- DROP TABLE cult_measure;



-- --NOTE: add 2018 annual JS/interpersonal diversity measure
-- ALTER TABLE firm_chars
-- ADD COLUMN js_500_f_annual_new numeric,
-- ADD COLUMN nr_500_f_annual_new numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     js_500_f_annual_new numeric,
--     nr_500_f_annual_new numeric
-- );

-- \copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/JS_measures_combined_annual_new.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,js_500_f_annual_new, nr_500_f_annual_new) 
-- SELECT employerid, year, js_500_f_annual_new, nr_500_f_annual_new
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET js_500_f_annual_new = EXCLUDED.js_500_f_annual_new, nr_500_f_annual_new = EXCLUDED.nr_500_f_annual_new; 

-- DROP TABLE cult_measure;



--NOTE: add 2018 annual herf/intrapersonal diversity measure
-- ALTER TABLE firm_chars
-- ADD COLUMN h_500_f_ind_annual_new numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     h_500_f_ind_annual_new numeric
-- );

-- \copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/h_measures_combined_ind_annual_new.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,h_500_f_ind_annual_new) 
-- SELECT employerid, year, h_500_f_ind_annual_new
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET h_500_f_ind_annual_new = EXCLUDED.h_500_f_ind_annual_new; 

-- DROP TABLE cult_measure;



--NOTE: add 2018 annual within-firm JS/interpersonal diversity measure
-- ALTER TABLE firm_chars
-- ADD COLUMN js_within_40_f_annual_new numeric,
-- ADD COLUMN nr_js_within_40_f_annual_new numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     js_within_40_f_annual_new numeric,
--     nr_js_within_40_f_annual_new numeric
-- );

-- \copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/JS_measures_within_40_annual.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,js_within_40_f_annual_new, nr_js_within_40_f_annual_new) 
-- SELECT employerid, year, js_within_40_f_annual_new, nr_js_within_40_f_annual_new
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET js_within_40_f_annual_new = EXCLUDED.js_within_40_f_annual_new, nr_js_within_40_f_annual_new = EXCLUDED.nr_js_within_40_f_annual_new; 

-- DROP TABLE cult_measure;


--NOTE: add 2018 annual within-firm herf/intrapersonal diversity measure
-- ALTER TABLE firm_chars
-- ADD COLUMN h_within_ind_40_f_annual_new numeric;

-- CREATE TABLE cult_measure (
--     employerid numeric,
--     year numeric,
--     h_within_ind_40_f_annual_new numeric
-- );

-- \copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/h_measures_within_40_annual.csv' DELIMITER ',' quote '"' CSV HEADER;

-- INSERT INTO firm_chars(employerid,year,h_within_ind_40_f_annual_new) 
-- SELECT employerid, year, h_within_ind_40_f_annual_new
-- FROM cult_measure 
-- ON CONFLICT (employerid,year)
-- DO UPDATE
-- SET h_within_ind_40_f_annual_new = EXCLUDED.h_within_ind_40_f_annual_new; 

-- DROP TABLE cult_measure;




--NOTE: add 2016 annual JS/interpersonal diversity measure for the full set of glassdoor firms
ALTER TABLE firm_chars
ADD COLUMN js_500_f_annual_old_expand numeric,
ADD COLUMN nr_500_f_annual_old_expand numeric;

CREATE TABLE cult_measure (
    employerid numeric,
    year numeric,
    js_500_f_annual_old_expand numeric,
    nr_500_f_annual_old_expand numeric
);

\copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/JS_measures_combined_annual_expand.csv' DELIMITER ',' quote '"' CSV HEADER;

INSERT INTO firm_chars(employerid,year,js_500_f_annual_old_expand, nr_500_f_annual_old_expand) 
SELECT employerid, year, js_500_f_annual_old_expand, nr_500_f_annual_old_expand
FROM cult_measure 
ON CONFLICT (employerid,year)
DO UPDATE
SET js_500_f_annual_old_expand = EXCLUDED.js_500_f_annual_old_expand, nr_500_f_annual_old_expand = EXCLUDED.nr_500_f_annual_old_expand; 

DROP TABLE cult_measure;



--NOTE: add 2016 annual JS/interpersonal diversity measure for the full set of glassdoor firms (alternate version: highly correlated but unclear to me why it's different)
ALTER TABLE firm_chars
ADD COLUMN js_500_f_annual_old_expand_updt numeric,
ADD COLUMN nr_500_f_annual_old_expand_updt numeric;

CREATE TABLE cult_measure (
    employerid numeric,
    year numeric,
    js_500_f_annual_old_expand_updt numeric,
    nr_500_f_annual_old_expand_updt numeric
);

\copy cult_measure FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/JS_measures_combined_annual_expand_updt.csv' DELIMITER ',' quote '"' CSV HEADER;

INSERT INTO firm_chars(employerid,year,js_500_f_annual_old_expand_updt, nr_500_f_annual_old_expand_updt) 
SELECT employerid, year, js_500_f_annual_old_expand_updt, nr_500_f_annual_old_expand_updt
FROM cult_measure 
ON CONFLICT (employerid,year)
DO UPDATE
SET js_500_f_annual_old_expand_updt = EXCLUDED.js_500_f_annual_old_expand_updt, nr_500_f_annual_old_expand_updt = EXCLUDED.nr_500_f_annual_old_expand_updt; 

DROP TABLE cult_measure;
