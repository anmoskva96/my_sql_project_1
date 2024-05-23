CREATE OR REPLACE FUNCTION FNC_PERSON_VISITS_AND_EATS_ON_DATE(
	IN PPERSON varchar DEFAULT 'Dmitriy', 
	IN PPRICE numeric DEFAULT 500,
	IN PDATE date DEFAULT '2022-01-08'::date)
	RETURNS TABLE (PIZZERIA_NAME varchar) AS $$
begin
return query
select  pizzeria.name as pizzeria_name
FROM person_visits
join menu on menu.pizzeria_id = person_visits.pizzeria_id
join pizzeria on pizzeria.id = person_visits.pizzeria_id
join person on person.id = person_visits.person_id
where person_visits.visit_date = pdate and menu.price < pprice and person.name = pperson;
end;
$$ LANGUAGE PLPGSQL;

SELECT * FROM FNC_PERSON_VISITS_AND_EATS_ON_DATE(PPRICE := 800);

SELECT * FROM FNC_PERSON_VISITS_AND_EATS_ON_DATE(PPERSON := 'Anna',PPRICE := 1300,PDATE := '2022-01-01');