-- Allowing NULL values in the driver's 'status' column --
ALTER TABLE driver
MODIFY (status VARCHAR2(100));

-- Making Turai the default rank for soldiers --
Alter table soldier
Modify (rank VARCHAR2(100) default 'Turai');

/*Insert into soldier(ID, idf_num, Name, Enlistment_Date_)
Values (870363085, 444444, 'Shalom', TO_DATE('2000-01-01', 'YYYY-MM-DD'));*/

-- Making sure license type is one of A, B, C or D --
ALTER TABLE driver
ADD CONSTRAINT chk_license_type
CHECK (license_type IN ('A', 'B', 'C', 'D'));

/*Insert into driver(license, status, license_type, id, license_num)
Values(1111111111, 'Active', 'F', 870363085, 3456789);*/

-- Ensuring a seller's 'total_sales_' is positive --
ALTER TABLE seller
ADD CONSTRAINT chk_positive_amount
CHECK (total_sales_ >= 0);

/*Insert into seller(shift, total_sales_, supervisor_id, seller_num, id, shekem_num)
Values('Day', -5, 3745933, 57577, 870363085, 3456789);*/