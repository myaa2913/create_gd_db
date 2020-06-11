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
-- CREATE TABLE temp_gvkey (
--        orgid numeric,
--        gvkey numeric,
--        orgname text,
--        dup numeric
-- );

-- \copy temp_gvkey FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/final_orgid_gvkey_02102020.csv' DELIMITER ',' quote '"' CSV HEADER;

-- UPDATE firm_chars
-- SET gvkey = temp_gvkey.gvkey
-- FROM temp_gvkey
-- WHERE firm_chars.employerid = temp_gvkey.orgid;

-- DROP TABLE temp_gvkey;


--NOTE: add other compustat information
ALTER TABLE firm_chars
ADD COLUMN cusip text,
ADD COLUMN assets numeric,
ADD COLUMN ceq numeric,
ADD COLUMN cogs numeric,
ADD COLUMN csho numeric,
ADD COLUMN ebit numeric,
ADD COLUMN ebitda numeric,
ADD COLUMN emp numeric,
ADD COLUMN ibc numeric,
ADD COLUMN lt numeric,
ADD COLUMN ni numeric,
ADD COLUMN revt numeric,
ADD COLUMN sale numeric,
ADD COLUMN teq numeric,
ADD COLUMN txdb numeric,
ADD COLUMN xsga numeric,
ADD COLUMN prcc_c numeric,
ADD COLUMN conml text,
ADD COLUMN fyrc numeric,
ADD COLUMN sic numeric;


--CREATE TEMP TABLE W COMPUSTAT INFO FROM CSV FILE
CREATE TABLE temp_compustat (
       gvkey numeric,
       fyear numeric,
       cusip text,
       assets numeric,
       ceq numeric,
       cogs numeric,
       csho numeric,
       ebit numeric,
       ebitda numeric,
       emp numeric,
       ibc numeric,
       lt numeric,
       ni numeric,
       revt numeric,
       sale numeric,
       teq numeric,
       txdb numeric,
       xsga numeric,
       prcc_c numeric,
       conml text,
       fyrc numeric,
       sic numeric
);

\copy temp_compustat FROM '~/projects/def-mcorrito/mcorrito/create_gd_db/cult_measure_upload/annual_comp.csv' DELIMITER ',' quote '"' CSV HEADER;

UPDATE firm_chars
SET cusip = temp_compustat.cusip,
    assets = temp_compustat.assets,
    ceq = temp_compustat.ceq,
    cogs = temp_compustat.cogs,
    csho = temp_compustat.csho,
    ebit = temp_compustat.ebit,
    ebitda = temp_compustat.ebitda,
    emp = temp_compustat.emp,
    ibc = temp_compustat.ibc,
    lt = temp_compustat.lt,
    ni = temp_compustat.ni,
    revt = temp_compustat.revt,
    sale = temp_compustat.sale,
    teq = temp_compustat.teq,
    txdb = temp_compustat.txdb,
    xsga = temp_compustat.xsga,
    prcc_c = temp_compustat.prcc_c,
    conml = temp_compustat.conml,
    fyrc = temp_compustat.fyrc,
    sic = temp_compustat.sic
FROM temp_compustat
WHERE firm_chars.gvkey = temp_compustat.gvkey AND year = temp_compustat.fyear;

DROP TABLE temp_compustat;
