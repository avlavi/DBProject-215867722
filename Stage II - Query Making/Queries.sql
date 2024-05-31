-- Details of drivers that have orders on the month of their enlistment --
select rank, name, idf_num
from driver D 
join soldier S on D.id = S.id
where exists
      (select *
      from delivery O
      where extract(month from enlistment_date_) = extract(month from delivery_date)
      and D.id = O.id)
order by license_num desc;

-- Types of cars that don't have deliveries to the Kirya --
Select distinct model, type
From vehicle, driver
Where id not in
      (Select id
      From delivery 
      natural join brings_to
      natural join shekem
      Where base_name in
            (Select base_name
            From shekem S
            Where S.base_name = 'Kirya'));              

-- Average number of sales per rank of sellers that have dried products in their shekem --
Select rank, avg(total_sales_)
From seller S 
join soldier F on F.id = S.id
Where shekem_num in
      (Select shekem_num
      From has natural join product
      Where product_name like 'Dried%'
      and S.shekem_num = shekem_num)
Group by rank;

-- Drivers with more orders than a tenth of the minimum number of sales of a seller, --
-- that were enlisted after 1990 --
Select rank, name, idf_num, enlistment_date_
From driver D 
join soldier S on D.id = S.id
join delivery O on D.id = O.id
Where extract(year from enlistment_date_) > 1990
Group by D.id, name, rank, idf_num, enlistment_date_
Having count(O.delivery_num) > any(Select (total_sales_/10) From seller);


-- Deletes sellers enlisted before 2023-10-07 and sellers whose stores have 0 products --
Delete from seller
Where (ID, Shekem_num) in 
    (Select S.ID, S.Shekem_num 
     From seller S 
     join soldier F on S.ID = F.ID 
     Where F.Enlistment_Date_ < DATE '2023-10-07'
     Union
     Select S.ID, S.Shekem_num 
     From seller S 
     join has H on S.Shekem_num = H.Shekem_num 
     Group by S.ID, S.Shekem_num
     Having count(H.Product_num) = 0);

-- Deletes deliveries to shekems with over 100 products --
Delete from brings_to
Where delivery_num in
      (Select D.delivery_num
       From delivery D
       join brings_to B on B.delivery_num = D.delivery_num
       join has H on H.shekem_num = B.shekem_num
       Group by D.delivery_num, H.product_num, H.shekem_num
       Having count(*) > 100);
DELETE FROM delivery
WHERE delivery_num IN
      (SELECT D.delivery_num
       FROM delivery D
       JOIN brings_to B ON B.delivery_num = D.delivery_num
       JOIN has H ON H.shekem_num = B.shekem_num
       GROUP BY D.delivery_num, H.product_num, H.shekem_num
       HAVING count(*) > 100);


-- Changes items spelt "P_izza"/"Ap%" and changes them to "Pizza/Apples?" --
Update product
Set product_name = 'Pizza/Apples?'
Where product_name like 'P_zza' or product_name like 'Ap%';

-- Raise the rank of drivers of rank 'Rav Samal Mitkadem' with a C/D license type and more than 200 deliveries--
Update soldier S
Set S.rank = 'Rav Samal Mitkadem'
Where S.id in 
    (Select D.id
    From driver D
    Where (D.license_type = 'c' or D.license_type = 'd')
    and D.id in 
        (Select B.id
        From delivery B
        Group by B.id
        Having count(*) > 200))
and S.rank = 'Rav Samal Rishon';



















