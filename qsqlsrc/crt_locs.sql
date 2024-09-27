-- create locations table
CREATE OR REPLACE TABLE MYLIB/LOCATIONS
(
 LOC_NBR INT CHECK (LOC_NBR >= 0) NOT NULL,
 LOC_NAM CHAR(30) NOT NULL,
 LOC_CAP INT
) RCDFMT RLOC
  ON REPLACE PRESERVE ROWS;

-- add primary key
ALTER TABLE MYLIB/LOCATIONS
 ADD PRIMARY KEY(LOC_NBR) ;

-- add table label (object text description)
LABEL ON TABLE MYLIB/LOCATIONS IS 'Locations Master Table' ;

-- add column labels
LABEL ON COLUMN MYLIB/LOCATIONS
(
 LOC_NBR IS 'Location#',
 LOC_NAM IS 'Name',
 LOC_CAP IS 'Capacity'
) ;
