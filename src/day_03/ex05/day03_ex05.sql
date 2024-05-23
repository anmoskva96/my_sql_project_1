WITH VIS AS (
	(SELECT PERSON_VISITS.PIZZERIA_ID
	 FROM PERSON_VISITS
	 JOIN PERSON ON PERSON.ID = PERSON_VISITS.PERSON_ID
	 WHERE PERSON.NAME = 'Andrey')
	EXCEPT
	(SELECT DISTINCT PIZZERIA_ID
	 FROM PERSON_ORDER
	 JOIN PERSON ON PERSON.ID = PERSON_ORDER.PERSON_ID
	 JOIN MENU ON MENU.ID = PERSON_ORDER.MENU_ID
	 WHERE PERSON.NAME = 'Andrey'))
SELECT PIZZERIA.NAME AS PIZZERIA_NAME
FROM VIS
JOIN PIZZERIA ON PIZZERIA.ID = VIS.PIZZERIA_ID