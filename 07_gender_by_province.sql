/*
Shows male vs female patient counts per province
*/

select pr.province_name,
count(case when p.gender = 'M' then 1 end) as male_count,
count(case when p.gender = 'F' then 1 end) as female_count
from patients p
join provinces pr
on p.province_id = pr.province_id
group by pr.province_name;