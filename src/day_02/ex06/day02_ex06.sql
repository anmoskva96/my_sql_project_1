WITH ORDERS AS
	(SELECT NAME, MENU_ID
	FROM PERSON_ORDER
	JOIN PERSON ON PERSON.ID = PERSON_ID
	WHERE PERSON.NAME = 'Anna' OR PERSON.NAME = 'Denis')
SELECT PIZZA_NAME, PIZZERIA.NAME AS PIZZERIA_NAME
FROM MENU
JOIN PIZZERIA ON PIZZERIA.ID = PIZZERIA_ID
JOIN ORDERS ON ORDERS.MENU_ID = MENU.ID
ORDER BY PIZZA_NAME, PIZZERIA_NAME