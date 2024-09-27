-- create transactions table
--   transaction number is generated automatically
--   timestamp is updated when changed
CREATE OR REPLACE TABLE MYLIB/TRANS
(
 TRN_NBR INT CHECK (TRN_NBR > 0) NOT NULL GENERATED ALWAYS AS IDENTITY,
 TRN_ITM INT CHECK (TRN_ITM > 0) NOT NULL,
 TRN_LOC INT NOT NULL,
 TRN_QTY INT NOT NULL,
 TRN_TYP CHAR(3) NOT NULL,
 TRN_TIM TIMESTAMP FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP NOT NULL,
 TRN_USR CHAR(10) NOT NULL
) RCDFMT RTRN
  ON REPLACE PRESERVE ROWS;

-- add primary key
ALTER TABLE MYLIB/TRANS
 ADD PRIMARY KEY(TRN_NBR) ;

-- add foreign keys

-- add table label (object text description)
LABEL ON TABLE MYLIB/TRANS IS 'Transaction Ledger' ;

-- add column labels
LABEL ON COLUMN MYLIB/TRANS
(
 TRN_NBR IS 'Transaction#',
 TRN_ITM IS 'Item',
 TRN_LOC IS 'Location',
 TRN_QTY IS 'Quantity',
 TRN_TYP IS 'Type',
 TRN_TIM IS 'Updated',
 TRN_USR IS 'User'
) ;
