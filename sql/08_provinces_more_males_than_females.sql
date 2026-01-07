/*
Identifies provinces where male patient count
exceeds female patient count
*/

select pr.province_name
from patients p
join provinces pr
on p.province_id = pr.province_id
group by pr.province_name
having 
count(case when p.gender = 'M' then 1 end) >
count(case when p.gender = 'F' then 1 end);
