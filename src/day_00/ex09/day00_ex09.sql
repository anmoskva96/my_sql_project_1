select
	(select person.name from person where id = pv.person_id) as person_name,
	(select pizzeria.name from pizzeria where id = pv.pizzeria_id) as pizzeria_name
from
	(select * from person_visits
	 where visit_date = '2022-01-07' or visit_date = '2022-01-08' or visit_date = '2022-01-09') as pv
order by person_name, pizzeria_name desc