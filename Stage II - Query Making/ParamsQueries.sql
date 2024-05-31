-- Selects deliveries within a specific date range --
Select D.delivery_num, D.status, D.delivery_date, DR.id as driver_id
From delivery D
join driver DR on D.id = DR.id
Where D.delivery_date between TO_DATE('&start_date', 'YYYY-MM-DD') 
and TO_DATE('&end_date', 'YYYY-MM-DD')
order by delivery_date;

-- Selects shekems with no products and with a specific base name pattern --
With EmptyShekems as 
      (Select S.shekem_num
      From shekem S
      left join has H on S.shekem_num = H.shekem_num
      Group by S.shekem_num, S.base_name
      Having count(H.product_num) = 0
      and S.base_name like '&base_name_pattern')
Select ES.shekem_num, S.base_name
From EmptyShekems ES
join shekem S on ES.shekem_num = S.shekem_num;

-- Selects drivers with specific ranks provided in a list and with an 'Active' status --
Select id, name, rank
From soldier
Where rank in ('&rank1', '&rank2', '&rank3')
and id in 
    (Select D.id
    From driver D
    Where D.status = 'Active');
    
-- Selects drivers with specific license types and their recent deliveries using a hint --
Select /*+ USE_NL(D R) */ D.id, D.license, D.status, D.license_type, count(R.delivery_num) as recent_deliveries
From driver D
join delivery R on D.id = R.id
Where D.license_type in ('&license_type1', '&license_type2')
and R.delivery_date > TO_DATE('&recent_date', 'YYYY-MM-DD')
Group by D.id, D.license, D.status, D.license_type;
