CREATE VIEW WingA_Soldiers_Vehicles AS
SELECT S.id, S.idf_num, S.name, S.rank, V.license_num, V.model, V.type
FROM SOLDIER S
LEFT JOIN DRIVER D ON S.id = D.id
LEFT JOIN VEHICLE V ON D.license_num = V.license_num;

SELECT * FROM WingA_Soldiers_Vehicles WHERE license_num IS NULL;
SELECT * FROM WingA_Soldiers_Vehicles;


CREATE VIEW WingBB_Soldiers_Roles AS
SELECT S.id, S.first_name, S.last_name, S.rank, S.religion, C.qualification, C.in_training
FROM SOLIDER S
LEFT JOIN COMBAT_MEDIC C ON S.id = C.id;

SELECT * FROM WingBB_Soldiers_Roles;
SELECT * FROM WingBB_Soldiers_Roles WHERE in_training = 1;
