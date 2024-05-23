SELECT PERSON.NAME AS PERSON_NAME,
	MENU.PIZZA_NAME AS PIZZA_NAME,
	PIZZERIA.NAME AS PIZZERIA_NAME
FROM PERSON_ORDER
JOIN PERSON ON PERSON.ID = PERSON_ORDER.PERSON_ID
JOIN MENU ON MENU_ID = MENU.ID
JOIN PIZZERIA ON MENU.PIZZERIA_ID = PIZZERIA.ID
ORDER BY PERSON_NAME, PIZZA_NAME, PIZZERIA_NAME