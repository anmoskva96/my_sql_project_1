WITH ONE AS
	(SELECT PIZZERIA.NAME, COUNT(PERSON_ORDER.ID) AS COUNT
		FROM PIZZERIA
		JOIN MENU ON PIZZERIA.ID = MENU.PIZZERIA_ID
		JOIN PERSON_ORDER ON MENU.ID = PERSON_ORDER.MENU_ID
		GROUP BY PIZZERIA.NAME
		ORDER BY 2 DESC), TWO AS
	(SELECT PIZZERIA.NAME, COUNT(PERSON_VISITS.ID) AS COUNT
		FROM PIZZERIA
		JOIN PERSON_VISITS ON PIZZERIA.ID = PERSON_VISITS.PIZZERIA_ID
		GROUP BY PIZZERIA.NAME
		ORDER BY 2 DESC), ALLS AS
	(SELECT TWO.NAME, COUNT FROM TWO
		UNION ALL SELECT ONE.NAME, COUNT FROM ONE
		ORDER BY 1 DESC)
SELECT NAME, SUM(COUNT) AS TOTAL_COUNT
FROM ALLS
GROUP BY NAME
ORDER BY 2 DESC, 1